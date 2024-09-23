@implementation MPModelPodcastEpisode

+ (id)__userRating_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeUserRating");
}

+ (id)__transcriptSource_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeTranscriptSource");
}

+ (id)__transcriptIdentifier_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeTranscriptIdentifier");
}

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeTitle");
}

+ (id)__streamURL_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeStreamURL");
}

+ (id)__state_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeState");
}

+ (id)__showArtworkTemplateURL_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeShowArtworkTemplateURL");
}

+ (id)__shareURL_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeShareURL");
}

+ (id)__seasonNumber_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeSeasonNumber");
}

+ (id)__releaseDateComponents_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeReleaseDateComponents");
}

+ (id)__priceType_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodePriceType");
}

+ (id)__podcast_KEY
{
  return CFSTR("MPModelRelationshipPodcastEpisodePodcast");
}

+ (id)__podcastStoreID_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodePodcastStoreID");
}

+ (id)__playbackPosition_KEY
{
  return CFSTR("MPModelRelationshipPodcastEpisodePlaybackPosition");
}

+ (id)__mediaType_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeMediaType");
}

+ (id)__localFileAsset_KEY
{
  return CFSTR("MPModelRelationshipPodcastEpisodeLocalFileAsset");
}

+ (id)__itemType_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeItemType");
}

+ (id)__hasVideo_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeHasVideo");
}

+ (id)__feedURL_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeFeedURL");
}

+ (id)__externalContentID_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeExternalContentID");
}

+ (id)__explicitEpisode_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeExplicit");
}

+ (id)__episodeType_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeType");
}

+ (id)__episodeNumber_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeNumber");
}

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeDuration");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeDescriptionText");
}

+ (id)__datePlayed_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeDatePlayed");
}

+ (id)__author_KEY
{
  return CFSTR("MPModelRelationshipPodcastEpisodeAuthor");
}

+ (id)__assetURL_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeAssetURL");
}

+ (id)__artworkInfo_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeArtworkInfo");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeArtwork");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentText, 0);
}

+ (int64_t)genericObjectType
{
  return 12;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("podcast episode %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPodcastEpisodeTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelPodcastEpisode title](self, "title");
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

  -[MPModelPodcastEpisode artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelPodcastEpisode *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setCommentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "kindWithVariants:options:", a3, 0);
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelPodcastEpisodeKind kindWithVariants:options:](MPModelPodcastEpisodeKind, "kindWithVariants:options:", a3, a4);
}

+ (void)__MPModelPropertyPodcastEpisodeTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 103, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeTitle"));

}

+ (void)__MPModelPropertyPodcastEpisodeReleaseDateComponents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 104, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeReleaseDateComponents"));

}

+ (void)__MPModelPropertyPodcastEpisodeDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 105, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeDuration"));

}

+ (void)__MPModelPropertyPodcastEpisodeUserRating__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 106, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeUserRating"));

}

+ (void)__MPModelPropertyPodcastEpisodeExplicit__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 107, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeExplicit"));

}

+ (void)__MPModelPropertyPodcastEpisodeHasVideo__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 108, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeHasVideo"));

}

+ (void)__MPModelPropertyPodcastEpisodeDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 109, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeDescriptionText"));

}

+ (void)__MPModelPropertyPodcastEpisodeDatePlayed__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 110, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeDatePlayed"));

}

+ (void)__MPModelPropertyPodcastEpisodeStreamURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 111, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeStreamURL"));

}

+ (void)__MPModelPropertyPodcastEpisodeShareURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 112, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeShareURL"));

}

+ (void)__MPModelPropertyPodcastEpisodeType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 113, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeType"));

}

+ (void)__MPModelPropertyPodcastEpisodeNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 114, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeNumber"));

}

+ (void)__MPModelPropertyPodcastEpisodeSeasonNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 115, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeSeasonNumber"));

}

+ (void)__MPModelRelationshipPodcastEpisodeLocalFileAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 116, CFSTR("Translator was missing mapping for MPModelRelationshipPodcastEpisodeLocalFileAsset"));

}

+ (void)__MPModelRelationshipPodcastEpisodePodcast__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 117, CFSTR("Translator was missing mapping for MPModelRelationshipPodcastEpisodePodcast"));

}

+ (void)__MPModelRelationshipPodcastEpisodeAuthor__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 118, CFSTR("Translator was missing mapping for MPModelRelationshipPodcastEpisodeAuthor"));

}

+ (void)__MPModelRelationshipPodcastEpisodePlaybackPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 119, CFSTR("Translator was missing mapping for MPModelRelationshipPodcastEpisodePlaybackPosition"));

}

+ (void)__MPModelPropertyPodcastEpisodeArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 120, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeArtwork"));

}

+ (void)__MPModelPropertyPodcastEpisodeState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 121, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeState"));

}

+ (void)__MPModelPropertyPodcastEpisodeFeedURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 122, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeFeedURL"));

}

+ (void)__MPModelPropertyPodcastEpisodeAssetURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 123, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeAssetURL"));

}

+ (void)__MPModelPropertyPodcastEpisodeItemType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 124, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeItemType"));

}

+ (void)__MPModelPropertyPodcastEpisodeMediaType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 125, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeMediaType"));

}

+ (void)__MPModelPropertyPodcastEpisodePriceType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 126, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodePriceType"));

}

+ (void)__MPModelPropertyPodcastEpisodePodcastStoreID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 127, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodePodcastStoreID"));

}

+ (void)__MPModelPropertyPodcastEpisodeExternalContentID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 128, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeExternalContentID"));

}

+ (void)__MPModelPropertyPodcastEpisodeShowArtworkTemplateURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 129, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeShowArtworkTemplateURL"));

}

+ (void)__MPModelPropertyPodcastEpisodeArtworkInfo__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 130, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeArtworkInfo"));

}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 131, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptIdentifier"));

}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptSource__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 132, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptSource"));

}

+ (id)__chapters_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeChapters");
}

+ (void)__MPModelPropertyPodcastEpisodeChapters__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 133, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeChapters"));

}

+ (id)__transcriptAlignments_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeTranscriptAlignments");
}

+ (void)__MPModelPropertyPodcastEpisodeTranscriptAlignments__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 134, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeTranscriptAlignments"));

}

+ (id)__shouldShowChapterArtwork_KEY
{
  return CFSTR("MPModelPropertyPodcastEpisodeShouldShowChapterArtwork");
}

+ (void)__MPModelPropertyPodcastEpisodeShouldShowChapterArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastEpisode.m"), 135, CFSTR("Translator was missing mapping for MPModelPropertyPodcastEpisodeShouldShowChapterArtwork"));

}

@end
