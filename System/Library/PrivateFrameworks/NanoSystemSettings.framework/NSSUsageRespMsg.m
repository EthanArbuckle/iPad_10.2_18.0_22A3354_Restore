@implementation NSSUsageRespMsg

- (void)clearAppUsages
{
  -[NSMutableArray removeAllObjects](self->_appUsages, "removeAllObjects");
}

- (void)addAppUsages:(id)a3
{
  id v4;
  NSMutableArray *appUsages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appUsages = self->_appUsages;
  v8 = v4;
  if (!appUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appUsages;
    self->_appUsages = v6;

    v4 = v8;
    appUsages = self->_appUsages;
  }
  -[NSMutableArray addObject:](appUsages, "addObject:", v4);

}

- (unint64_t)appUsagesCount
{
  return -[NSMutableArray count](self->_appUsages, "count");
}

- (id)appUsagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appUsages, "objectAtIndex:", a3);
}

+ (Class)appUsagesType
{
  return (Class)objc_opt_class();
}

- (void)setMoviesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moviesUsage = a3;
}

- (void)setHasMoviesUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMoviesUsage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMovieRentalsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_movieRentalsUsage = a3;
}

- (void)setHasMovieRentalsUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMovieRentalsUsage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTvShowsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_tvShowsUsage = a3;
}

- (void)setHasTvShowsUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTvShowsUsage
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAudioCoursesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioCoursesUsage = a3;
}

- (void)setHasAudioCoursesUsage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAudioCoursesUsage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setVideoCoursesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_videoCoursesUsage = a3;
}

- (void)setHasVideoCoursesUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasVideoCoursesUsage
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setMusicVideosUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_musicVideosUsage = a3;
}

- (void)setHasMusicVideosUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMusicVideosUsage
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAudioPodcastsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_audioPodcastsUsage = a3;
}

- (void)setHasAudioPodcastsUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAudioPodcastsUsage
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setVideoPodcastsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_videoPodcastsUsage = a3;
}

- (void)setHasVideoPodcastsUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasVideoPodcastsUsage
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setSongsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_songsUsage = a3;
}

- (void)setHasSongsUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSongsUsage
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAudiobooksUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_audiobooksUsage = a3;
}

- (void)setHasAudiobooksUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAudiobooksUsage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHomeVideosUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_homeVideosUsage = a3;
}

- (void)setHasHomeVideosUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHomeVideosUsage
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCameralRollUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cameralRollUsage = a3;
}

- (void)setHasCameralRollUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCameralRollUsage
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPhotoLibraryUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_photoLibraryUsage = a3;
}

- (void)setHasPhotoLibraryUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPhotoLibraryUsage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPhotoStreamUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_photoStreamUsage = a3;
}

- (void)setHasPhotoStreamUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPhotoStreamUsage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearBundleUsages
{
  -[NSMutableArray removeAllObjects](self->_bundleUsages, "removeAllObjects");
}

- (void)addBundleUsage:(id)a3
{
  id v4;
  NSMutableArray *bundleUsages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bundleUsages = self->_bundleUsages;
  v8 = v4;
  if (!bundleUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_bundleUsages;
    self->_bundleUsages = v6;

    v4 = v8;
    bundleUsages = self->_bundleUsages;
  }
  -[NSMutableArray addObject:](bundleUsages, "addObject:", v4);

}

- (unint64_t)bundleUsagesCount
{
  return -[NSMutableArray count](self->_bundleUsages, "count");
}

- (id)bundleUsageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bundleUsages, "objectAtIndex:", a3);
}

+ (Class)bundleUsageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMusicBundleIdentifier
{
  return self->_musicBundleIdentifier != 0;
}

- (BOOL)hasPhotosBundleIdentifier
{
  return self->_photosBundleIdentifier != 0;
}

- (BOOL)hasPodcastsBundleIdentifier
{
  return self->_podcastsBundleIdentifier != 0;
}

- (void)clearAppBundleUsages
{
  -[NSMutableArray removeAllObjects](self->_appBundleUsages, "removeAllObjects");
}

- (void)addAppBundleUsage:(id)a3
{
  id v4;
  NSMutableArray *appBundleUsages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appBundleUsages = self->_appBundleUsages;
  v8 = v4;
  if (!appBundleUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appBundleUsages;
    self->_appBundleUsages = v6;

    v4 = v8;
    appBundleUsages = self->_appBundleUsages;
  }
  -[NSMutableArray addObject:](appBundleUsages, "addObject:", v4);

}

- (unint64_t)appBundleUsagesCount
{
  return -[NSMutableArray count](self->_appBundleUsages, "count");
}

- (id)appBundleUsageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appBundleUsages, "objectAtIndex:", a3);
}

+ (Class)appBundleUsageType
{
  return (Class)objc_opt_class();
}

- (void)clearCategories
{
  -[NSMutableArray removeAllObjects](self->_categories, "removeAllObjects");
}

- (void)addCategories:(id)a3
{
  id v4;
  NSMutableArray *categories;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  categories = self->_categories;
  v8 = v4;
  if (!categories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_categories;
    self->_categories = v6;

    v4 = v8;
    categories = self->_categories;
  }
  -[NSMutableArray addObject:](categories, "addObject:", v4);

}

- (unint64_t)categoriesCount
{
  return -[NSMutableArray count](self->_categories, "count");
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categories, "objectAtIndex:", a3);
}

+ (Class)categoriesType
{
  return (Class)objc_opt_class();
}

- (void)setCapacityInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_capacityInBytes = a3;
}

- (void)setHasCapacityInBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCapacityInBytes
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsg;
  -[NSSUsageRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUsageRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int16 has;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSString *musicBundleIdentifier;
  NSString *photosBundleIdentifier;
  NSString *podcastsBundleIdentifier;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_usedStorageInBytes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("usedStorageInBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_availableStorageInBytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("availableStorageInBytes"));

  *(float *)&v6 = self->_usageTimeInSeconds;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("usageTimeInSeconds"));

  *(float *)&v8 = self->_standbyTimeInSeconds;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("standbyTimeInSeconds"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_trusted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("trusted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_partiallyCharged);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("partiallyCharged"));

  if (-[NSMutableArray count](self->_appUsages, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_appUsages, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v13 = self->_appUsages;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v73 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("appUsages"));
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_moviesUsage);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("moviesUsage"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 0x1000) == 0)
        goto LABEL_13;
      goto LABEL_63;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_movieRentalsUsage);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("movieRentalsUsage"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tvShowsUsage);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("tvShowsUsage"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_audioCoursesUsage);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("audioCoursesUsage"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_videoCoursesUsage);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("videoCoursesUsage"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 2) == 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_musicVideosUsage);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("musicVideosUsage"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_audioPodcastsUsage);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("audioPodcastsUsage"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_videoPodcastsUsage);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("videoPodcastsUsage"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 4) == 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_songsUsage);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("songsUsage"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_audiobooksUsage);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("audiobooksUsage"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 8) == 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_homeVideosUsage);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("homeVideosUsage"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_22:
    if ((has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cameralRollUsage);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("cameralRollUsage"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_23:
    if ((has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_photoLibraryUsage);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("photoLibraryUsage"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_photoStreamUsage);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("photoStreamUsage"));

  }
LABEL_25:
  if (-[NSMutableArray count](self->_bundleUsages, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bundleUsages, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v22 = self->_bundleUsages;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v69 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("bundleUsage"));
  }
  musicBundleIdentifier = self->_musicBundleIdentifier;
  if (musicBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", musicBundleIdentifier, CFSTR("musicBundleIdentifier"));
  photosBundleIdentifier = self->_photosBundleIdentifier;
  if (photosBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", photosBundleIdentifier, CFSTR("photosBundleIdentifier"));
  podcastsBundleIdentifier = self->_podcastsBundleIdentifier;
  if (podcastsBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", podcastsBundleIdentifier, CFSTR("podcastsBundleIdentifier"));
  if (-[NSMutableArray count](self->_appBundleUsages, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_appBundleUsages, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v32 = self->_appBundleUsages;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("appBundleUsage"));
  }
  if (-[NSMutableArray count](self->_categories, "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_categories, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v39 = self->_categories;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v61;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v61 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v60);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v41);
    }

    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("categories"));
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_capacityInBytes);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("capacityInBytes"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_appUsages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_55;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 8) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_21:
    if ((has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_22:
    PBDataWriterWriteUint64Field();
LABEL_23:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_bundleUsages;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  if (self->_musicBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_photosBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_podcastsBundleIdentifier)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = self->_appBundleUsages;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_categories;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  __int16 has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  id v22;

  v4 = a3;
  v4[15] = self->_usedStorageInBytes;
  v4[4] = self->_availableStorageInBytes;
  *((_DWORD *)v4 + 51) = LODWORD(self->_usageTimeInSeconds);
  *((_DWORD *)v4 + 50) = LODWORD(self->_standbyTimeInSeconds);
  *((_BYTE *)v4 + 209) = self->_trusted;
  v22 = v4;
  *((_BYTE *)v4 + 208) = self->_partiallyCharged;
  if (-[NSSUsageRespMsg appUsagesCount](self, "appUsagesCount"))
  {
    objc_msgSend(v22, "clearAppUsages");
    v5 = -[NSSUsageRespMsg appUsagesCount](self, "appUsagesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSSUsageRespMsg appUsagesAtIndex:](self, "appUsagesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAppUsages:", v8);

      }
    }
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_QWORD *)v22 + 9) = self->_moviesUsage;
    *((_WORD *)v22 + 106) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x1000) == 0)
        goto LABEL_8;
      goto LABEL_43;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v22 + 8) = self->_movieRentalsUsage;
  *((_WORD *)v22 + 106) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)v22 + 14) = self->_tvShowsUsage;
  *((_WORD *)v22 + 106) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)v22 + 1) = self->_audioCoursesUsage;
  *((_WORD *)v22 + 106) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v22 + 16) = self->_videoCoursesUsage;
  *((_WORD *)v22 + 106) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v22 + 10) = self->_musicVideosUsage;
  *((_WORD *)v22 + 106) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)v22 + 2) = self->_audioPodcastsUsage;
  *((_WORD *)v22 + 106) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)v22 + 17) = self->_videoPodcastsUsage;
  *((_WORD *)v22 + 106) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)v22 + 13) = self->_songsUsage;
  *((_WORD *)v22 + 106) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)v22 + 3) = self->_audiobooksUsage;
  *((_WORD *)v22 + 106) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)v22 + 7) = self->_homeVideosUsage;
  *((_WORD *)v22 + 106) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x200) == 0)
      goto LABEL_18;
LABEL_53:
    *((_QWORD *)v22 + 11) = self->_photoLibraryUsage;
    *((_WORD *)v22 + 106) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_52:
  *((_QWORD *)v22 + 5) = self->_cameralRollUsage;
  *((_WORD *)v22 + 106) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_53;
LABEL_18:
  if ((has & 0x400) != 0)
  {
LABEL_19:
    *((_QWORD *)v22 + 12) = self->_photoStreamUsage;
    *((_WORD *)v22 + 106) |= 0x400u;
  }
LABEL_20:
  if (-[NSSUsageRespMsg bundleUsagesCount](self, "bundleUsagesCount"))
  {
    objc_msgSend(v22, "clearBundleUsages");
    v10 = -[NSSUsageRespMsg bundleUsagesCount](self, "bundleUsagesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[NSSUsageRespMsg bundleUsageAtIndex:](self, "bundleUsageAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addBundleUsage:", v13);

      }
    }
  }
  if (self->_musicBundleIdentifier)
    objc_msgSend(v22, "setMusicBundleIdentifier:");
  if (self->_photosBundleIdentifier)
    objc_msgSend(v22, "setPhotosBundleIdentifier:");
  if (self->_podcastsBundleIdentifier)
    objc_msgSend(v22, "setPodcastsBundleIdentifier:");
  if (-[NSSUsageRespMsg appBundleUsagesCount](self, "appBundleUsagesCount"))
  {
    objc_msgSend(v22, "clearAppBundleUsages");
    v14 = -[NSSUsageRespMsg appBundleUsagesCount](self, "appBundleUsagesCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[NSSUsageRespMsg appBundleUsageAtIndex:](self, "appBundleUsageAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAppBundleUsage:", v17);

      }
    }
  }
  if (-[NSSUsageRespMsg categoriesCount](self, "categoriesCount"))
  {
    objc_msgSend(v22, "clearCategories");
    v18 = -[NSSUsageRespMsg categoriesCount](self, "categoriesCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[NSSUsageRespMsg categoriesAtIndex:](self, "categoriesAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCategories:", v21);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v22 + 6) = self->_capacityInBytes;
    *((_WORD *)v22 + 106) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int16 has;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 120) = self->_usedStorageInBytes;
  *(_QWORD *)(v5 + 32) = self->_availableStorageInBytes;
  *(float *)(v5 + 204) = self->_usageTimeInSeconds;
  *(float *)(v5 + 200) = self->_standbyTimeInSeconds;
  *(_BYTE *)(v5 + 209) = self->_trusted;
  *(_BYTE *)(v5 + 208) = self->_partiallyCharged;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = self->_appUsages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAppUsages:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v8);
  }

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_moviesUsage;
    *(_WORD *)(v5 + 212) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_49;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  *(_QWORD *)(v5 + 64) = self->_movieRentalsUsage;
  *(_WORD *)(v5 + 212) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *(_QWORD *)(v5 + 112) = self->_tvShowsUsage;
  *(_WORD *)(v5 + 212) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v5 + 8) = self->_audioCoursesUsage;
  *(_WORD *)(v5 + 212) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *(_QWORD *)(v5 + 128) = self->_videoCoursesUsage;
  *(_WORD *)(v5 + 212) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  *(_QWORD *)(v5 + 80) = self->_musicVideosUsage;
  *(_WORD *)(v5 + 212) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v5 + 16) = self->_audioPodcastsUsage;
  *(_WORD *)(v5 + 212) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  *(_QWORD *)(v5 + 136) = self->_videoPodcastsUsage;
  *(_WORD *)(v5 + 212) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  *(_QWORD *)(v5 + 104) = self->_songsUsage;
  *(_WORD *)(v5 + 212) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v5 + 24) = self->_audiobooksUsage;
  *(_WORD *)(v5 + 212) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 8) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v5 + 56) = self->_homeVideosUsage;
  *(_WORD *)(v5 + 212) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v5 + 40) = self->_cameralRollUsage;
  *(_WORD *)(v5 + 212) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_21:
    if ((has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_59:
  *(_QWORD *)(v5 + 88) = self->_photoLibraryUsage;
  *(_WORD *)(v5 + 212) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    *(_QWORD *)(v5 + 96) = self->_photoStreamUsage;
    *(_WORD *)(v5 + 212) |= 0x400u;
  }
LABEL_23:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = self->_bundleUsages;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBundleUsage:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_musicBundleIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v19;

  v21 = -[NSString copyWithZone:](self->_photosBundleIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v21;

  v23 = -[NSString copyWithZone:](self->_podcastsBundleIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v23;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = self->_appBundleUsages;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAppBundleUsage:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v27);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = self->_categories;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v5, "addCategories:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v33);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_capacityInBytes;
    *(_WORD *)(v5 + 212) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *appUsages;
  __int16 has;
  __int16 v7;
  NSMutableArray *bundleUsages;
  NSString *musicBundleIdentifier;
  NSString *photosBundleIdentifier;
  NSString *podcastsBundleIdentifier;
  NSMutableArray *appBundleUsages;
  NSMutableArray *categories;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_usedStorageInBytes != *((_QWORD *)v4 + 15)
    || self->_availableStorageInBytes != *((_QWORD *)v4 + 4)
    || self->_usageTimeInSeconds != *((float *)v4 + 51)
    || self->_standbyTimeInSeconds != *((float *)v4 + 50))
  {
    goto LABEL_103;
  }
  if (self->_trusted)
  {
    if (!*((_BYTE *)v4 + 209))
      goto LABEL_103;
  }
  else if (*((_BYTE *)v4 + 209))
  {
    goto LABEL_103;
  }
  if (!self->_partiallyCharged)
  {
    if (!*((_BYTE *)v4 + 208))
      goto LABEL_14;
LABEL_103:
    v15 = 0;
    goto LABEL_104;
  }
  if (!*((_BYTE *)v4 + 208))
    goto LABEL_103;
LABEL_14:
  appUsages = self->_appUsages;
  if ((unint64_t)appUsages | *((_QWORD *)v4 + 19)
    && !-[NSMutableArray isEqual:](appUsages, "isEqual:"))
  {
    goto LABEL_103;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 106);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_moviesUsage != *((_QWORD *)v4 + 9))
      goto LABEL_103;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_movieRentalsUsage != *((_QWORD *)v4 + 8))
      goto LABEL_103;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x1000) == 0 || self->_tvShowsUsage != *((_QWORD *)v4 + 14))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x1000) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_audioCoursesUsage != *((_QWORD *)v4 + 1))
      goto LABEL_103;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x2000) == 0 || self->_videoCoursesUsage != *((_QWORD *)v4 + 16))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x2000) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x100) == 0 || self->_musicVideosUsage != *((_QWORD *)v4 + 10))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x100) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_audioPodcastsUsage != *((_QWORD *)v4 + 2))
      goto LABEL_103;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x4000) == 0 || self->_videoPodcastsUsage != *((_QWORD *)v4 + 17))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x4000) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x800) == 0 || self->_songsUsage != *((_QWORD *)v4 + 13))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x800) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_audiobooksUsage != *((_QWORD *)v4 + 3))
      goto LABEL_103;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_homeVideosUsage != *((_QWORD *)v4 + 7))
      goto LABEL_103;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cameralRollUsage != *((_QWORD *)v4 + 5))
      goto LABEL_103;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x200) == 0 || self->_photoLibraryUsage != *((_QWORD *)v4 + 11))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x200) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x400) == 0 || self->_photoStreamUsage != *((_QWORD *)v4 + 12))
      goto LABEL_103;
  }
  else if ((*((_WORD *)v4 + 106) & 0x400) != 0)
  {
    goto LABEL_103;
  }
  bundleUsages = self->_bundleUsages;
  if ((unint64_t)bundleUsages | *((_QWORD *)v4 + 20)
    && !-[NSMutableArray isEqual:](bundleUsages, "isEqual:"))
  {
    goto LABEL_103;
  }
  musicBundleIdentifier = self->_musicBundleIdentifier;
  if ((unint64_t)musicBundleIdentifier | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](musicBundleIdentifier, "isEqual:"))
      goto LABEL_103;
  }
  photosBundleIdentifier = self->_photosBundleIdentifier;
  if ((unint64_t)photosBundleIdentifier | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](photosBundleIdentifier, "isEqual:"))
      goto LABEL_103;
  }
  podcastsBundleIdentifier = self->_podcastsBundleIdentifier;
  if ((unint64_t)podcastsBundleIdentifier | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](podcastsBundleIdentifier, "isEqual:"))
      goto LABEL_103;
  }
  appBundleUsages = self->_appBundleUsages;
  if ((unint64_t)appBundleUsages | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](appBundleUsages, "isEqual:"))
      goto LABEL_103;
  }
  categories = self->_categories;
  if ((unint64_t)categories | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](categories, "isEqual:"))
      goto LABEL_103;
  }
  v14 = *((_WORD *)v4 + 106);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_capacityInBytes != *((_QWORD *)v4 + 6))
      goto LABEL_103;
    v15 = 1;
  }
  else
  {
    v15 = (v14 & 0x10) == 0;
  }
LABEL_104:

  return v15;
}

- (unint64_t)hash
{
  float usageTimeInSeconds;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  float standbyTimeInSeconds;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int16 has;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _BOOL4 partiallyCharged;
  uint64_t v45;
  _BOOL4 trusted;
  unint64_t v47;
  unint64_t v48;
  unint64_t availableStorageInBytes;
  unint64_t usedStorageInBytes;

  availableStorageInBytes = self->_availableStorageInBytes;
  usedStorageInBytes = self->_usedStorageInBytes;
  usageTimeInSeconds = self->_usageTimeInSeconds;
  v4 = -usageTimeInSeconds;
  if (usageTimeInSeconds >= 0.0)
    v4 = self->_usageTimeInSeconds;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0)
    v10 = v9;
  v48 = v10;
  standbyTimeInSeconds = self->_standbyTimeInSeconds;
  v12 = -standbyTimeInSeconds;
  if (standbyTimeInSeconds >= 0.0)
    v12 = self->_standbyTimeInSeconds;
  v13 = floorf(v12 + 0.5);
  v14 = (float)(v12 - v13) * 1.8447e19;
  v15 = fmodf(v13, 1.8447e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabsf(v14);
  if (v14 < 0.0)
    v19 = v18;
  else
    v19 = v17;
  trusted = self->_trusted;
  v47 = v19;
  partiallyCharged = self->_partiallyCharged;
  v45 = -[NSMutableArray hash](self->_appUsages, "hash");
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v43 = 2654435761u * self->_moviesUsage;
    if ((has & 0x40) != 0)
    {
LABEL_16:
      v42 = 2654435761u * self->_movieRentalsUsage;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_17;
      goto LABEL_31;
    }
  }
  else
  {
    v43 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_16;
  }
  v42 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_17:
    v41 = 2654435761u * self->_tvShowsUsage;
    if ((has & 1) != 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  v41 = 0;
  if ((has & 1) != 0)
  {
LABEL_18:
    v40 = 2654435761u * self->_audioCoursesUsage;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_19;
    goto LABEL_33;
  }
LABEL_32:
  v40 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_19:
    v39 = 2654435761u * self->_videoCoursesUsage;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  v39 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    v38 = 2654435761u * self->_musicVideosUsage;
    if ((has & 2) != 0)
      goto LABEL_21;
    goto LABEL_35;
  }
LABEL_34:
  v38 = 0;
  if ((has & 2) != 0)
  {
LABEL_21:
    v37 = 2654435761u * self->_audioPodcastsUsage;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  v37 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_22:
    v36 = 2654435761u * self->_videoPodcastsUsage;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  v36 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_23:
    v35 = 2654435761u * self->_songsUsage;
    if ((has & 4) != 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  v35 = 0;
  if ((has & 4) != 0)
  {
LABEL_24:
    v34 = 2654435761u * self->_audiobooksUsage;
    if ((has & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_39;
  }
LABEL_38:
  v34 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_25:
    v32 = 2654435761u * self->_homeVideosUsage;
    if ((has & 8) != 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_39:
  v32 = 0;
  if ((has & 8) != 0)
  {
LABEL_26:
    v21 = 2654435761u * self->_cameralRollUsage;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_27;
LABEL_41:
    v22 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_40:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_41;
LABEL_27:
  v22 = 2654435761u * self->_photoLibraryUsage;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_28:
    v23 = 2654435761u * self->_photoStreamUsage;
    goto LABEL_43;
  }
LABEL_42:
  v23 = 0;
LABEL_43:
  v24 = -[NSMutableArray hash](self->_bundleUsages, "hash", v32);
  v25 = -[NSString hash](self->_musicBundleIdentifier, "hash");
  v26 = -[NSString hash](self->_photosBundleIdentifier, "hash");
  v27 = -[NSString hash](self->_podcastsBundleIdentifier, "hash");
  v28 = -[NSMutableArray hash](self->_appBundleUsages, "hash");
  v29 = -[NSMutableArray hash](self->_categories, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v30 = 2654435761u * self->_capacityInBytes;
  else
    v30 = 0;
  return (2654435761u * availableStorageInBytes) ^ v47 ^ (2654435761u * usedStorageInBytes) ^ v48 ^ (2654435761 * trusted) ^ (2654435761 * partiallyCharged) ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_usedStorageInBytes = *((_QWORD *)v4 + 15);
  self->_availableStorageInBytes = *((_QWORD *)v4 + 4);
  self->_usageTimeInSeconds = *((float *)v4 + 51);
  self->_standbyTimeInSeconds = *((float *)v4 + 50);
  self->_trusted = *((_BYTE *)v4 + 209);
  self->_partiallyCharged = *((_BYTE *)v4 + 208);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = *((id *)v4 + 19);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        -[NSSUsageRespMsg addAppUsages:](self, "addAppUsages:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x80) != 0)
  {
    self->_moviesUsage = *((_QWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
    v10 = *((_WORD *)v4 + 106);
    if ((v10 & 0x40) == 0)
    {
LABEL_10:
      if ((v10 & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_55;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_10;
  }
  self->_movieRentalsUsage = *((_QWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x1000) == 0)
  {
LABEL_11:
    if ((v10 & 1) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  self->_tvShowsUsage = *((_QWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 1) == 0)
  {
LABEL_12:
    if ((v10 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  self->_audioCoursesUsage = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x2000) == 0)
  {
LABEL_13:
    if ((v10 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  self->_videoCoursesUsage = *((_QWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x100) == 0)
  {
LABEL_14:
    if ((v10 & 2) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  self->_musicVideosUsage = *((_QWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 2) == 0)
  {
LABEL_15:
    if ((v10 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  self->_audioPodcastsUsage = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x4000) == 0)
  {
LABEL_16:
    if ((v10 & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  self->_videoPodcastsUsage = *((_QWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x4000u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x800) == 0)
  {
LABEL_17:
    if ((v10 & 4) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  self->_songsUsage = *((_QWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 4) == 0)
  {
LABEL_18:
    if ((v10 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  self->_audiobooksUsage = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x20) == 0)
  {
LABEL_19:
    if ((v10 & 8) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  self->_homeVideosUsage = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 8) == 0)
  {
LABEL_20:
    if ((v10 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  self->_cameralRollUsage = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_65:
  self->_photoLibraryUsage = *((_QWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 106) & 0x400) != 0)
  {
LABEL_22:
    self->_photoStreamUsage = *((_QWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_23:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = *((id *)v4 + 20);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        -[NSSUsageRespMsg addBundleUsage:](self, "addBundleUsage:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 22))
    -[NSSUsageRespMsg setMusicBundleIdentifier:](self, "setMusicBundleIdentifier:");
  if (*((_QWORD *)v4 + 23))
    -[NSSUsageRespMsg setPhotosBundleIdentifier:](self, "setPhotosBundleIdentifier:");
  if (*((_QWORD *)v4 + 24))
    -[NSSUsageRespMsg setPodcastsBundleIdentifier:](self, "setPodcastsBundleIdentifier:");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = *((id *)v4 + 18);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[NSSUsageRespMsg addAppBundleUsage:](self, "addAppBundleUsage:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v4 + 21);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[NSSUsageRespMsg addCategories:](self, "addCategories:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * m), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

  if ((*((_WORD *)v4 + 106) & 0x10) != 0)
  {
    self->_capacityInBytes = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
  }

}

- (unint64_t)usedStorageInBytes
{
  return self->_usedStorageInBytes;
}

- (void)setUsedStorageInBytes:(unint64_t)a3
{
  self->_usedStorageInBytes = a3;
}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (void)setAvailableStorageInBytes:(unint64_t)a3
{
  self->_availableStorageInBytes = a3;
}

- (float)usageTimeInSeconds
{
  return self->_usageTimeInSeconds;
}

- (void)setUsageTimeInSeconds:(float)a3
{
  self->_usageTimeInSeconds = a3;
}

- (float)standbyTimeInSeconds
{
  return self->_standbyTimeInSeconds;
}

- (void)setStandbyTimeInSeconds:(float)a3
{
  self->_standbyTimeInSeconds = a3;
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (BOOL)partiallyCharged
{
  return self->_partiallyCharged;
}

- (void)setPartiallyCharged:(BOOL)a3
{
  self->_partiallyCharged = a3;
}

- (NSMutableArray)appUsages
{
  return self->_appUsages;
}

- (void)setAppUsages:(id)a3
{
  objc_storeStrong((id *)&self->_appUsages, a3);
}

- (unint64_t)moviesUsage
{
  return self->_moviesUsage;
}

- (unint64_t)movieRentalsUsage
{
  return self->_movieRentalsUsage;
}

- (unint64_t)tvShowsUsage
{
  return self->_tvShowsUsage;
}

- (unint64_t)audioCoursesUsage
{
  return self->_audioCoursesUsage;
}

- (unint64_t)videoCoursesUsage
{
  return self->_videoCoursesUsage;
}

- (unint64_t)musicVideosUsage
{
  return self->_musicVideosUsage;
}

- (unint64_t)audioPodcastsUsage
{
  return self->_audioPodcastsUsage;
}

- (unint64_t)videoPodcastsUsage
{
  return self->_videoPodcastsUsage;
}

- (unint64_t)songsUsage
{
  return self->_songsUsage;
}

- (unint64_t)audiobooksUsage
{
  return self->_audiobooksUsage;
}

- (unint64_t)homeVideosUsage
{
  return self->_homeVideosUsage;
}

- (unint64_t)cameralRollUsage
{
  return self->_cameralRollUsage;
}

- (unint64_t)photoLibraryUsage
{
  return self->_photoLibraryUsage;
}

- (unint64_t)photoStreamUsage
{
  return self->_photoStreamUsage;
}

- (NSMutableArray)bundleUsages
{
  return self->_bundleUsages;
}

- (void)setBundleUsages:(id)a3
{
  objc_storeStrong((id *)&self->_bundleUsages, a3);
}

- (NSString)musicBundleIdentifier
{
  return self->_musicBundleIdentifier;
}

- (void)setMusicBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_musicBundleIdentifier, a3);
}

- (NSString)photosBundleIdentifier
{
  return self->_photosBundleIdentifier;
}

- (void)setPhotosBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_photosBundleIdentifier, a3);
}

- (NSString)podcastsBundleIdentifier
{
  return self->_podcastsBundleIdentifier;
}

- (void)setPodcastsBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_podcastsBundleIdentifier, a3);
}

- (NSMutableArray)appBundleUsages
{
  return self->_appBundleUsages;
}

- (void)setAppBundleUsages:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleUsages, a3);
}

- (NSMutableArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (unint64_t)capacityInBytes
{
  return self->_capacityInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photosBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_musicBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleUsages, 0);
  objc_storeStrong((id *)&self->_appUsages, 0);
  objc_storeStrong((id *)&self->_appBundleUsages, 0);
}

@end
