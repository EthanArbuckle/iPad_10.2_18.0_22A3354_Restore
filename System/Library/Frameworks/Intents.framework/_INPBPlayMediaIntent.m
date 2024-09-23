@implementation _INPBPlayMediaIntent

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBMediaItemValue)mediaContainer
{
  return self->_mediaContainer;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (NSArray)hashedRouteUIDs
{
  return self->_hashedRouteUIDs;
}

- (NSString)recoID
{
  return self->_recoID;
}

- (_INPBTimestamp)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)alternativeResults
{
  return self->_alternativeResults;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double playbackSpeed;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v3 = -[NSArray hash](self->_alternativeResults, "hash");
  v4 = -[NSArray hash](self->_audioSearchResults, "hash");
  v5 = -[_INPBString hash](self->_audiobookAuthor, "hash");
  v6 = -[_INPBString hash](self->_audiobookTitle, "hash");
  v7 = -[NSArray hash](self->_buckets, "hash");
  v8 = -[_INPBTimestamp hash](self->_expirationDate, "hash");
  v9 = -[NSArray hash](self->_hashedRouteUIDs, "hash");
  v10 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v31 = -[_INPBMediaItemValue hash](self->_mediaContainer, "hash");
  v30 = -[NSArray hash](self->_mediaItems, "hash");
  v29 = -[_INPBMediaSearch hash](self->_mediaSearch, "hash");
  v28 = -[_INPBString hash](self->_mediaUserContext, "hash");
  v27 = -[_INPBString hash](self->_musicArtistName, "hash");
  if (-[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory"))
    v26 = 2654435761 * self->_parsecCategory;
  else
    v26 = 0;
  if (-[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled"))
    v25 = 2654435761 * self->_playShuffled;
  else
    v25 = 0;
  if (-[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation"))
    v24 = 2654435761 * self->_playbackQueueLocation;
  else
    v24 = 0;
  if (-[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode"))
    v23 = 2654435761 * self->_playbackRepeatMode;
  else
    v23 = 0;
  v34 = v8;
  v35 = v7;
  v32 = v10;
  v33 = v9;
  if (-[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed"))
  {
    playbackSpeed = self->_playbackSpeed;
    v12 = -playbackSpeed;
    if (playbackSpeed >= 0.0)
      v12 = self->_playbackSpeed;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    v16 = v3;
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v15 += (unint64_t)v14;
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v16 = v3;
    v15 = 0;
  }
  v17 = -[_INPBString hash](self->_playlistTitle, "hash");
  v18 = -[_INPBPrivatePlayMediaIntentData hash](self->_privatePlayMediaIntentData, "hash");
  v19 = -[NSString hash](self->_proxiedBundleIdentifier, "hash");
  v20 = -[NSString hash](self->_recoID, "hash");
  if (-[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback"))
    v21 = 2654435761 * self->_resumePlayback;
  else
    v21 = 0;
  return v4 ^ v16 ^ v5 ^ v6 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[_INPBString hash](self->_showTitle, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPlayMediaIntent *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v5 = -[_INPBPlayMediaIntent init](+[_INPBPlayMediaIntent allocWithZone:](_INPBPlayMediaIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_alternativeResults, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setAlternativeResults:](v5, "setAlternativeResults:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_audioSearchResults, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setAudioSearchResults:](v5, "setAudioSearchResults:", v7);

  v8 = -[_INPBString copyWithZone:](self->_audiobookAuthor, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setAudiobookAuthor:](v5, "setAudiobookAuthor:", v8);

  v9 = -[_INPBString copyWithZone:](self->_audiobookTitle, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setAudiobookTitle:](v5, "setAudiobookTitle:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_buckets, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setBuckets:](v5, "setBuckets:", v10);

  v11 = -[_INPBTimestamp copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setExpirationDate:](v5, "setExpirationDate:", v11);

  v12 = (void *)-[NSArray copyWithZone:](self->_hashedRouteUIDs, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setHashedRouteUIDs:](v5, "setHashedRouteUIDs:", v12);

  v13 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setIntentMetadata:](v5, "setIntentMetadata:", v13);

  v14 = -[_INPBMediaItemValue copyWithZone:](self->_mediaContainer, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setMediaContainer:](v5, "setMediaContainer:", v14);

  v15 = (void *)-[NSArray copyWithZone:](self->_mediaItems, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setMediaItems:](v5, "setMediaItems:", v15);

  v16 = -[_INPBMediaSearch copyWithZone:](self->_mediaSearch, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setMediaSearch:](v5, "setMediaSearch:", v16);

  v17 = -[_INPBString copyWithZone:](self->_mediaUserContext, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setMediaUserContext:](v5, "setMediaUserContext:", v17);

  v18 = -[_INPBString copyWithZone:](self->_musicArtistName, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setMusicArtistName:](v5, "setMusicArtistName:", v18);

  if (-[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory"))
    -[_INPBPlayMediaIntent setParsecCategory:](v5, "setParsecCategory:", -[_INPBPlayMediaIntent parsecCategory](self, "parsecCategory"));
  if (-[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled"))
    -[_INPBPlayMediaIntent setPlayShuffled:](v5, "setPlayShuffled:", -[_INPBPlayMediaIntent playShuffled](self, "playShuffled"));
  if (-[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation"))
    -[_INPBPlayMediaIntent setPlaybackQueueLocation:](v5, "setPlaybackQueueLocation:", -[_INPBPlayMediaIntent playbackQueueLocation](self, "playbackQueueLocation"));
  if (-[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode"))
    -[_INPBPlayMediaIntent setPlaybackRepeatMode:](v5, "setPlaybackRepeatMode:", -[_INPBPlayMediaIntent playbackRepeatMode](self, "playbackRepeatMode"));
  if (-[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed"))
  {
    -[_INPBPlayMediaIntent playbackSpeed](self, "playbackSpeed");
    -[_INPBPlayMediaIntent setPlaybackSpeed:](v5, "setPlaybackSpeed:");
  }
  v19 = -[_INPBString copyWithZone:](self->_playlistTitle, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setPlaylistTitle:](v5, "setPlaylistTitle:", v19);

  v20 = -[_INPBPrivatePlayMediaIntentData copyWithZone:](self->_privatePlayMediaIntentData, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setPrivatePlayMediaIntentData:](v5, "setPrivatePlayMediaIntentData:", v20);

  v21 = (void *)-[NSString copyWithZone:](self->_proxiedBundleIdentifier, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setProxiedBundleIdentifier:](v5, "setProxiedBundleIdentifier:", v21);

  v22 = (void *)-[NSString copyWithZone:](self->_recoID, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setRecoID:](v5, "setRecoID:", v22);

  if (-[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback"))
    -[_INPBPlayMediaIntent setResumePlayback:](v5, "setResumePlayback:", -[_INPBPlayMediaIntent resumePlayback](self, "resumePlayback"));
  v23 = -[_INPBString copyWithZone:](self->_showTitle, "copyWithZone:", a3);
  -[_INPBPlayMediaIntent setShowTitle:](v5, "setShowTitle:", v23);

  return v5;
}

- (void)setPlaybackSpeed:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_playbackSpeed = a3;
}

- (void)setPlayShuffled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playShuffled = a3;
}

- (void)setMediaItems:(id)a3
{
  NSArray *v4;
  NSArray *mediaItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  mediaItems = self->_mediaItems;
  self->_mediaItems = v4;

}

- (BOOL)hasResumePlayback
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)resumePlayback
{
  return self->_resumePlayback;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (double)playbackSpeed
{
  return self->_playbackSpeed;
}

- (BOOL)hasPlaybackRepeatMode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)playbackRepeatMode
{
  return self->_playbackRepeatMode;
}

- (BOOL)hasPlaybackQueueLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)playbackQueueLocation
{
  return self->_playbackQueueLocation;
}

- (BOOL)hasPlayShuffled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)playShuffled
{
  return self->_playShuffled;
}

- (BOOL)hasParsecCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)parsecCategory
{
  return self->_parsecCategory;
}

- (void)setShowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_showTitle, a3);
}

- (void)setRecoID:(id)a3
{
  NSString *v4;
  NSString *recoID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  recoID = self->_recoID;
  self->_recoID = v4;

}

- (void)setProxiedBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *proxiedBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  proxiedBundleIdentifier = self->_proxiedBundleIdentifier;
  self->_proxiedBundleIdentifier = v4;

}

- (void)setPrivatePlayMediaIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privatePlayMediaIntentData, a3);
}

- (void)setPlaylistTitle:(id)a3
{
  objc_storeStrong((id *)&self->_playlistTitle, a3);
}

- (void)setMusicArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_musicArtistName, a3);
}

- (void)setMediaUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUserContext, a3);
}

- (void)setHashedRouteUIDs:(id)a3
{
  NSArray *v4;
  NSArray *hashedRouteUIDs;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  hashedRouteUIDs = self->_hashedRouteUIDs;
  self->_hashedRouteUIDs = v4;

}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void)setBuckets:(id)a3
{
  NSArray *v4;
  NSArray *buckets;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  buckets = self->_buckets;
  self->_buckets = v4;

}

- (void)setAudiobookTitle:(id)a3
{
  objc_storeStrong((id *)&self->_audiobookTitle, a3);
}

- (void)setAudiobookAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_audiobookAuthor, a3);
}

- (void)setAudioSearchResults:(id)a3
{
  NSArray *v4;
  NSArray *audioSearchResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

}

- (void)setAlternativeResults:(id)a3
{
  NSArray *v4;
  NSArray *alternativeResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  alternativeResults = self->_alternativeResults;
  self->_alternativeResults = v4;

}

- (void)setResumePlayback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_resumePlayback = a3;
}

- (void)setPlaybackRepeatMode:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_playbackRepeatMode = a3;
  }
}

- (void)setPlaybackQueueLocation:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_playbackQueueLocation = a3;
  }
}

- (void)setMediaSearch:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSearch, a3);
}

- (void)setMediaContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContainer, a3);
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (_INPBPrivatePlayMediaIntentData)privatePlayMediaIntentData
{
  return self->_privatePlayMediaIntentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_recoID, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_privatePlayMediaIntentData, 0);
  objc_storeStrong((id *)&self->_playlistTitle, 0);
  objc_storeStrong((id *)&self->_musicArtistName, 0);
  objc_storeStrong((id *)&self->_mediaUserContext, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaContainer, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_hashedRouteUIDs, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_audiobookTitle, 0);
  objc_storeStrong((id *)&self->_audiobookAuthor, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_alternativeResults, 0);
}

- (void)clearAlternativeResults
{
  -[NSArray removeAllObjects](self->_alternativeResults, "removeAllObjects");
}

- (void)addAlternativeResults:(id)a3
{
  id v4;
  NSArray *alternativeResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternativeResults = self->_alternativeResults;
  v8 = v4;
  if (!alternativeResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternativeResults;
    self->_alternativeResults = v6;

    v4 = v8;
    alternativeResults = self->_alternativeResults;
  }
  -[NSArray addObject:](alternativeResults, "addObject:", v4);

}

- (unint64_t)alternativeResultsCount
{
  return -[NSArray count](self->_alternativeResults, "count");
}

- (id)alternativeResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternativeResults, "objectAtIndexedSubscript:", a3);
}

- (void)clearAudioSearchResults
{
  -[NSArray removeAllObjects](self->_audioSearchResults, "removeAllObjects");
}

- (void)addAudioSearchResults:(id)a3
{
  id v4;
  NSArray *audioSearchResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  v8 = v4;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  -[NSArray addObject:](audioSearchResults, "addObject:", v4);

}

- (unint64_t)audioSearchResultsCount
{
  return -[NSArray count](self->_audioSearchResults, "count");
}

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioSearchResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAudiobookAuthor
{
  return self->_audiobookAuthor != 0;
}

- (BOOL)hasAudiobookTitle
{
  return self->_audiobookTitle != 0;
}

- (void)clearBuckets
{
  -[NSArray removeAllObjects](self->_buckets, "removeAllObjects");
}

- (void)addBucket:(id)a3
{
  id v4;
  NSArray *buckets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  buckets = self->_buckets;
  v8 = v4;
  if (!buckets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_buckets;
    self->_buckets = v6;

    v4 = v8;
    buckets = self->_buckets;
  }
  -[NSArray addObject:](buckets, "addObject:", v4);

}

- (unint64_t)bucketsCount
{
  return -[NSArray count](self->_buckets, "count");
}

- (id)bucketAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_buckets, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)clearHashedRouteUIDs
{
  -[NSArray removeAllObjects](self->_hashedRouteUIDs, "removeAllObjects");
}

- (void)addHashedRouteUIDs:(id)a3
{
  id v4;
  NSArray *hashedRouteUIDs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  hashedRouteUIDs = self->_hashedRouteUIDs;
  v8 = v4;
  if (!hashedRouteUIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hashedRouteUIDs;
    self->_hashedRouteUIDs = v6;

    v4 = v8;
    hashedRouteUIDs = self->_hashedRouteUIDs;
  }
  -[NSArray addObject:](hashedRouteUIDs, "addObject:", v4);

}

- (unint64_t)hashedRouteUIDsCount
{
  return -[NSArray count](self->_hashedRouteUIDs, "count");
}

- (id)hashedRouteUIDsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_hashedRouteUIDs, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (BOOL)hasMediaContainer
{
  return self->_mediaContainer != 0;
}

- (void)clearMediaItems
{
  -[NSArray removeAllObjects](self->_mediaItems, "removeAllObjects");
}

- (void)addMediaItems:(id)a3
{
  id v4;
  NSArray *mediaItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  mediaItems = self->_mediaItems;
  v8 = v4;
  if (!mediaItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mediaItems;
    self->_mediaItems = v6;

    v4 = v8;
    mediaItems = self->_mediaItems;
  }
  -[NSArray addObject:](mediaItems, "addObject:", v4);

}

- (unint64_t)mediaItemsCount
{
  return -[NSArray count](self->_mediaItems, "count");
}

- (id)mediaItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasMediaSearch
{
  return self->_mediaSearch != 0;
}

- (BOOL)hasMediaUserContext
{
  return self->_mediaUserContext != 0;
}

- (BOOL)hasMusicArtistName
{
  return self->_musicArtistName != 0;
}

- (void)setParsecCategory:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_parsecCategory = a3;
  }
}

- (void)setHasParsecCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)parsecCategoryAsString:(int)a3
{
  if (a3 < 9)
    return off_1E228E690[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParsecCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEB_VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasPlayShuffled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setHasPlaybackQueueLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)playbackQueueLocationAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228E6D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaybackQueueLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PLAYBACK_QUEUE_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEXT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LATER")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasPlaybackRepeatMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)playbackRepeatModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228E6F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaybackRepeatMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPlaylistTitle
{
  return self->_playlistTitle != 0;
}

- (BOOL)hasPrivatePlayMediaIntentData
{
  return self->_privatePlayMediaIntentData != 0;
}

- (BOOL)hasProxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier != 0;
}

- (BOOL)hasRecoID
{
  return self->_recoID != 0;
}

- (void)setHasResumePlayback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasShowTitle
{
  return self->_showTitle != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayMediaIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v5 = self->_alternativeResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v71;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v7);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v10 = self->_audioSearchResults;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v67;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v12);
  }

  -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v19 = self->_buckets;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v63;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v63 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    }
    while (v21);
  }

  -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = self->_hashedRouteUIDs;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    }
    while (v28);
  }

  -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v35 = self->_mediaItems;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v55;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v55 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
    }
    while (v37);
  }

  -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch", v54);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed"))
    PBDataWriterWriteDoubleField();
  -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    PBDataWriterWriteStringField();
  -[_INPBPlayMediaIntent recoID](self, "recoID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    PBDataWriterWriteStringField();
  if (-[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback"))
    PBDataWriterWriteBOOLField();
  -[_INPBPlayMediaIntent showTitle](self, "showTitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[_INPBPlayMediaIntent showTitle](self, "showTitle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPlayMediaIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPlayMediaIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPlayMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPlayMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPlayMediaIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPlayMediaIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  int v72;
  int parsecCategory;
  int v74;
  int playShuffled;
  int v76;
  int playbackQueueLocation;
  int v78;
  int playbackRepeatMode;
  int v80;
  double playbackSpeed;
  double v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  int v103;
  int resumePlayback;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  BOOL v110;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_116;
  -[_INPBPlayMediaIntent alternativeResults](self, "alternativeResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent alternativeResults](self, "alternativeResults");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPlayMediaIntent alternativeResults](self, "alternativeResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativeResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent audioSearchResults](self, "audioSearchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSearchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent audioSearchResults](self, "audioSearchResults");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPlayMediaIntent audioSearchResults](self, "audioSearchResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSearchResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audiobookAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audiobookAuthor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audiobookTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audiobookTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent buckets](self, "buckets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buckets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent buckets](self, "buckets");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBPlayMediaIntent buckets](self, "buckets");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buckets");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expirationDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent hashedRouteUIDs](self, "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hashedRouteUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent hashedRouteUIDs](self, "hashedRouteUIDs");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBPlayMediaIntent hashedRouteUIDs](self, "hashedRouteUIDs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hashedRouteUIDs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaContainer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent mediaItems](self, "mediaItems");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBPlayMediaIntent mediaItems](self, "mediaItems");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSearch");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaUserContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaUserContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicArtistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "musicArtistName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_116;
  }
  else
  {

  }
  v72 = -[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory");
  if (v72 != objc_msgSend(v4, "hasParsecCategory"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory"))
  {
    if (objc_msgSend(v4, "hasParsecCategory"))
    {
      parsecCategory = self->_parsecCategory;
      if (parsecCategory != objc_msgSend(v4, "parsecCategory"))
        goto LABEL_116;
    }
  }
  v74 = -[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled");
  if (v74 != objc_msgSend(v4, "hasPlayShuffled"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled"))
  {
    if (objc_msgSend(v4, "hasPlayShuffled"))
    {
      playShuffled = self->_playShuffled;
      if (playShuffled != objc_msgSend(v4, "playShuffled"))
        goto LABEL_116;
    }
  }
  v76 = -[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation");
  if (v76 != objc_msgSend(v4, "hasPlaybackQueueLocation"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation"))
  {
    if (objc_msgSend(v4, "hasPlaybackQueueLocation"))
    {
      playbackQueueLocation = self->_playbackQueueLocation;
      if (playbackQueueLocation != objc_msgSend(v4, "playbackQueueLocation"))
        goto LABEL_116;
    }
  }
  v78 = -[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode");
  if (v78 != objc_msgSend(v4, "hasPlaybackRepeatMode"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode"))
  {
    if (objc_msgSend(v4, "hasPlaybackRepeatMode"))
    {
      playbackRepeatMode = self->_playbackRepeatMode;
      if (playbackRepeatMode != objc_msgSend(v4, "playbackRepeatMode"))
        goto LABEL_116;
    }
  }
  v80 = -[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed");
  if (v80 != objc_msgSend(v4, "hasPlaybackSpeed"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed"))
  {
    if (objc_msgSend(v4, "hasPlaybackSpeed"))
    {
      playbackSpeed = self->_playbackSpeed;
      objc_msgSend(v4, "playbackSpeed");
      if (playbackSpeed != v82)
        goto LABEL_116;
    }
  }
  -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playlistTitle");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privatePlayMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privatePlayMediaIntentData");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxiedBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[_INPBPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxiedBundleIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_116;
  }
  else
  {

  }
  -[_INPBPlayMediaIntent recoID](self, "recoID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_115;
  -[_INPBPlayMediaIntent recoID](self, "recoID");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[_INPBPlayMediaIntent recoID](self, "recoID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recoID");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_116;
  }
  else
  {

  }
  v103 = -[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback");
  if (v103 != objc_msgSend(v4, "hasResumePlayback"))
    goto LABEL_116;
  if (-[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback"))
  {
    if (objc_msgSend(v4, "hasResumePlayback"))
    {
      resumePlayback = self->_resumePlayback;
      if (resumePlayback != objc_msgSend(v4, "resumePlayback"))
        goto LABEL_116;
    }
  }
  -[_INPBPlayMediaIntent showTitle](self, "showTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPlayMediaIntent showTitle](self, "showTitle");
    v105 = objc_claimAutoreleasedReturnValue();
    if (!v105)
    {

LABEL_119:
      v110 = 1;
      goto LABEL_117;
    }
    v106 = (void *)v105;
    -[_INPBPlayMediaIntent showTitle](self, "showTitle");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showTitle");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if ((v109 & 1) != 0)
      goto LABEL_119;
  }
  else
  {
LABEL_115:

  }
LABEL_116:
  v110 = 0;
LABEL_117:

  return v110;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternativeResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v5 = self->_alternativeResults;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v93;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v93 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternativeResults"));
  }
  if (-[NSArray count](self->_audioSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v12 = self->_audioSearchResults;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v89;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v89 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioSearchResults"));
  }
  -[_INPBPlayMediaIntent audiobookAuthor](self, "audiobookAuthor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("audiobookAuthor"));

  -[_INPBPlayMediaIntent audiobookTitle](self, "audiobookTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("audiobookTitle"));

  if (-[NSArray count](self->_buckets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v23 = self->_buckets;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v85;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v85 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v27), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("bucket"));
  }
  -[_INPBPlayMediaIntent expirationDate](self, "expirationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("expirationDate"));

  if (-[NSArray count](self->_hashedRouteUIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v32 = self->_hashedRouteUIDs;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v81;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v81 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v36), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("hashedRouteUIDs"));
  }
  -[_INPBPlayMediaIntent intentMetadata](self, "intentMetadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dictionaryRepresentation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("intentMetadata"));

  -[_INPBPlayMediaIntent mediaContainer](self, "mediaContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dictionaryRepresentation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("mediaContainer"));

  if (-[NSArray count](self->_mediaItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v43 = self->_mediaItems;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v77;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v77 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v47), "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

          ++v47;
        }
        while (v45 != v47);
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
      }
      while (v45);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("mediaItems"));
  }
  -[_INPBPlayMediaIntent mediaSearch](self, "mediaSearch");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "dictionaryRepresentation");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("mediaSearch"));

  -[_INPBPlayMediaIntent mediaUserContext](self, "mediaUserContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "dictionaryRepresentation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("mediaUserContext"));

  -[_INPBPlayMediaIntent musicArtistName](self, "musicArtistName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dictionaryRepresentation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("musicArtistName"));

  if (-[_INPBPlayMediaIntent hasParsecCategory](self, "hasParsecCategory"))
  {
    v55 = -[_INPBPlayMediaIntent parsecCategory](self, "parsecCategory");
    if (v55 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v55);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E228E690[v55];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("parsecCategory"));

  }
  if (-[_INPBPlayMediaIntent hasPlayShuffled](self, "hasPlayShuffled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPlayMediaIntent playShuffled](self, "playShuffled"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("playShuffled"));

  }
  if (-[_INPBPlayMediaIntent hasPlaybackQueueLocation](self, "hasPlaybackQueueLocation"))
  {
    v58 = -[_INPBPlayMediaIntent playbackQueueLocation](self, "playbackQueueLocation");
    if (v58 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v58);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E228E6D8[v58];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("playbackQueueLocation"));

  }
  if (-[_INPBPlayMediaIntent hasPlaybackRepeatMode](self, "hasPlaybackRepeatMode"))
  {
    v60 = -[_INPBPlayMediaIntent playbackRepeatMode](self, "playbackRepeatMode");
    if (v60 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v60);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E228E6F8[v60];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("playbackRepeatMode"));

  }
  if (-[_INPBPlayMediaIntent hasPlaybackSpeed](self, "hasPlaybackSpeed"))
  {
    v62 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBPlayMediaIntent playbackSpeed](self, "playbackSpeed");
    objc_msgSend(v62, "numberWithDouble:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("playbackSpeed"));

  }
  -[_INPBPlayMediaIntent playlistTitle](self, "playlistTitle");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "dictionaryRepresentation");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("playlistTitle"));

  -[_INPBPlayMediaIntent privatePlayMediaIntentData](self, "privatePlayMediaIntentData");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "dictionaryRepresentation");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("privatePlayMediaIntentData"));

  if (self->_proxiedBundleIdentifier)
  {
    -[_INPBPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("proxiedBundleIdentifier"));

  }
  if (self->_recoID)
  {
    -[_INPBPlayMediaIntent recoID](self, "recoID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("recoID"));

  }
  if (-[_INPBPlayMediaIntent hasResumePlayback](self, "hasResumePlayback"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPlayMediaIntent resumePlayback](self, "resumePlayback"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("resumePlayback"));

  }
  -[_INPBPlayMediaIntent showTitle](self, "showTitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "dictionaryRepresentation");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("showTitle"));

  return v3;
}

- (_INPBString)audiobookAuthor
{
  return self->_audiobookAuthor;
}

- (_INPBString)audiobookTitle
{
  return self->_audiobookTitle;
}

- (_INPBString)mediaUserContext
{
  return self->_mediaUserContext;
}

- (_INPBString)musicArtistName
{
  return self->_musicArtistName;
}

- (_INPBString)playlistTitle
{
  return self->_playlistTitle;
}

- (_INPBString)showTitle
{
  return self->_showTitle;
}

+ (Class)alternativeResultsType
{
  return (Class)objc_opt_class();
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

+ (Class)bucketType
{
  return (Class)objc_opt_class();
}

+ (Class)hashedRouteUIDsType
{
  return (Class)objc_opt_class();
}

+ (Class)mediaItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
