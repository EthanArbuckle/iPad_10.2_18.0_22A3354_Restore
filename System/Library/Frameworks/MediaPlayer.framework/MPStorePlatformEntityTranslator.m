@implementation MPStorePlatformEntityTranslator

- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v35.receiver = self;
  v35.super_class = (Class)MPStorePlatformEntityTranslator;
  -[MPBaseEntityTranslator prepareSource:context:properties:](&v35, sel_prepareSource_context_properties_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        -[MPBaseEntityTranslator propertyTranslatorForPropertyKey:]((id *)&self->super.super.isa, *(void **)(*((_QWORD *)&v31 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sourceKeyPaths");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v9, "valueForKeyPath:", v24, (_QWORD)v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v21);
  }

  return v18;
}

- (void)mapIdentifierCreationKeyPaths:(id)a3 transformBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke;
  v9[3] = &unk_1E315E520;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformBlock:](_MPStorePlatformEntityPropertyTranslator, "translatorForKeyPaths:valueTransformBlock:", a3, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapIdentifiersToPropertyTranslator:]((id *)&self->super.super.isa, v8);

}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPath:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPStorePlatformEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", v9, _MPKeyPathValueTransformFirstKeyPath, v11, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v10);
}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformer:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformBlock:](_MPStorePlatformEntityPropertyTranslator, "translatorForKeyPaths:valueTransformBlock:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);

}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformerFunction:(void *)a5
{
  id v8;
  id v9;

  v8 = a3;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPStorePlatformEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);

}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 payloadTransform:(id)a5
{
  id v8;
  id v9;
  _MPStorePlatformEntityRelationshipTranslator *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_MPStorePlatformEntityRelationshipTranslator initWithRelatedMPModelClass:payloadTransformBlock:]([_MPStorePlatformEntityRelationshipTranslator alloc], "initWithRelatedMPModelClass:payloadTransformBlock:", a4, v8);

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v9, v10);
}

- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (id)identifiersForPayload:(id)a3 context:(id)a4
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, (uint64_t)a4);
}

MPIdentifierSet *__80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MPIdentifierSet *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  MPIdentifierSet *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = [MPIdentifierSet alloc];
  +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_msgSend(*(id *)(a1 + 32), "MPModelClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2;
  v14[3] = &unk_1E315E4F8;
  v9 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v9;
  v15 = v5;
  v10 = v6;
  v11 = v5;
  v12 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v8, v14);

  return v12;
}

uint64_t __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken_38956 != -1)
    dispatch_once(&buildSchemaIfNeeded_onceToken_38956, &__block_literal_global_38957);
}

+ (id)translatorForKind:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = CFSTR("song");
  v9[1] = CFSTR("musicVideo");
  v9[2] = CFSTR("uploadedAudio");
  v9[3] = CFSTR("uploadedVideo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("playlist")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("artist")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("album")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("radioStation")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("tvEpisode")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("tvSeason")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("tvShow")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("movie")))
  {
    objc_msgSend(a1, "translatorForMPModelClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __54__MPStorePlatformEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v0, "mapIdentifierCreationKeyPaths:transformBlock:", MEMORY[0x1E0C9AA60], &__block_literal_global_39477);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6268, &__block_literal_global_14_39479);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySongTitle"), &unk_1E31E6280, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongDuration"), &unk_1E31E6298, &__block_literal_global_30_39481);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("_MPModelPropertySongTrackCount"), &unk_1E31E62B0, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongTrackNumber"), CFSTR("trackNumber"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongDiscNumber"), CFSTR("discNumber"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongHasCredits"), CFSTR("hasCredits"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongGrouping"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySongExplicit"), &unk_1E31E62C8, MPTranslatorUtilitiesTransformIsExplicit);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongArtistUploadedContent"), &unk_1E31E62E0, &__block_literal_global_54);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongHasVideo"), &unk_1E31E62F8, &__block_literal_global_61_39486);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongArtwork"), v1, &__block_literal_global_64_39487);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongShouldShowComposer"), CFSTR("showComposer"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongCopyrightText"), CFSTR("copyright"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongVolumeNormalization"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongLibraryAdded"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalEnableState"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatus"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalConstraints"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongLibraryAddEligible"), &unk_1E31E6310, &__block_literal_global_73);
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalWork"), CFSTR("workName"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovement"), CFSTR("movementName"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovementCount"), CFSTR("movementCount"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovementNumber"), CFSTR("movementNumber"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongHasCloudSyncSource"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongYear"), &unk_1E31E6328, &__block_literal_global_88_39495);
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongUserRating"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongCloudStatus"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongGaplessInfo"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongIsFavorite"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongIsDisliked"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongDateFavorited"));
  objc_msgSend(v2, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute"));
  objc_msgSend(v2, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongVolumeAdjustment"), v1, &__block_literal_global_89_39496);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongAlbum"), objc_opt_class(), &__block_literal_global_93_39497);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongArtist"), objc_opt_class(), &__block_literal_global_110_39498);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongComposer"), objc_opt_class(), &__block_literal_global_117_39499);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongGenre"), objc_opt_class(), &__block_literal_global_122_39500);
  objc_msgSend(v2, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipSongLocalFileAsset"));
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongLyrics"), objc_opt_class(), &__block_literal_global_125_39501);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongStoreAsset"), objc_opt_class(), &__block_literal_global_132);
  objc_msgSend(v2, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipSongPlaybackPosition"), objc_opt_class(), &__block_literal_global_135_39502);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6340, &__block_literal_global_155_39503);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumTitle"), &unk_1E31E6358, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumTrackCount"), &unk_1E31E6370, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber"), CFSTR("@max.children.trackNumber"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumDiscCount"), CFSTR("discCount"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumHasCleanContent"), &unk_1E31E6388, &__block_literal_global_166);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumHasExplicitContent"), &unk_1E31E63A0, &__block_literal_global_171_39506);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumIsCompilation"), CFSTR("isCompilation"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsClassical"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumReleaseDateComponents"), &unk_1E31E63B8, &__block_literal_global_178_39509);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumArtwork"), v1, &__block_literal_global_179);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumLibraryAddEligible"), &unk_1E31E63D0, &__block_literal_global_186);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumYear"), &unk_1E31E63E8, &__block_literal_global_189);
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumVersionHash"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumLibraryAdded"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalEnableState"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalConstraints"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumCopyrightText"), CFSTR("copyright"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumPreorder"), CFSTR("isPreorder"));
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumEditorNotes"), &unk_1E31E6400, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumShortEditorNotes"), &unk_1E31E6418, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumVolumeNormalization"), v1, &__block_literal_global_198_39511);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumSongPopularity"), &unk_1E31E6430, &__block_literal_global_201_39512);
  objc_msgSend(v3, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumClassicalExperienceAvailable"), &unk_1E31E6448, &__block_literal_global_206_39514);
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsFavorite"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsDisliked"));
  objc_msgSend(v3, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumDateFavorited"));
  objc_msgSend(v3, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipAlbumArtist"), objc_opt_class(), &__block_literal_global_207_39515);
  objc_msgSend(v3, "mapRelationshipKey:toModelClass:payloadTransform:", CFSTR("MPModelRelationshipAlbumGenre"), objc_opt_class(), &__block_literal_global_208_39516);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6460, &__block_literal_global_211_39518);
  objc_msgSend(v4, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyArtistClassicalExperienceAvailable"), &unk_1E31E6478, &__block_literal_global_215_39519);
  objc_msgSend(v4, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistIsFavorite"));
  objc_msgSend(v4, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistIsDisliked"));
  objc_msgSend(v4, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistDateFavorited"));
  objc_msgSend(v4, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistLibraryAdded"));
  objc_msgSend(v4, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPlaylistName"), CFSTR("name"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6490, &__block_literal_global_221_39521);
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavorite"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsDisliked"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistDateFavorited"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist"));
  objc_msgSend(v5, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPersonName"), CFSTR("name"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E64A8, &__block_literal_global_226);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVEpisodeTitle"), CFSTR("name"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E64C0, &__block_literal_global_230);
  objc_msgSend(v7, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyMovieTitle"), CFSTR("name"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPStorePlatformEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E64D8, &__block_literal_global_234_39522);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationName"), CFSTR("name"));

}

@end
