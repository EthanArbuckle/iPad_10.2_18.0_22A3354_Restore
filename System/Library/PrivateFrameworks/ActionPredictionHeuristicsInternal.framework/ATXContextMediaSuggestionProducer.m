@implementation ATXContextMediaSuggestionProducer

- (ATXContextMediaSuggestionProducer)initWithMediaRemoteContentItem:(id)a3 destDisplayName:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXContextMediaSuggestionProducer *v11;
  void *v12;
  uint64_t v13;
  NSString *trackName;
  uint64_t v15;
  uint64_t v16;
  NSString *artistName;
  uint64_t v18;
  uint64_t v19;
  NSString *albumName;
  uint64_t v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXContextMediaSuggestionProducer;
  v11 = -[ATXContextMediaSuggestionProducer init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_mediaType = objc_msgSend(v12, "mediaType");
    v11->_mediaSubType = objc_msgSend(v12, "mediaSubType");
    objc_msgSend(v12, "title");
    v13 = objc_claimAutoreleasedReturnValue();
    trackName = v11->_trackName;
    v11->_trackName = (NSString *)v13;

    if (objc_msgSend(v12, "hasITunesStoreIdentifier"))
      v15 = objc_msgSend(v12, "iTunesStoreIdentifier");
    else
      v15 = 0;
    v11->_trackAdamId = v15;
    objc_msgSend(v12, "trackArtistName");
    v16 = objc_claimAutoreleasedReturnValue();
    artistName = v11->_artistName;
    v11->_artistName = (NSString *)v16;

    if (objc_msgSend(v12, "hasITunesStoreArtistIdentifier"))
      v18 = objc_msgSend(v12, "iTunesStoreArtistIdentifier");
    else
      v18 = 0;
    v11->_artistAdamId = v18;
    objc_msgSend(v12, "albumName");
    v19 = objc_claimAutoreleasedReturnValue();
    albumName = v11->_albumName;
    v11->_albumName = (NSString *)v19;

    if (objc_msgSend(v12, "hasITunesStoreAlbumIdentifier"))
      v21 = objc_msgSend(v12, "iTunesStoreAlbumIdentifier");
    else
      v21 = 0;
    v11->_albumAdamId = v21;
    objc_storeStrong((id *)&v11->_destDisplayName, a4);
    objc_storeStrong((id *)&v11->_expirationDate, a5);

  }
  return v11;
}

- (uint64_t)_localizedReason
{
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (a1)
  {
    v2 = a1[10];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
    {
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOW_PLAYING_DEST"), &stru_1E82C5A18, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      _PASValidatedFormat(v5, v6, v7, v8, v9, v10, v11, v12, v1[10]);
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      v4 = v5;
    }
    else
    {
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOW_PLAYING_NO_DEST"), &stru_1E82C5A18, 0);
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v1;
}

- (id)suggestionForTrackWithReason:(unint64_t)a3 score:(double)a4
{
  NSString *trackName;
  int64_t trackAdamId;
  int64_t mediaSubType;
  BOOL v8;
  void *v9;
  uint64_t v13;
  void *v14;

  trackName = self->_trackName;
  if (trackName
    && (trackAdamId = self->_trackAdamId) != 0
    && self->_mediaType == 2
    && ((mediaSubType = self->_mediaSubType, (unint64_t)(mediaSubType - 3) >= 2)
      ? (v8 = mediaSubType == 1)
      : (v8 = 1),
        !v8))
  {
    if (mediaSubType == 2)
      v13 = 9;
    else
      v13 = 2;
    -[ATXContextMediaSuggestionProducer _localizedReason]((uint64_t *)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXContextHeuristicSuggestionProducer mediaWithName:type:adamIdentifier:predictionReasons:localizedReason:score:expirationDate:](ATXContextHeuristicSuggestionProducer, "mediaWithName:type:adamIdentifier:predictionReasons:localizedReason:score:expirationDate:", trackName, v13, trackAdamId, a3, v14, self->_expirationDate, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)suggestionForArtistWithReason:(unint64_t)a3 score:(double)a4
{
  NSString *artistName;
  int64_t artistAdamId;
  int64_t mediaType;
  int64_t mediaSubType;
  uint64_t v11;
  void *v12;
  void *v14;

  artistName = self->_artistName;
  if (artistName)
  {
    artistAdamId = self->_artistAdamId;
    if (artistAdamId)
    {
      mediaType = self->_mediaType;
      if (mediaType == 1)
      {
        mediaSubType = self->_mediaSubType;
        if (mediaSubType == 1)
        {
LABEL_12:
          v11 = 6;
          goto LABEL_13;
        }
        if (mediaSubType == 5)
        {
          v11 = 15;
LABEL_13:
          -[ATXContextMediaSuggestionProducer _localizedReason]((uint64_t *)self);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXContextHeuristicSuggestionProducer mediaWithName:type:adamIdentifier:predictionReasons:localizedReason:score:expirationDate:](ATXContextHeuristicSuggestionProducer, "mediaWithName:type:adamIdentifier:predictionReasons:localizedReason:score:expirationDate:", artistName, v11, artistAdamId, a3, v14, self->_expirationDate, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          return v12;
        }
      }
      else if (mediaType == 2 && self->_mediaSubType == 1)
      {
        goto LABEL_12;
      }
    }
  }
  v12 = 0;
  return v12;
}

- (id)suggestionForAlbumWithReason:(unint64_t)a3 score:(double)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_destDisplayName, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end
