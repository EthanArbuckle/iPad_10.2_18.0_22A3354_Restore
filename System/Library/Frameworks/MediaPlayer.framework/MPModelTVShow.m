@implementation MPModelTVShow

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyTVShowTitle");
}

+ (id)__tagline_KEY
{
  return CFSTR("MPModelPropertyTVShowTagline");
}

+ (id)__shortTitle_KEY
{
  return CFSTR("MPModelPropertyTVShowShortTitle");
}

+ (id)__shortEditorNotes_KEY
{
  return CFSTR("MPModelPropertyTVShowShortEditorNotes");
}

+ (id)__episodesCount_KEY
{
  return CFSTR("MPModelPropertyTVShowEpisodeCount");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyTVShowEditorialArtwork");
}

+ (id)__editorNotes_KEY
{
  return CFSTR("MPModelPropertyTVShowEditorNotes");
}

+ (id)__creator_KEY
{
  return CFSTR("MPModelRelationshipTVShowCreator");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyTVShowArtwork");
}

+ (id)kindWithSeasonKind:(id)a3
{
  return +[MPModelTVShowKind kindWithSeasonKind:](MPModelTVShowKind, "kindWithSeasonKind:", a3);
}

+ (int64_t)genericObjectType
{
  return 8;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TV show %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelTVShow title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelTVShow artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelTVShow *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelTVShow editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelTVShow *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyTVShowTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 78, CFSTR("Translator was missing mapping for MPModelPropertyTVShowTitle"));

}

+ (void)__MPModelPropertyTVShowShortTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 79, CFSTR("Translator was missing mapping for MPModelPropertyTVShowShortTitle"));

}

+ (void)__MPModelPropertyTVShowEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 80, CFSTR("Translator was missing mapping for MPModelPropertyTVShowEditorNotes"));

}

+ (void)__MPModelPropertyTVShowShortEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 81, CFSTR("Translator was missing mapping for MPModelPropertyTVShowShortEditorNotes"));

}

+ (void)__MPModelRelationshipTVShowCreator__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 82, CFSTR("Translator was missing mapping for MPModelRelationshipTVShowCreator"));

}

+ (void)__MPModelPropertyTVShowArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 83, CFSTR("Translator was missing mapping for MPModelPropertyTVShowArtwork"));

}

+ (void)__MPModelPropertyTVShowEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 84, CFSTR("Translator was missing mapping for MPModelPropertyTVShowEditorialArtwork"));

}

+ (void)__MPModelPropertyTVShowEpisodeCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 85, CFSTR("Translator was missing mapping for MPModelPropertyTVShowEpisodeCount"));

}

+ (void)__MPModelPropertyTVShowTagline__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 86, CFSTR("Translator was missing mapping for MPModelPropertyTVShowTagline"));

}

+ (id)__storeCanonicalID_KEY
{
  return CFSTR("MPModelPropertyTVShowStoreCanonicalID");
}

+ (void)__MPModelPropertyTVShowStoreCanonicalID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShow.m"), 87, CFSTR("Translator was missing mapping for MPModelPropertyTVShowStoreCanonicalID"));

}

@end
