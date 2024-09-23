@implementation MOMediaSettingsGroup

+ (id)groupName
{
  return CFSTR("media");
}

- (NSNumber)denyBookstore
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyBookstore"));
}

- (void)setDenyBookstore:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyBookstore"));
}

+ (MOBoolSettingMetadata)denyBookstoreMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MOMediaSettingsGroup_denyBookstoreMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBookstoreMetadata_onceToken != -1)
    dispatch_once(&denyBookstoreMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyBookstoreMetadata_metadata;
}

void __45__MOMediaSettingsGroup_denyBookstoreMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyBookstore"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyBookstoreMetadata_metadata;
  denyBookstoreMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyBookstoreErotica
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyBookstoreErotica"));
}

- (void)setDenyBookstoreErotica:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyBookstoreErotica"));
}

+ (MOBoolSettingMetadata)denyBookstoreEroticaMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MOMediaSettingsGroup_denyBookstoreEroticaMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBookstoreEroticaMetadata_onceToken != -1)
    dispatch_once(&denyBookstoreEroticaMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyBookstoreEroticaMetadata_metadata;
}

void __52__MOMediaSettingsGroup_denyBookstoreEroticaMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyBookstoreErotica"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyBookstoreEroticaMetadata_metadata;
  denyBookstoreEroticaMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyExplicitContent
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyExplicitContent"));
}

- (void)setDenyExplicitContent:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyExplicitContent"));
}

+ (MOBoolSettingMetadata)denyExplicitContentMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MOMediaSettingsGroup_denyExplicitContentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyExplicitContentMetadata_onceToken != -1)
    dispatch_once(&denyExplicitContentMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyExplicitContentMetadata_metadata;
}

void __51__MOMediaSettingsGroup_denyExplicitContentMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyExplicitContent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyExplicitContentMetadata_metadata;
  denyExplicitContentMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyiTunes
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyiTunes"));
}

- (void)setDenyiTunes:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyiTunes"));
}

+ (MOBoolSettingMetadata)denyiTunesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MOMediaSettingsGroup_denyiTunesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyiTunesMetadata_onceToken != -1)
    dispatch_once(&denyiTunesMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyiTunesMetadata_metadata;
}

void __42__MOMediaSettingsGroup_denyiTunesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyiTunes"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyiTunesMetadata_metadata;
  denyiTunesMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMusicArtistActivity
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMusicArtistActivity"));
}

- (void)setDenyMusicArtistActivity:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMusicArtistActivity"));
}

+ (MOBoolSettingMetadata)denyMusicArtistActivityMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MOMediaSettingsGroup_denyMusicArtistActivityMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicArtistActivityMetadata_onceToken != -1)
    dispatch_once(&denyMusicArtistActivityMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMusicArtistActivityMetadata_metadata;
}

void __55__MOMediaSettingsGroup_denyMusicArtistActivityMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMusicArtistActivity"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyMusicArtistActivityMetadata_metadata;
  denyMusicArtistActivityMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMusicService
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMusicService"));
}

- (void)setDenyMusicService:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMusicService"));
}

+ (MOBoolSettingMetadata)denyMusicServiceMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MOMediaSettingsGroup_denyMusicServiceMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicServiceMetadata_onceToken != -1)
    dispatch_once(&denyMusicServiceMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMusicServiceMetadata_metadata;
}

void __48__MOMediaSettingsGroup_denyMusicServiceMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMusicService"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyMusicServiceMetadata_metadata;
  denyMusicServiceMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMusicVideos
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMusicVideos"));
}

- (void)setDenyMusicVideos:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMusicVideos"));
}

+ (MOBoolSettingMetadata)denyMusicVideosMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MOMediaSettingsGroup_denyMusicVideosMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMusicVideosMetadata_onceToken != -1)
    dispatch_once(&denyMusicVideosMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMusicVideosMetadata_metadata;
}

void __47__MOMediaSettingsGroup_denyMusicVideosMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMusicVideos"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyMusicVideosMetadata_metadata;
  denyMusicVideosMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyPodcasts
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyPodcasts"));
}

- (void)setDenyPodcasts:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyPodcasts"));
}

+ (MOBoolSettingMetadata)denyPodcastsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MOMediaSettingsGroup_denyPodcastsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyPodcastsMetadata_onceToken != -1)
    dispatch_once(&denyPodcastsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyPodcastsMetadata_metadata;
}

void __44__MOMediaSettingsGroup_denyPodcastsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyPodcasts"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyPodcastsMetadata_metadata;
  denyPodcastsMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denySharedMediaLibraries
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySharedMediaLibraries"));
}

- (void)setDenySharedMediaLibraries:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySharedMediaLibraries"));
}

+ (MOBoolSettingMetadata)denySharedMediaLibrariesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MOMediaSettingsGroup_denySharedMediaLibrariesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharedMediaLibrariesMetadata_onceToken != -1)
    dispatch_once(&denySharedMediaLibrariesMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySharedMediaLibrariesMetadata_metadata;
}

void __56__MOMediaSettingsGroup_denySharedMediaLibrariesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySharedMediaLibraries"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denySharedMediaLibrariesMetadata_metadata;
  denySharedMediaLibrariesMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockTVProvider
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockTVProvider"));
}

- (void)setLockTVProvider:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockTVProvider"));
}

+ (MOBoolSettingMetadata)lockTVProviderMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MOMediaSettingsGroup_lockTVProviderMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockTVProviderMetadata_onceToken != -1)
    dispatch_once(&lockTVProviderMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockTVProviderMetadata_metadata;
}

void __46__MOMediaSettingsGroup_lockTVProviderMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockTVProvider"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)lockTVProviderMetadata_metadata;
  lockTVProviderMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)maximumMovieRating
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("maximumMovieRating"));
}

- (void)setMaximumMovieRating:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("maximumMovieRating"));
}

+ (MOIntegerSettingMetadata)maximumMovieRatingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MOMediaSettingsGroup_maximumMovieRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumMovieRatingMetadata_onceToken != -1)
    dispatch_once(&maximumMovieRatingMetadata_onceToken, block);
  return (MOIntegerSettingMetadata *)(id)maximumMovieRatingMetadata_metadata;
}

void __50__MOMediaSettingsGroup_maximumMovieRatingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOIntegerSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("maximumMovieRating"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = 0;
  v2 = -[MOIntegerSettingMetadata initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:]([MOIntegerSettingMetadata alloc], "initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:", v5, 1000, 0, 0, 1000, 1, CFSTR("user"), v4);
  v3 = (void *)maximumMovieRatingMetadata_metadata;
  maximumMovieRatingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)maximumTVShowRating
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("maximumTVShowRating"));
}

- (void)setMaximumTVShowRating:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("maximumTVShowRating"));
}

+ (MOIntegerSettingMetadata)maximumTVShowRatingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MOMediaSettingsGroup_maximumTVShowRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumTVShowRatingMetadata_onceToken != -1)
    dispatch_once(&maximumTVShowRatingMetadata_onceToken, block);
  return (MOIntegerSettingMetadata *)(id)maximumTVShowRatingMetadata_metadata;
}

void __51__MOMediaSettingsGroup_maximumTVShowRatingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOIntegerSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("maximumTVShowRating"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = 0;
  v2 = -[MOIntegerSettingMetadata initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:]([MOIntegerSettingMetadata alloc], "initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:", v5, 1000, 0, 0, 1000, 1, CFSTR("user"), v4);
  v3 = (void *)maximumTVShowRatingMetadata_metadata;
  maximumTVShowRatingMetadata_metadata = (uint64_t)v2;

}

@end
