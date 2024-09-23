@implementation MPModelPodcast

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyPodcastTitle");
}

+ (id)__supportsSubscription_KEY
{
  return CFSTR("MPModelPropertyPodcastSupportsSubscription");
}

+ (id)__sortType_KEY
{
  return CFSTR("MPModelPropertyPodcastSortType");
}

+ (id)__shareURL_KEY
{
  return CFSTR("MPModelPropertyPodcastShareURL");
}

+ (id)__feedURL_KEY
{
  return CFSTR("MPModelPropertyPodcastFeedURL");
}

+ (id)__author_KEY
{
  return CFSTR("MPModelRelationshipPodcastAuthor");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyPodcastArtwork");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("podcast %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPodcastTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelPodcast title](self, "title");
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

  -[MPModelPodcast artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelPodcast *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)kindWithEpisodeKind:(id)a3
{
  return +[MPModelPodcastKind kindWithEpisodeKind:](MPModelPodcastKind, "kindWithEpisodeKind:", a3);
}

+ (void)__MPModelPropertyPodcastTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 78, CFSTR("Translator was missing mapping for MPModelPropertyPodcastTitle"));

}

+ (void)__MPModelPropertyPodcastFeedURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 79, CFSTR("Translator was missing mapping for MPModelPropertyPodcastFeedURL"));

}

+ (void)__MPModelPropertyPodcastShareURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 80, CFSTR("Translator was missing mapping for MPModelPropertyPodcastShareURL"));

}

+ (void)__MPModelPropertyPodcastSupportsSubscription__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 81, CFSTR("Translator was missing mapping for MPModelPropertyPodcastSupportsSubscription"));

}

+ (void)__MPModelPropertyPodcastSortType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 82, CFSTR("Translator was missing mapping for MPModelPropertyPodcastSortType"));

}

+ (void)__MPModelRelationshipPodcastAuthor__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 83, CFSTR("Translator was missing mapping for MPModelRelationshipPodcastAuthor"));

}

+ (void)__MPModelPropertyPodcastArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcast.m"), 84, CFSTR("Translator was missing mapping for MPModelPropertyPodcastArtwork"));

}

+ (int64_t)genericObjectType
{
  return 11;
}

@end
