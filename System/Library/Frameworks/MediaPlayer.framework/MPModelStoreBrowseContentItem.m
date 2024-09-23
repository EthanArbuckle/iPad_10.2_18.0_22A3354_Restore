@implementation MPModelStoreBrowseContentItem

+ (id)__song_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipSong");
}

+ (id)__socialPerson_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipSocialPerson");
}

+ (id)__show_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipTVShow");
}

+ (id)__showCreator_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipTVShowCreator");
}

+ (id)__season_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipTVSeason");
}

+ (id)__recordLabel_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipRecordLabel");
}

+ (id)__radioStation_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation");
}

+ (id)__playlist_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist");
}

+ (id)__movie_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipMovie");
}

+ (id)__mediaClip_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipMediaClip");
}

+ (id)__itemType_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
}

+ (id)__episode_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipTVEpisode");
}

+ (id)__detailedItemType_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType");
}

+ (id)__curator_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipCurator");
}

+ (id)__creditsArtist_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipCreditsArtist");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipArtist");
}

+ (id)__artistUploadedContentType_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemPropertyArtistUploadedContentType");
}

+ (id)__album_KEY
{
  return CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum");
}

void __90__MPModelStoreBrowseContentItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  switch(objc_msgSend(*(id *)(a1 + 32), "itemType"))
  {
    case 1:
      objc_msgSend(v3, "setAlbum:", *(_QWORD *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(v3, "setArtist:", *(_QWORD *)(a1 + 40));
      break;
    case 3:
      objc_msgSend(v3, "setCurator:", *(_QWORD *)(a1 + 40));
      break;
    case 4:
      objc_msgSend(v3, "setPlaylist:", *(_QWORD *)(a1 + 40));
      break;
    case 5:
      objc_msgSend(v3, "setRadioStation:", *(_QWORD *)(a1 + 40));
      break;
    case 6:
      objc_msgSend(v3, "setSocialPerson:", *(_QWORD *)(a1 + 40));
      break;
    case 7:
      objc_msgSend(v3, "setSong:", *(_QWORD *)(a1 + 40));
      break;
    case 8:
      objc_msgSend(v3, "setEpisode:", *(_QWORD *)(a1 + 40));
      break;
    case 9:
      objc_msgSend(v3, "setShow:", *(_QWORD *)(a1 + 40));
      break;
    case 10:
      objc_msgSend(v3, "setSeason:", *(_QWORD *)(a1 + 40));
      break;
    case 11:
      objc_msgSend(v3, "setShowCreator:", *(_QWORD *)(a1 + 40));
      break;
    case 12:
      objc_msgSend(v3, "setMovie:", *(_QWORD *)(a1 + 40));
      break;
    case 14:
      objc_msgSend(v3, "setRecordLabel:", *(_QWORD *)(a1 + 40));
      break;
    case 15:
      objc_msgSend(v3, "setCreditsArtist:", *(_QWORD *)(a1 + 40));
      break;
    default:
      break;
  }

}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  void *v2;
  void *v3;

  -[MPModelStoreBrowseContentItem innerObject](self, "innerObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relativeModelObjectForStoreLibraryPersonalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)innerObject
{
  void *v3;

  switch(-[MPModelStoreBrowseContentItem itemType](self, "itemType"))
  {
    case 1:
      -[MPModelStoreBrowseContentItem album](self, "album");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[MPModelStoreBrowseContentItem artist](self, "artist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[MPModelStoreBrowseContentItem curator](self, "curator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[MPModelStoreBrowseContentItem playlist](self, "playlist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[MPModelStoreBrowseContentItem radioStation](self, "radioStation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelStoreBrowseContentItem socialPerson](self, "socialPerson");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[MPModelStoreBrowseContentItem song](self, "song");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[MPModelStoreBrowseContentItem episode](self, "episode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[MPModelStoreBrowseContentItem show](self, "show");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[MPModelStoreBrowseContentItem season](self, "season");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[MPModelStoreBrowseContentItem showCreator](self, "showCreator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[MPModelStoreBrowseContentItem movie](self, "movie");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[MPModelStoreBrowseContentItem mediaClip](self, "mediaClip");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[MPModelStoreBrowseContentItem recordLabel](self, "recordLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[MPModelStoreBrowseContentItem creditsArtist](self, "creditsArtist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
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
  v9[2] = __90__MPModelStoreBrowseContentItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1E3159950;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[MPModelObject copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  MPPropertySet *v53;
  void *v54;
  MPPropertySet *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelAlbum requiredStoreLibraryPersonalizationProperties](MPModelAlbum, "requiredStoreLibraryPersonalizationProperties");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v63 = v6;

  objc_msgSend(v2, "setObject:forKey:", v63, CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum"));
  +[MPModelArtist requiredStoreLibraryPersonalizationProperties](MPModelArtist, "requiredStoreLibraryPersonalizationProperties");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v3;
  v62 = v9;

  objc_msgSend(v2, "setObject:forKey:", v62, CFSTR("MPModelStoreBrowseContentItemRelationshipArtist"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelCurator, "requiredStoreLibraryPersonalizationProperties");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v3;
  v61 = v12;

  objc_msgSend(v2, "setObject:forKey:", v61, CFSTR("MPModelStoreBrowseContentItemRelationshipCurator"));
  +[MPModelMovie requiredStoreLibraryPersonalizationProperties](MPModelMovie, "requiredStoreLibraryPersonalizationProperties");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v3;
  v60 = v15;

  objc_msgSend(v2, "setObject:forKey:", v60, CFSTR("MPModelStoreBrowseContentItemRelationshipMovie"));
  +[MPModelPlaylist requiredStoreLibraryPersonalizationProperties](MPModelPlaylist, "requiredStoreLibraryPersonalizationProperties");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v3;
  v59 = v18;

  objc_msgSend(v2, "setObject:forKey:", v59, CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelRadioStation, "requiredStoreLibraryPersonalizationProperties");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v3;
  v58 = v21;

  objc_msgSend(v2, "setObject:forKey:", v58, CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation"));
  +[MPModelSong requiredStoreLibraryPersonalizationProperties](MPModelSong, "requiredStoreLibraryPersonalizationProperties");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = v3;
  v57 = v24;

  objc_msgSend(v2, "setObject:forKey:", v57, CFSTR("MPModelStoreBrowseContentItemRelationshipSong"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelSocialPerson, "requiredStoreLibraryPersonalizationProperties");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (void *)v25;
  else
    v27 = v3;
  v28 = v27;

  objc_msgSend(v2, "setObject:forKey:", v28, CFSTR("MPModelStoreBrowseContentItemRelationshipSocialPerson"));
  +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties](MPModelTVEpisode, "requiredStoreLibraryPersonalizationProperties");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (void *)v29;
  else
    v31 = v3;
  v32 = v31;

  objc_msgSend(v2, "setObject:forKey:", v32, CFSTR("MPModelStoreBrowseContentItemRelationshipTVEpisode"));
  +[MPModelTVSeason requiredStoreLibraryPersonalizationProperties](MPModelTVSeason, "requiredStoreLibraryPersonalizationProperties");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v3;
  v36 = v35;

  objc_msgSend(v2, "setObject:forKey:", v36, CFSTR("MPModelStoreBrowseContentItemRelationshipTVSeason"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelTVShow, "requiredStoreLibraryPersonalizationProperties");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = v3;
  v40 = v39;

  objc_msgSend(v2, "setObject:forKey:", v40, CFSTR("MPModelStoreBrowseContentItemRelationshipTVShow"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelTVShowCreator, "requiredStoreLibraryPersonalizationProperties");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v41)
    v43 = (void *)v41;
  else
    v43 = v3;
  v44 = v43;

  objc_msgSend(v2, "setObject:forKey:", v44, CFSTR("MPModelStoreBrowseContentItemRelationshipTVShowCreator"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelRecordLabel, "requiredStoreLibraryPersonalizationProperties");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
    v47 = (void *)v45;
  else
    v47 = v3;
  v48 = v47;

  objc_msgSend(v2, "setObject:forKey:", v48, CFSTR("MPModelStoreBrowseContentItemRelationshipRecordLabel"));
  +[NSObject requiredStoreLibraryPersonalizationProperties](MPModelCreditsArtist, "requiredStoreLibraryPersonalizationProperties");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  if (v49)
    v51 = (void *)v49;
  else
    v51 = v3;
  v52 = v51;

  objc_msgSend(v2, "setObject:forKey:", v52, CFSTR("MPModelStoreBrowseContentItemRelationshipCreditsArtist"));
  v53 = [MPPropertySet alloc];
  v64[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[MPPropertySet initWithProperties:relationships:](v53, "initWithProperties:relationships:", v54, v2);

  return v55;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(a3, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPModelStoreBrowseContentItem itemType](self, "itemType") - 1;
  if (v5 > 0xE
    || ((0x6FFFu >> v5) & 1) == 0
    || (objc_msgSend(v4, "objectForKey:", off_1E3159970[v5]), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (void)__MPModelStoreBrowseContentItemPropertyItemType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 35, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemPropertyItemType"));

}

+ (void)__MPModelStoreBrowseContentItemPropertyDetailedItemType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 36, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemPropertyDetailedItemType"));

}

+ (void)__MPModelStoreBrowseContentItemPropertyArtistUploadedContentType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 37, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemPropertyArtistUploadedContentType"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipAlbum__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 38, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipAlbum"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 39, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipArtist"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipCurator__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 40, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipCurator"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipMediaClip__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 41, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipMediaClip"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipMovie__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 42, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipMovie"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 43, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipPlaylist"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipRadioStation__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 44, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipRadioStation"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipSocialPerson__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 45, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipSocialPerson"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipSong__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 46, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipSong"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVEpisode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 47, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVEpisode"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVSeason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 48, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVSeason"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVShow__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 49, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVShow"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVShowCreator__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 50, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVShowCreator"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipRecordLabel__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 51, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipRecordLabel"));

}

+ (void)__MPModelStoreBrowseContentItemRelationshipCreditsArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseContentItem.m"), 52, CFSTR("Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipCreditsArtist"));

}

@end
