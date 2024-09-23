@implementation MPMediaKitEntityTranslator

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
  v9[2] = __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke;
  v9[3] = &unk_1E3158D28;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformBlock:](_MPMediaKitEntityPropertyTranslator, "translatorForKeyPaths:valueTransformBlock:", a3, v9);
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
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPMediaKitEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", v9, _MPKeyPathValueTransformFirstKeyPath, v11, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v10);
}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformer:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformBlock:](_MPMediaKitEntityPropertyTranslator, "translatorForKeyPaths:valueTransformBlock:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);

}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformerFunction:(void *)a5
{
  id v8;
  id v9;

  v8 = a3;
  +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPMediaKitEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);

}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 payloadTransform:(id)a6
{
  id v10;
  id v11;
  id v12;
  _MPMediaKitEntityRelationshipTranslator *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[_MPMediaKitEntityRelationshipTranslator initWithRelatedMPModelClass:mediaKitType:payloadTransformBlock:]([_MPMediaKitEntityRelationshipTranslator alloc], "initWithRelatedMPModelClass:mediaKitType:payloadTransformBlock:", a4, v11, v10);

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v12, v13);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 attributePayloadTransform:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType_attributePayloadTransform___block_invoke;
  v12[3] = &unk_1E3158D50;
  v13 = v10;
  v11 = v10;
  -[MPMediaKitEntityTranslator mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:](self, "mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:", a3, a4, a5, v12);

}

- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (id)identifiersForPayload:(id)a3 context:(id)a4
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, (uint64_t)a4);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5
{
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  _MPMediaKitEntityRelationshipTranslator *v13;

  v9 = a5;
  v10 = a3;
  v11 = -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass");
  if (v11 != (objc_class *)objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaKitEntityTranslator.m"), 259, CFSTR("Can only call %s on generic object translators."), "-[MPMediaKitEntityTranslator mapRelationshipKey:toModelClass:mediaKitType:]");

  }
  v13 = -[_MPMediaKitEntityRelationshipTranslator initWithRelatedMPModelClass:mediaKitType:payloadTransformBlock:]([_MPMediaKitEntityRelationshipTranslator alloc], "initWithRelatedMPModelClass:mediaKitType:payloadTransformBlock:", a4, v9, &__block_literal_global_178);

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v10, v13);
}

void __75__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributes"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA70];
  if (v9)
    v12 = v9;
  else
    v12 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v8, "addEntriesFromDictionary:", v12);

  objc_msgSend(v5, "meta");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meta"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = (uint64_t)v11;
  objc_msgSend(v13, "addEntriesFromDictionary:", v16);

  objc_msgSend(v5, "relationships");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relationships"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = v11;
  objc_msgSend(v19, "addEntriesFromDictionary:", v18);

}

void __101__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType_attributePayloadTransform___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("attributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _NSIsNSDictionary();

  if (v10)
  {
    objc_msgSend(v7, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("attributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  }
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("attributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, void *))(v13 + 16))(v13, v14, v8, v15);

}

MPIdentifierSet *__75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v14[2] = __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2;
  v14[3] = &unk_1E315E4F8;
  v9 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v9;
  v15 = v5;
  v10 = v6;
  v11 = v5;
  v12 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", CFSTR("MediaAPI"), v8, v14);

  return v12;
}

uint64_t __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken_23306 != -1)
    dispatch_once(&buildSchemaIfNeeded_onceToken_23306, &__block_literal_global_23307);
}

+ (id)createGenericObjectTranslator
{
  uint64_t v3;
  void *v4;
  objc_super v6;

  v3 = objc_opt_class();
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MPMediaKitEntityTranslator;
  objc_msgSendSuper2(&v6, sel_createTranslatorForMPModelClass_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapIdentifierCreationKeyPaths:transformBlock:", MEMORY[0x1E0C9AA60], &__block_literal_global_150);
  return v4;
}

+ (id)createTranslatorForMPModelClass:(Class)a3
{
  void *v7;
  objc_super v8;

  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPMediaKitEntityTranslator.m"), 159, CFSTR("Use +createGenericObjectTranslator instead."));

  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MPMediaKitEntityTranslator;
  objc_msgSendSuper2(&v8, sel_createTranslatorForMPModelClass_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)translatorForType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18[0] = CFSTR("songs");
  v18[1] = CFSTR("music-videos");
  v18[2] = CFSTR("uploaded-audios");
  v18[3] = CFSTR("uploaded-videos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_13;
  v17[0] = CFSTR("playlists");
  v17[1] = CFSTR("library-playlists");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if ((v8 & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("artists")) & 1) != 0)
    goto LABEL_13;
  v16[0] = CFSTR("albums");
  v16[1] = CFSTR("library-albums");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if ((v10 & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("stations")) & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("station-events")) & 1) != 0)
    goto LABEL_13;
  v15[0] = CFSTR("curators");
  v15[1] = CFSTR("activities");
  v15[2] = CFSTR("apple-curators");
  v15[3] = CFSTR("editorial-items");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v4);

  if ((v12 & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("tv-shows")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("tv-episodes")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("music-movies")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("social-profiles")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("personal-social-profiles")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("record-labels")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("credit-artists")))
  {
LABEL_13:
    objc_msgSend(a1, "translatorForMPModelClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __49__MPMediaKitEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[MPMediaKitEntityTranslator createGenericObjectTranslator](MPMediaKitEntityTranslator, "createGenericObjectTranslator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericSong"), objc_opt_class(), CFSTR("songs"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericArtist"), objc_opt_class(), CFSTR("artists"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericAlbum"), objc_opt_class(), CFSTR("albums"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericPlaylist"), objc_opt_class(), CFSTR("playlists"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericRadioStation"), objc_opt_class(), CFSTR("stations"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericRadioStationEvent"), objc_opt_class(), CFSTR("station-events"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericGenre"), objc_opt_class(), CFSTR("genres"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericCurator"), objc_opt_class(), CFSTR("curators"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericTVShow"), objc_opt_class(), CFSTR("tv-shows"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericTVEpisode"), objc_opt_class(), CFSTR("tv-episodes"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericMovie"), objc_opt_class(), CFSTR("music-movies"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericSocialPerson"), objc_opt_class(), CFSTR("social-profiles"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericRecordLabel"), objc_opt_class(), CFSTR("record-labels"));
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:mediaKitType:", CFSTR("MPModelRelationshipGenericCreditsArtist"), objc_opt_class(), CFSTR("credit-artists"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("id");
  v31 = CFSTR("meta.formerIds");
  v32 = CFSTR("type");
  v33 = CFSTR("_MPMKT_transformedType");
  v34 = CFSTR("attributes.playParams");
  v35 = CFSTR("attributes.offers.kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapIdentifierCreationKeyPaths:transformBlock:", v2, &__block_literal_global_25584);

  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongTitle"), CFSTR("attributes.name"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySongDuration"), &unk_1E31E5998, MPTranslatorUtilitiesTransformMillisecondsToSeconds);
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("_MPModelPropertySongTrackCount"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongDiscNumber"), CFSTR("attributes.discNumber"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongTrackNumber"), CFSTR("attributes.trackNumber"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongGrouping"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongHasCredits"), CFSTR("attributes.hasCredits"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongExplicit"), &unk_1E31E59B0, &__block_literal_global_47_25590);
  v39 = CFSTR("type");
  v40 = CFSTR("_MPMKT_transformedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongArtistUploadedContent"), v3, &__block_literal_global_51_25591);

  v36 = CFSTR("type");
  v37 = CFSTR("_MPMKT_transformedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongHasVideo"), v4, &__block_literal_global_52);

  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySongArtwork"), &unk_1E31E59C8, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongShouldShowComposer"), &unk_1E31E59E0, &__block_literal_global_61);
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongCopyrightText"), CFSTR("attributes.copyright"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongVolumeNormalization"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongLibraryAdded"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongDownloadedDate"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalEnableState"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatus"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalConstraints"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongIsFavorite"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongIsDisliked"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongDateFavorited"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySongLibraryAddEligible"), &unk_1E31E59F8, _MPKeyPathValueTransformHasNonnullValue);
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalWork"), CFSTR("attributes.workName"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovement"), CFSTR("attributes.movementName"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovementCount"), CFSTR("attributes.movementCount"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongClassicalMovementNumber"), CFSTR("attributes.movementNumber"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongHasCloudSyncSource"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongYear"), &unk_1E31E5A10, &__block_literal_global_80_25597);
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongUserRating"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongCloudStatus"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongGaplessInfo"));
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongVolumeAdjustment"), MEMORY[0x1E0C9AA60], &__block_literal_global_81_25598);
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertySongTraits"), &unk_1E31E5A28, &__block_literal_global_89_25599);
  objc_msgSend(v1, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute"), CFSTR("attributes.isVocalAttenuationAllowed"));
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:", CFSTR("MPModelRelationshipSongAlbum"), objc_opt_class(), CFSTR("albums"), &__block_literal_global_105_25601);
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:", CFSTR("MPModelRelationshipSongArtist"), objc_opt_class(), CFSTR("artists"), &__block_literal_global_113);
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipSongComposer"), objc_opt_class(), CFSTR("_composers"), &__block_literal_global_121_25602);
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipSongGenre"), objc_opt_class(), CFSTR("genres"), &__block_literal_global_123_25603);
  objc_msgSend(v1, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipSongLocalFileAsset"));
  objc_msgSend(v1, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipSongHomeSharingAsset"));
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipSongLyrics"), objc_opt_class(), CFSTR("_lyrics"), &__block_literal_global_128);
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipSongStoreAsset"), objc_opt_class(), CFSTR("_storeAsset"), &__block_literal_global_135_25604);
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipSongPreviewAsset"), objc_opt_class(), CFSTR("_previewAsset"), &__block_literal_global_142_25605);
  objc_msgSend(v1, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5A40, &__block_literal_global_161);
  objc_msgSend(v5, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyLyricsHasStoreLyrics"), CFSTR("attributes.hasLyrics"));
  objc_msgSend(v5, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics"), CFSTR("attributes.hasTimeSyncedLyrics"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyLyricsHasLibraryLyrics"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyLyricsText"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyLyricsTTML"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5A58, &__block_literal_global_170);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumTitle"), CFSTR("attributes.name"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumTrackCount"), CFSTR("attributes.trackCount"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber"), CFSTR("attributes.trackCount"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumDiscCount"), CFSTR("attributes.discCount"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumHasCleanContent"), &unk_1E31E5A70, &__block_literal_global_178_25610);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumHasExplicitContent"), &unk_1E31E5A88, &__block_literal_global_183);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumIsCompilation"), CFSTR("attributes.isCompilation"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsClassical"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumReleaseDateComponents"), &unk_1E31E5AA0, &__block_literal_global_188);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumArtwork"), &unk_1E31E5AB8, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumLibraryAddEligible"), &unk_1E31E5AD0, _MPKeyPathValueTransformHasNonnullValue);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumYear"), &unk_1E31E5AE8, &__block_literal_global_195);
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumLibraryAdded"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumDownloadedDate"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalEnableState"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumKeepLocalConstraints"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumCopyrightText"), CFSTR("attributes.copyright"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumPreorder"), CFSTR("attributes.isPrerelease"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumEditorNotes"), &unk_1E31E5B00, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyAlbumShortEditorNotes"), &unk_1E31E5B18, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumVolumeNormalization"), MEMORY[0x1E0C9AA60], &__block_literal_global_206_25613);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumSongPopularity"), &unk_1E31E5B30, &__block_literal_global_211_25614);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumTraits"), &unk_1E31E5B48, &__block_literal_global_228);
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyAlbumVersionHash"), CFSTR("attributes.versionHash"));
  objc_msgSend(v6, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyAlbumClassicalExperienceAvailable"), &unk_1E31E5B60, &__block_literal_global_233);
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsFavorite"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsDisliked"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumDateFavorited"));
  objc_msgSend(v6, "mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:", CFSTR("MPModelRelationshipAlbumArtist"), objc_opt_class(), CFSTR("artists"), &__block_literal_global_234);
  objc_msgSend(v6, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipAlbumGenre"), objc_opt_class(), CFSTR("genres"), &__block_literal_global_235);
  objc_msgSend(v6, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipAlbumRepresentativeSong"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5B78, &__block_literal_global_238);
  objc_msgSend(v7, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPersonName"), CFSTR("attributes.name"));
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistHasBiography"));
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPersonHasSocialPosts"));
  objc_msgSend(v7, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyArtistArtwork"), &unk_1E31E5B90, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistEditorialArtwork"));
  objc_msgSend(v7, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyArtistClassicalExperienceAvailable"), &unk_1E31E5BA8, &__block_literal_global_244);
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistIsFavorite"));
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistIsDisliked"));
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistDateFavorited"));
  objc_msgSend(v7, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyArtistLibraryAdded"));
  objc_msgSend(v7, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipArtistGenre"), objc_opt_class(), CFSTR("genres"), &__block_literal_global_245_25617);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5BC0, &__block_literal_global_250);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPlaylistName"), CFSTR("attributes.name"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistTrackCount"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistEditorNotes"), &unk_1E31E5BD8, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistShortEditorNotes"), &unk_1E31E5BF0, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPlaylistReleaseDateComponents"), &unk_1E31E5C08, &__block_literal_global_258);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPlaylistLastModifiedDateComponents"), &unk_1E31E5C20, &__block_literal_global_263);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistArtwork"), &unk_1E31E5C38, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistEditorialArtwork"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistTracksTiledArtwork"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistHasCleanContent"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistHasExplicitContent"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPlaylistType"), &unk_1E31E5C50, &__block_literal_global_272);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistLibraryAdded"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", MPModelPropertyPlaylistDownloadedDate);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistKeepLocalEnableState"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistKeepLocalConstraints"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsOwner"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCuratorPlaylist"));
  v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistPublicPlaylist"), MEMORY[0x1E0C9AA60], _MPKeyPathValueTransformConstantYES);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistVisiblePlaylist"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistSubscribed"), v9, _MPKeyPathValueTransformConstantYES);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistUserEditableComponents"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPlaylistShareURL"), &unk_1E31E5C68, &__block_literal_global_285);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistShareShortURL"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPlaylistDescriptionText"), &unk_1E31E5C80, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPlaylistVersionHash"), CFSTR("attributes.versionHash"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPlaylistCloudVersionHash"), CFSTR("attributes.playParams.versionHash"));
  objc_msgSend(v8, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPlaylistTraits"), &unk_1E31E5C98, &__block_literal_global_297_25620);
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavorite"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsDisliked"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistDateFavorited"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistParentPersistentID"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsCollaborative"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationSharingMode"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationMode"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaboratorPermissions"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending"));
  objc_msgSend(v8, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaboratorStatus"));
  objc_msgSend(v8, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipPlaylistCurator"), objc_opt_class(), CFSTR("curators"), &__block_literal_global_298);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5CB0, &__block_literal_global_308);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationName"), CFSTR("attributes.name"));
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationLive"), CFSTR("attributes.isLive"));
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationProviderName"), CFSTR("attributes.stationProviderName"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationBeats1"));
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationEditorNotes"), &unk_1E31E5CC8, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationShortEditorNotes"), &unk_1E31E5CE0, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationHasExplicitContent"));
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationArtwork"), &unk_1E31E5CF8, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationGlyph"), &unk_1E31E5D10, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyRadioStationSubtype"), &unk_1E31E5D28, &__block_literal_global_329);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyRadioStationStartingAirDate"), &unk_1E31E5D40, &__block_literal_global_338);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyRadioStationEndingAirDate"), &unk_1E31E5D58, &__block_literal_global_343);
  objc_msgSend(v10, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationSubscriptionRequired"), CFSTR("attributes.requiresSubscription"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationAllowsItemLiking"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationType"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationAttributionLabel"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationProviderUniversalLink"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationProviderBundleIdentifier"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationProviderID"));
  objc_msgSend(v10, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyRadioStationContainsVideo"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5D70, &__block_literal_global_348);
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRadioStationEventTitle"), CFSTR("attributes.title"));
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationEventDescriptionText"), &unk_1E31E5D88, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyRadioStationEventStartTime"), &unk_1E31E5DA0, &__block_literal_global_358);
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyRadioStationEventEndTime"), &unk_1E31E5DB8, &__block_literal_global_363);
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationEventArtwork"), &unk_1E31E5DD0, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v11, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRadioStationEventHeroArtwork"), &unk_1E31E5DE8, MPMediaKitEntityTranslatorTransformArtwork);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5E00, &__block_literal_global_372);
  objc_msgSend(v12, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPersonName"), CFSTR("attributes.name"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5E18, &__block_literal_global_376);
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyPersonName"), &unk_1E31E5E30, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyCuratorHandle"), CFSTR("attributes.handle"));
  objc_msgSend(v13, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPersonHasSocialPosts"));
  objc_msgSend(v13, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyCuratorShortName"));
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyCuratorEditorNotes"), &unk_1E31E5E48, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyCuratorShortEditorNotes"), &unk_1E31E5E60, _MPKeyPathValueTransformFirstNonnullKeyPath);
  v30 = CFSTR("attributes.kind");
  v31 = CFSTR("_MPMKT_transformedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyCuratorSubKind"), v14, &__block_literal_global_390);

  v39 = CFSTR("type");
  v40 = CFSTR("_MPMKT_transformedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyCuratorKind"), v15, &__block_literal_global_397);

  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyCuratorEditorialArtwork"), &unk_1E31E5E78, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v13, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyCuratorBrandLogoArtwork"), &unk_1E31E5E90, MPMediaKitEntityTranslatorTransformArtwork);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5EA8, &__block_literal_global_408);
  objc_msgSend(v16, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyGenreName"), CFSTR("attributes.name"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E5EC0, &__block_literal_global_412);
  objc_msgSend(v17, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVShowTitle"), CFSTR("attributes.name"));
  objc_msgSend(v17, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVShowEpisodeCount"), CFSTR("attributes.episodeCount"));
  objc_msgSend(v17, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVShowEditorNotes"), CFSTR("attributes.editorialNotes.standard"));
  objc_msgSend(v17, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVShowTagline"), CFSTR("attributes.editorialNotes.tagline"));
  objc_msgSend(v17, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyTVShowArtwork"), &unk_1E31E5ED8, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v17, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVShowShortTitle"));
  objc_msgSend(v17, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVShowShortEditorNotes"));
  objc_msgSend(v17, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVShowEditorialArtwork"));
  objc_msgSend(v17, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVShowStoreCanonicalID"));
  objc_msgSend(v17, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipTVShowCreator"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("id");
  v31 = CFSTR("meta.formerIds");
  v32 = CFSTR("type");
  v33 = CFSTR("_MPMKT_transformedType");
  v34 = CFSTR("attributes.playParams");
  v35 = CFSTR("attributes.offers.kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mapIdentifierCreationKeyPaths:transformBlock:", v19, &__block_literal_global_420);

  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVEpisodeTitle"), CFSTR("attributes.name"));
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyTVEpisodeDescriptionText"), &unk_1E31E5EF0, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyTVEpisodeDuration"), &unk_1E31E5F08, &__block_literal_global_430);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyTVEpisodeNumber"), CFSTR("attributes.episodeNumber"));
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyTVEpisodeExplicitRating"), &unk_1E31E5F38, &__block_literal_global_445);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyTVEpisodeReleaseDate"), &unk_1E31E5F50, &__block_literal_global_450);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyTVEpisodeArtwork"), &unk_1E31E5F68, &__block_literal_global_455);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible"), &unk_1E31E5F98, &__block_literal_global_464);
  objc_msgSend(v18, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyTVEpisodeMusicShow"), MEMORY[0x1E0C9AA60], _MPKeyPathValueTransformConstantYES);
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeType"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeTypeDisplayName"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeLibraryAddedDate"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", MPModelPropertyTVEpisodeDownloadedDate);
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeLastDevicePlaybackDate"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"));
  objc_msgSend(v18, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints"));
  objc_msgSend(v18, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset"));
  objc_msgSend(v18, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"));
  objc_msgSend(v18, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipTVEpisodeSeason"));
  objc_msgSend(v18, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipTVEpisodeShow"), objc_opt_class(), CFSTR("tv-shows"), &__block_literal_global_467);
  objc_msgSend(v18, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipTVEpisodeStoreAsset"), objc_opt_class(), CFSTR("_storeAsset"), &__block_literal_global_470);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("id");
  v31 = CFSTR("meta.formerIds");
  v32 = CFSTR("type");
  v33 = CFSTR("_MPMKT_transformedType");
  v34 = CFSTR("attributes.playParams");
  v35 = CFSTR("attributes.offers.kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mapIdentifierCreationKeyPaths:transformBlock:", v21, &__block_literal_global_471_25629);

  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyMovieTitle"), CFSTR("attributes.name"));
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyMovieDescriptionText"), &unk_1E31E5FC8, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyMovieDuration"), &unk_1E31E5FE0, &__block_literal_global_477);
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyMovieExplicitRating"), &unk_1E31E6010, &__block_literal_global_482);
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyMovieTagline"), CFSTR("attributes.editorialNotes.tagline"));
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyMovieReleaseDate"), &unk_1E31E6028, &__block_literal_global_485);
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyMovieArtwork"), &unk_1E31E6040, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v20, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyMovieLibraryAddEligible"), &unk_1E31E6058, &__block_literal_global_490);
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieInfoDictionary"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieHasCloudSyncSource"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieLibraryAdded"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieLibraryAddedDate"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", MPModelPropertyMovieDownloadedDate);
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieLastDevicePlaybackDate"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalEnableState"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatus"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalConstraints"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieEditorialArtwork"));
  objc_msgSend(v20, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieStoreCanonicalID"));
  objc_msgSend(v20, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipMovieClips"));
  objc_msgSend(v20, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipMovieLocalFileAsset"));
  objc_msgSend(v20, "mapUnsupportedRelationshipKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"));
  objc_msgSend(v20, "mapRelationshipKey:toModelClass:mediaKitType:attributePayloadTransform:", CFSTR("MPModelRelationshipMovieStoreAsset"), objc_opt_class(), CFSTR("_storeAsset"), &__block_literal_global_493);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6088, &__block_literal_global_496);
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPersonName"), CFSTR("attributes.name"));
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySocialPersonHandle"), CFSTR("attributes.handle"));
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySocialPersonIsPrivate"), CFSTR("attributes.isPrivate"));
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySocialPersonIsVerified"), CFSTR("attributes.isVerified"));
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertySocialPersonPendingRequestsCount"), CFSTR("attributes.pendingFollowersCount"));
  objc_msgSend(v22, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertySocialPersonArtwork"), &unk_1E31E60A0, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v22, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySocialPersonUncensoredName"));
  objc_msgSend(v22, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySocialPersonBiography"));
  objc_msgSend(v22, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySocialPersonHasLightweightProfile"));

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E60B8, &__block_literal_global_508);
  objc_msgSend(v23, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyRecordLabelName"), CFSTR("attributes.name"));
  objc_msgSend(v23, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRecordLabelDescriptionText"), &unk_1E31E60D0, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v23, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRecordLabelShortDescriptionText"), &unk_1E31E60E8, _MPKeyPathValueTransformFirstNonnullKeyPath);
  objc_msgSend(v23, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRecordLabelArtwork"), &unk_1E31E6100, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v23, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyRecordLabelEditorialArtwork"), &unk_1E31E6118, MPMediaKitEntityTranslatorTransformArtwork);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6130, &__block_literal_global_522);
  objc_msgSend(v24, "mapPropertyKey:toPayloadKeyPath:", CFSTR("MPModelPropertyPersonName"), CFSTR("attributes.name"));
  objc_msgSend(v24, "mapPropertyKey:toPayloadKeyPaths:valueTransformerFunction:", CFSTR("MPModelPropertyCreditsArtistArtwork"), &unk_1E31E6148, MPMediaKitEntityTranslatorTransformArtwork);
  objc_msgSend(v24, "mapRelationshipKey:toModelClass:mediaKitType:payloadTransform:", CFSTR("MPModelRelationshipCreditsArtistRelatedArtist"), objc_opt_class(), CFSTR("artists"), &__block_literal_global_526);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6160, &__block_literal_global_529);
  v30 = CFSTR("_MPMKT_transformedType");
  v31 = CFSTR("attributes.playParams");
  v32 = CFSTR("attributes.offers.kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyStoreAssetEndpointType"), v26, &__block_literal_global_531);

  objc_msgSend(v25, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyStoreAssetRedownloadParameters"));
  v39 = CFSTR("_MPMKT_transformedType");
  v40 = CFSTR("attributes.playParams");
  v41 = CFSTR("attributes.offers.kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyStoreAssetRedownloadable"), v27, &__block_literal_global_532);

  objc_msgSend(v25, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyStoreAssetAccountIdentifier"));
  objc_msgSend(v25, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents"), &unk_1E31E6178, &__block_literal_global_537);
  objc_msgSend(v25, "mapUnsupportedPropertyKey:", MPModelPropertyStoreAssetNeedsUserUpload);
  v36 = CFSTR("_MPMKT_transformedType");
  v37 = CFSTR("attributes.playParams");
  v38 = CFSTR("attributes.videoKind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyStoreAssetSubscriptionRequired"), v28, &__block_literal_global_540);

  +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:](MPMediaKitEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mapIdentifierCreationKeyPaths:transformBlock:", &unk_1E31E6190, &__block_literal_global_545);
  objc_msgSend(v29, "mapPropertyKey:toPayloadKeyPaths:valueTransformer:", CFSTR("MPModelPropertyPreviewAssetURL"), &unk_1E31E61A8, &__block_literal_global_551);

}

@end
