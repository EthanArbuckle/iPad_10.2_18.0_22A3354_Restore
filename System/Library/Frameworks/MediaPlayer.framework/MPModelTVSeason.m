@implementation MPModelTVSeason

+ (id)__year_KEY
{
  return CFSTR("MPModelPropertyTVSeasonYear");
}

+ (id)__sortType_KEY
{
  return CFSTR("MPModelPropertyTVSeasonSortType");
}

+ (id)__show_KEY
{
  return CFSTR("MPModelRelationshipTVSeasonShow");
}

+ (id)__representativeEpisode_KEY
{
  return CFSTR("MPModelRelationshipTVSeasonRepresentativeEpisode");
}

+ (id)__number_KEY
{
  return CFSTR("MPModelPropertyTVSeasonNumber");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyTVSeasonLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyTVSeasonLibraryAddedDate");
}

+ (id)__libraryAddEligible_KEY
{
  return CFSTR("MPModelPropertyTVSeasonLibraryAddEligible");
}

+ (id)__hasExplicitContent_KEY
{
  return CFSTR("MPModelPropertyTVSeasonHasExplicitContent");
}

+ (id)__hasCleanContent_KEY
{
  return CFSTR("MPModelPropertyTVSeasonHasCleanContent");
}

+ (id)__episodesCount_KEY
{
  return CFSTR("MPModelPropertyTVSeasonEpisodesCount");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertyTVSeasonDownloadedDate");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyTVSeasonDescriptionText");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyTVSeasonArtwork");
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  return +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

+ (id)kindWithEpisodeKind:(id)a3
{
  return +[MPModelTVSeasonKind kindWithEpisodeKind:](MPModelTVSeasonKind, "kindWithEpisodeKind:", a3);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyTVSeasonHasCleanContent");
  v5[1] = CFSTR("MPModelPropertyTVSeasonHasExplicitContent");
  v5[2] = CFSTR("MPModelPropertyTVSeasonLibraryAddEligible");
  v5[3] = CFSTR("MPModelPropertyTVSeasonLibraryAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[MPModelTVSeason isLibraryAdded](self, "isLibraryAdded");
  v4 = -[MPModelTVSeason hasCleanContent](self, "hasCleanContent");
  v5 = -[MPModelTVSeason hasExplicitContent](self, "hasExplicitContent");
  v6 = -[MPModelTVSeason isLibraryAddEligible](self, "isLibraryAddEligible");
  v7 = 0x100000000;
  if (!v6)
    v7 = 0;
  v8 = 0x1000000;
  if (!v5)
    v8 = 0;
  v9 = 0x10000;
  if (!v4)
    v9 = 0;
  v10 = 257;
  if (!v3)
    v10 = 1;
  return (MPLibraryAddStatusObserverConfiguration)(v10 | v9 | v8 | v7);
}

+ (int64_t)genericObjectType
{
  return 7;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TV season %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVSeasonNumber"))
    && -[MPModelTVSeason number](self, "number") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Season %ld "), -[MPModelTVSeason number](self, "number"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertString:atIndex:", v7, 0);

  }
  return v6;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelTVSeason artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelTVSeason *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyTVSeasonNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 81, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonNumber"));

}

+ (void)__MPModelPropertyTVSeasonDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 82, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonDescriptionText"));

}

+ (void)__MPModelPropertyTVSeasonYear__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 83, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonYear"));

}

+ (void)__MPModelPropertyTVSeasonEpisodesCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 84, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonEpisodesCount"));

}

+ (void)__MPModelPropertyTVSeasonHasCleanContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 85, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonHasCleanContent"));

}

+ (void)__MPModelPropertyTVSeasonHasExplicitContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 86, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonHasExplicitContent"));

}

+ (void)__MPModelPropertyTVSeasonLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 87, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonLibraryAddedDate"));

}

+ (void)__MPModelPropertyTVSeasonLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 88, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonLibraryAdded"));

}

+ (void)__MPModelPropertyTVSeasonLibraryAddEligible__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 89, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonLibraryAddEligible"));

}

+ (void)__MPModelPropertyTVSeasonSortType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 90, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonSortType"));

}

+ (void)__MPModelRelationshipTVSeasonShow__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 92, CFSTR("Translator was missing mapping for MPModelRelationshipTVSeasonShow"));

}

+ (void)__MPModelRelationshipTVSeasonRepresentativeEpisode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 93, CFSTR("Translator was missing mapping for MPModelRelationshipTVSeasonRepresentativeEpisode"));

}

+ (void)__MPModelPropertyTVSeasonArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 94, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonArtwork"));

}

+ (void)__MPModelPropertyTVSeasonDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVSeason.m"), 95, CFSTR("Translator was missing mapping for MPModelPropertyTVSeasonDownloadedDate"));

}

@end
