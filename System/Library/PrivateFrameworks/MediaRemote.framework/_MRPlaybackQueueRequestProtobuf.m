@implementation _MRPlaybackQueueRequestProtobuf

- (NSMutableArray)requestedRemoteArtworkFormats
{
  return self->_requestedRemoteArtworkFormats;
}

- (NSMutableArray)requestedArtworkFormats
{
  return self->_requestedArtworkFormats;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (int)location
{
  return self->_location;
}

- (int)length
{
  return self->_length;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isLegacyNowPlayingInfoRequest
{
  return self->_isLegacyNowPlayingInfoRequest;
}

- (BOOL)includeSections
{
  return self->_includeSections;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (BOOL)includeLyrics
{
  return self->_includeLyrics;
}

- (BOOL)includeLanguageOptions
{
  return self->_includeLanguageOptions;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeAvailableArtworkFormats
{
  return self->_includeAvailableArtworkFormats;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasLocation
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasLength
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasIsLegacyNowPlayingInfoRequest
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasIncludeSections
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasIncludeMetadata
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasIncludeLyrics
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasIncludeLanguageOptions
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasIncludeInfo
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIncludeAvailableArtworkFormats
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasCachingPolicy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasArtworkWidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasArtworkHeight
{
  return *(_WORD *)&self->_has & 1;
}

- (NSMutableArray)contentItemIdentifiers
{
  return self->_contentItemIdentifiers;
}

- (int)cachingPolicy
{
  return self->_cachingPolicy;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_location = a3;
}

- (void)setReturnContentItemAssetsInUserCompletion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_returnContentItemAssetsInUserCompletion = a3;
}

- (void)setRequestedRemoteArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_requestedRemoteArtworkFormats, a3);
}

- (void)setRequestedArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_requestedArtworkFormats, a3);
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (void)setLength:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setIsLegacyNowPlayingInfoRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isLegacyNowPlayingInfoRequest = a3;
}

- (void)setIncludeSections:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_includeSections = a3;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_includeMetadata = a3;
}

- (void)setIncludeLyrics:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_includeLyrics = a3;
}

- (void)setIncludeLanguageOptions:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_includeLanguageOptions = a3;
}

- (void)setIncludeInfo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_includeInfo = a3;
}

- (void)setIncludeAvailableArtworkFormats:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_includeAvailableArtworkFormats = a3;
}

- (void)setHasReturnContentItemAssetsInUserCompletion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)setHasLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setHasLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setHasIsLegacyNowPlayingInfoRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setHasIncludeSections:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setHasIncludeMetadata:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setHasIncludeLyrics:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHasIncludeLanguageOptions:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setHasIncludeInfo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasCachingPolicy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setHasArtworkWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setHasArtworkHeight:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setContentItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemIdentifiers, a3);
}

- (void)setCachingPolicy:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cachingPolicy = a3;
}

- (void)setArtworkWidth:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_artworkWidth = a3;
}

- (void)setArtworkHeight:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_artworkHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestedArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_context)
    PBDataWriterWriteSubmessage();
  if (self->_requestID)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = self->_contentItemIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_playerPath)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_label)
    PBDataWriterWriteStringField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = (__int16)self->_has;
    if ((v11 & 0x800) == 0)
    {
LABEL_32:
      if ((v11 & 0x40) == 0)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_33:
    PBDataWriterWriteBOOLField();
LABEL_34:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_requestedArtworkFormats;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_requestedRemoteArtworkFormats;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)clearContentItemIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_contentItemIdentifiers, "removeAllObjects");
}

- (void)addContentItemIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *contentItemIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentItemIdentifiers = self->_contentItemIdentifiers;
  v8 = v4;
  if (!contentItemIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentItemIdentifiers;
    self->_contentItemIdentifiers = v6;

    v4 = v8;
    contentItemIdentifiers = self->_contentItemIdentifiers;
  }
  -[NSMutableArray addObject:](contentItemIdentifiers, "addObject:", v4);

}

- (unint64_t)contentItemIdentifiersCount
{
  return -[NSMutableArray count](self->_contentItemIdentifiers, "count");
}

- (id)contentItemIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentItemIdentifiers, "objectAtIndex:", a3);
}

+ (Class)contentItemIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReturnContentItemAssetsInUserCompletion
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setIncludeParticipants:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_includeParticipants = a3;
}

- (void)setHasIncludeParticipants:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIncludeParticipants
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)clearRequestedArtworkFormats
{
  -[NSMutableArray removeAllObjects](self->_requestedArtworkFormats, "removeAllObjects");
}

- (void)addRequestedArtworkFormats:(id)a3
{
  id v4;
  NSMutableArray *requestedArtworkFormats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requestedArtworkFormats = self->_requestedArtworkFormats;
  v8 = v4;
  if (!requestedArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requestedArtworkFormats;
    self->_requestedArtworkFormats = v6;

    v4 = v8;
    requestedArtworkFormats = self->_requestedArtworkFormats;
  }
  -[NSMutableArray addObject:](requestedArtworkFormats, "addObject:", v4);

}

- (unint64_t)requestedArtworkFormatsCount
{
  return -[NSMutableArray count](self->_requestedArtworkFormats, "count");
}

- (id)requestedArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requestedArtworkFormats, "objectAtIndex:", a3);
}

+ (Class)requestedArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequestedRemoteArtworkFormats
{
  -[NSMutableArray removeAllObjects](self->_requestedRemoteArtworkFormats, "removeAllObjects");
}

- (void)addRequestedRemoteArtworkFormats:(id)a3
{
  id v4;
  NSMutableArray *requestedRemoteArtworkFormats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  v8 = v4;
  if (!requestedRemoteArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requestedRemoteArtworkFormats;
    self->_requestedRemoteArtworkFormats = v6;

    v4 = v8;
    requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  }
  -[NSMutableArray addObject:](requestedRemoteArtworkFormats, "addObject:", v4);

}

- (unint64_t)requestedRemoteArtworkFormatsCount
{
  return -[NSMutableArray count](self->_requestedRemoteArtworkFormats, "count");
}

- (id)requestedRemoteArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requestedRemoteArtworkFormats, "objectAtIndex:", a3);
}

+ (Class)requestedRemoteArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)setIncludeAlignments:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_includeAlignments = a3;
}

- (void)setHasIncludeAlignments:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIncludeAlignments
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackQueueRequestProtobuf;
  -[_MRPlaybackQueueRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  _MRPlaybackQueueContextProtobuf *context;
  void *v7;
  NSString *requestID;
  NSMutableArray *contentItemIdentifiers;
  void *v10;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v12;
  void *v13;
  NSString *label;
  __int16 v15;
  void *v16;
  NSMutableArray *requestedArtworkFormats;
  NSMutableArray *requestedRemoteArtworkFormats;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_location);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("location"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_length);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("length"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeMetadata);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("includeMetadata"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_artworkWidth);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("artworkWidth"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_artworkHeight);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("artworkHeight"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeLyrics);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("includeLyrics"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeSections);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("includeSections"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeInfo);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("includeInfo"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeLanguageOptions);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("includeLanguageOptions"));

  }
LABEL_11:
  context = self->_context;
  if (context)
  {
    -[_MRPlaybackQueueContextProtobuf dictionaryRepresentation](context, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("context"));

  }
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if (contentItemIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", contentItemIdentifiers, CFSTR("contentItemIdentifiers"));
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_returnContentItemAssetsInUserCompletion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("returnContentItemAssetsInUserCompletion"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("playerPath"));

  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cachingPolicy);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cachingPolicy"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  v15 = (__int16)self->_has;
  if ((v15 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLegacyNowPlayingInfoRequest);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("isLegacyNowPlayingInfoRequest"));

    v15 = (__int16)self->_has;
    if ((v15 & 0x800) == 0)
    {
LABEL_27:
      if ((v15 & 0x40) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeParticipants);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("includeParticipants"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeAvailableArtworkFormats);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("includeAvailableArtworkFormats"));

  }
LABEL_29:
  requestedArtworkFormats = self->_requestedArtworkFormats;
  if (requestedArtworkFormats)
    objc_msgSend(v3, "setObject:forKey:", requestedArtworkFormats, CFSTR("requestedArtworkFormats"));
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  if (requestedRemoteArtworkFormats)
    objc_msgSend(v3, "setObject:forKey:", requestedRemoteArtworkFormats, CFSTR("requestedRemoteArtworkFormats"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeAlignments);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("includeAlignments"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  __int16 v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t j;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t k;
  void *v19;
  id v20;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[15] = self->_location;
    *((_WORD *)v4 + 54) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_length;
  *((_WORD *)v4 + 54) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v4 + 101) = self->_includeMetadata;
  *((_WORD *)v4 + 54) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_artworkWidth;
  *((_WORD *)v4 + 54) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_artworkHeight;
  *((_WORD *)v4 + 54) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  *((_BYTE *)v4 + 100) = self->_includeLyrics;
  *((_WORD *)v4 + 54) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  *((_BYTE *)v4 + 103) = self->_includeSections;
  *((_WORD *)v4 + 54) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_49:
  *((_BYTE *)v4 + 98) = self->_includeInfo;
  *((_WORD *)v4 + 54) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 99) = self->_includeLanguageOptions;
    *((_WORD *)v4 + 54) |= 0x100u;
  }
LABEL_11:
  v20 = v4;
  if (self->_context)
    objc_msgSend(v4, "setContext:");
  if (self->_requestID)
    objc_msgSend(v20, "setRequestID:");
  if (-[_MRPlaybackQueueRequestProtobuf contentItemIdentifiersCount](self, "contentItemIdentifiersCount"))
  {
    objc_msgSend(v20, "clearContentItemIdentifiers");
    v6 = -[_MRPlaybackQueueRequestProtobuf contentItemIdentifiersCount](self, "contentItemIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRPlaybackQueueRequestProtobuf contentItemIdentifiersAtIndex:](self, "contentItemIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addContentItemIdentifiers:", v9);

      }
    }
  }
  v10 = v20;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((_BYTE *)v20 + 105) = self->_returnContentItemAssetsInUserCompletion;
    *((_WORD *)v20 + 54) |= 0x4000u;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v20, "setPlayerPath:");
    v10 = v20;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v10[6] = self->_cachingPolicy;
    *((_WORD *)v10 + 54) |= 4u;
  }
  if (self->_label)
  {
    objc_msgSend(v20, "setLabel:");
    v10 = v20;
  }
  v11 = (__int16)self->_has;
  if ((v11 & 0x2000) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_29;
LABEL_52:
    *((_BYTE *)v10 + 102) = self->_includeParticipants;
    *((_WORD *)v10 + 54) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  *((_BYTE *)v10 + 104) = self->_isLegacyNowPlayingInfoRequest;
  *((_WORD *)v10 + 54) |= 0x2000u;
  v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0)
    goto LABEL_52;
LABEL_29:
  if ((v11 & 0x40) != 0)
  {
LABEL_30:
    *((_BYTE *)v10 + 97) = self->_includeAvailableArtworkFormats;
    *((_WORD *)v10 + 54) |= 0x40u;
  }
LABEL_31:
  if (-[_MRPlaybackQueueRequestProtobuf requestedArtworkFormatsCount](self, "requestedArtworkFormatsCount"))
  {
    objc_msgSend(v20, "clearRequestedArtworkFormats");
    v12 = -[_MRPlaybackQueueRequestProtobuf requestedArtworkFormatsCount](self, "requestedArtworkFormatsCount");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
      {
        -[_MRPlaybackQueueRequestProtobuf requestedArtworkFormatsAtIndex:](self, "requestedArtworkFormatsAtIndex:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addRequestedArtworkFormats:", v15);

      }
    }
  }
  if (-[_MRPlaybackQueueRequestProtobuf requestedRemoteArtworkFormatsCount](self, "requestedRemoteArtworkFormatsCount"))
  {
    objc_msgSend(v20, "clearRequestedRemoteArtworkFormats");
    v16 = -[_MRPlaybackQueueRequestProtobuf requestedRemoteArtworkFormatsCount](self, "requestedRemoteArtworkFormatsCount");
    if (v16)
    {
      v17 = v16;
      for (k = 0; k != v17; ++k)
      {
        -[_MRPlaybackQueueRequestProtobuf requestedRemoteArtworkFormatsAtIndex:](self, "requestedRemoteArtworkFormatsAtIndex:", k);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addRequestedRemoteArtworkFormats:", v19);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v20 + 96) = self->_includeAlignments;
    *((_WORD *)v20 + 54) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  __int128 v36;
  __int128 v37;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_location;
    *(_WORD *)(v5 + 108) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_length;
  *(_WORD *)(v5 + 108) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 101) = self->_includeMetadata;
  *(_WORD *)(v5 + 108) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  *(double *)(v5 + 16) = self->_artworkWidth;
  *(_WORD *)(v5 + 108) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  *(double *)(v5 + 8) = self->_artworkHeight;
  *(_WORD *)(v5 + 108) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 100) = self->_includeLyrics;
  *(_WORD *)(v5 + 108) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v5 + 103) = self->_includeSections;
  *(_WORD *)(v5 + 108) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_50:
  *(_BYTE *)(v5 + 98) = self->_includeInfo;
  *(_WORD *)(v5 + 108) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 99) = self->_includeLanguageOptions;
    *(_WORD *)(v5 + 108) |= 0x100u;
  }
LABEL_11:
  v8 = -[_MRPlaybackQueueContextProtobuf copyWithZone:](self->_context, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v10;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_contentItemIdentifiers;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addContentItemIdentifiers:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v14);
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 105) = self->_returnContentItemAssetsInUserCompletion;
    *(_WORD *)(v6 + 108) |= 0x4000u;
  }
  v18 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v18;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_cachingPolicy;
    *(_WORD *)(v6 + 108) |= 4u;
  }
  v20 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 0x2000) != 0)
  {
    *(_BYTE *)(v6 + 104) = self->_isLegacyNowPlayingInfoRequest;
    *(_WORD *)(v6 + 108) |= 0x2000u;
    v22 = (__int16)self->_has;
    if ((v22 & 0x800) == 0)
    {
LABEL_24:
      if ((v22 & 0x40) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_24;
  }
  *(_BYTE *)(v6 + 102) = self->_includeParticipants;
  *(_WORD *)(v6 + 108) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    *(_BYTE *)(v6 + 97) = self->_includeAvailableArtworkFormats;
    *(_WORD *)(v6 + 108) |= 0x40u;
  }
LABEL_26:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = self->_requestedArtworkFormats;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRequestedArtworkFormats:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v25);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = self->_requestedRemoteArtworkFormats;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v6, "addRequestedRemoteArtworkFormats:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v31);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 96) = self->_includeAlignments;
    *(_WORD *)(v6 + 108) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  _MRPlaybackQueueContextProtobuf *context;
  NSString *requestID;
  NSMutableArray *contentItemIdentifiers;
  __int16 v10;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  __int16 v12;
  NSString *label;
  __int16 v14;
  NSMutableArray *requestedArtworkFormats;
  NSMutableArray *requestedRemoteArtworkFormats;
  __int16 v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_118;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 54);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_location != *((_DWORD *)v4 + 15))
      goto LABEL_118;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_length != *((_DWORD *)v4 + 14))
      goto LABEL_118;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0)
      goto LABEL_118;
    if (self->_includeMetadata)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_artworkWidth != *((double *)v4 + 2))
      goto LABEL_118;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_artworkHeight != *((double *)v4 + 1))
      goto LABEL_118;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0)
      goto LABEL_118;
    if (self->_includeLyrics)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) == 0)
      goto LABEL_118;
    if (self->_includeSections)
    {
      if (!*((_BYTE *)v4 + 103))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 103))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_118;
    if (self->_includeInfo)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_118;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0)
      goto LABEL_118;
    if (self->_includeLanguageOptions)
    {
      if (!*((_BYTE *)v4 + 99))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_118;
  }
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 5)
    && !-[_MRPlaybackQueueContextProtobuf isEqual:](context, "isEqual:"))
  {
    goto LABEL_118;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_118;
  }
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if ((unint64_t)contentItemIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](contentItemIdentifiers, "isEqual:"))
      goto LABEL_118;
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) == 0)
      goto LABEL_118;
    if (self->_returnContentItemAssetsInUserCompletion)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 8))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_118;
    v10 = (__int16)self->_has;
  }
  v12 = *((_WORD *)v4 + 54);
  if ((v10 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_cachingPolicy != *((_DWORD *)v4 + 6))
      goto LABEL_118;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_118;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_118;
    v10 = (__int16)self->_has;
  }
  v14 = *((_WORD *)v4 + 54);
  if ((v10 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0)
      goto LABEL_118;
    if (self->_isLegacyNowPlayingInfoRequest)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_118;
  }
  if ((v10 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0)
      goto LABEL_118;
    if (self->_includeParticipants)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0)
      goto LABEL_118;
    if (self->_includeAvailableArtworkFormats)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_118;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  requestedArtworkFormats = self->_requestedArtworkFormats;
  if ((unint64_t)requestedArtworkFormats | *((_QWORD *)v4 + 10)
    && !-[NSMutableArray isEqual:](requestedArtworkFormats, "isEqual:"))
  {
    goto LABEL_118;
  }
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  if ((unint64_t)requestedRemoteArtworkFormats | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](requestedRemoteArtworkFormats, "isEqual:"))
      goto LABEL_118;
  }
  v17 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v17 & 0x20) != 0)
    {
      if (self->_includeAlignments)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_118;
      }
      else if (*((_BYTE *)v4 + 96))
      {
        goto LABEL_118;
      }
      v18 = 1;
      goto LABEL_119;
    }
LABEL_118:
    v18 = 0;
    goto LABEL_119;
  }
  v18 = (v17 & 0x20) == 0;
LABEL_119:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  double artworkWidth;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double artworkHeight;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  NSUInteger v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v36 = 2654435761 * self->_location;
    if ((has & 8) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_length;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_4;
LABEL_11:
      v34 = 0;
      if ((has & 2) != 0)
        goto LABEL_5;
LABEL_12:
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v36 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v35 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_11;
LABEL_4:
  v34 = 2654435761 * self->_includeMetadata;
  if ((has & 2) == 0)
    goto LABEL_12;
LABEL_5:
  artworkWidth = self->_artworkWidth;
  v5 = -artworkWidth;
  if (artworkWidth >= 0.0)
    v5 = self->_artworkWidth;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_15:
  if ((has & 1) != 0)
  {
    artworkHeight = self->_artworkHeight;
    v11 = -artworkHeight;
    if (artworkHeight >= 0.0)
      v11 = self->_artworkHeight;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x200) == 0)
  {
    v32 = 0;
    if ((has & 0x1000) != 0)
      goto LABEL_25;
LABEL_28:
    v31 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_26;
    goto LABEL_29;
  }
  v32 = 2654435761 * self->_includeLyrics;
  if ((has & 0x1000) == 0)
    goto LABEL_28;
LABEL_25:
  v31 = 2654435761 * self->_includeSections;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    v30 = 2654435761 * self->_includeInfo;
    goto LABEL_30;
  }
LABEL_29:
  v30 = 0;
LABEL_30:
  v33 = v9;
  if ((has & 0x100) != 0)
    v29 = 2654435761 * self->_includeLanguageOptions;
  else
    v29 = 0;
  v28 = -[_MRPlaybackQueueContextProtobuf hash](self->_context, "hash");
  v27 = -[NSString hash](self->_requestID, "hash");
  v26 = -[NSMutableArray hash](self->_contentItemIdentifiers, "hash");
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    v25 = 2654435761 * self->_returnContentItemAssetsInUserCompletion;
  else
    v25 = 0;
  v24 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v14 = 2654435761 * self->_cachingPolicy;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_label, "hash");
  v16 = (__int16)self->_has;
  if ((v16 & 0x2000) == 0)
  {
    v17 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_41;
LABEL_44:
    v18 = 0;
    if ((v16 & 0x40) != 0)
      goto LABEL_42;
    goto LABEL_45;
  }
  v17 = 2654435761 * self->_isLegacyNowPlayingInfoRequest;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_44;
LABEL_41:
  v18 = 2654435761 * self->_includeParticipants;
  if ((v16 & 0x40) != 0)
  {
LABEL_42:
    v19 = 2654435761 * self->_includeAvailableArtworkFormats;
    goto LABEL_46;
  }
LABEL_45:
  v19 = 0;
LABEL_46:
  v20 = -[NSMutableArray hash](self->_requestedArtworkFormats, "hash");
  v21 = -[NSMutableArray hash](self->_requestedRemoteArtworkFormats, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v22 = 2654435761 * self->_includeAlignments;
  else
    v22 = 0;
  return v35 ^ v36 ^ v34 ^ v8 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  _MRPlaybackQueueContextProtobuf *context;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
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
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x10) != 0)
  {
    self->_location = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)v4 + 54);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_length = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x400) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_includeMetadata = *((_BYTE *)v4 + 101);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_artworkWidth = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 1) == 0)
  {
LABEL_6:
    if ((v6 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_artworkHeight = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x200) == 0)
  {
LABEL_7:
    if ((v6 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_includeLyrics = *((_BYTE *)v4 + 100);
  *(_WORD *)&self->_has |= 0x200u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x1000) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_includeSections = *((_BYTE *)v4 + 103);
  *(_WORD *)&self->_has |= 0x1000u;
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x80) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  self->_includeInfo = *((_BYTE *)v4 + 98);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
LABEL_10:
    self->_includeLanguageOptions = *((_BYTE *)v4 + 99);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  context = self->_context;
  v8 = *((_QWORD *)v5 + 5);
  if (context)
  {
    if (v8)
      -[_MRPlaybackQueueContextProtobuf mergeFrom:](context, "mergeFrom:");
  }
  else if (v8)
  {
    -[_MRPlaybackQueueRequestProtobuf setContext:](self, "setContext:");
  }
  if (*((_QWORD *)v5 + 9))
    -[_MRPlaybackQueueRequestProtobuf setRequestID:](self, "setRequestID:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = *((id *)v5 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        -[_MRPlaybackQueueRequestProtobuf addContentItemIdentifiers:](self, "addContentItemIdentifiers:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v11);
  }

  if ((*((_WORD *)v5 + 54) & 0x4000) != 0)
  {
    self->_returnContentItemAssetsInUserCompletion = *((_BYTE *)v5 + 105);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  playerPath = self->_playerPath;
  v15 = *((_QWORD *)v5 + 8);
  if (playerPath)
  {
    if (v15)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else if (v15)
  {
    -[_MRPlaybackQueueRequestProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  if ((*((_WORD *)v5 + 54) & 4) != 0)
  {
    self->_cachingPolicy = *((_DWORD *)v5 + 6);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 6))
    -[_MRPlaybackQueueRequestProtobuf setLabel:](self, "setLabel:");
  v16 = *((_WORD *)v5 + 54);
  if ((v16 & 0x2000) != 0)
  {
    self->_isLegacyNowPlayingInfoRequest = *((_BYTE *)v5 + 104);
    *(_WORD *)&self->_has |= 0x2000u;
    v16 = *((_WORD *)v5 + 54);
    if ((v16 & 0x800) == 0)
    {
LABEL_47:
      if ((v16 & 0x40) == 0)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  else if ((*((_WORD *)v5 + 54) & 0x800) == 0)
  {
    goto LABEL_47;
  }
  self->_includeParticipants = *((_BYTE *)v5 + 102);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v5 + 54) & 0x40) != 0)
  {
LABEL_48:
    self->_includeAvailableArtworkFormats = *((_BYTE *)v5 + 97);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_49:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v5 + 10);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[_MRPlaybackQueueRequestProtobuf addRequestedArtworkFormats:](self, "addRequestedArtworkFormats:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v5 + 11);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[_MRPlaybackQueueRequestProtobuf addRequestedRemoteArtworkFormats:](self, "addRequestedRemoteArtworkFormats:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v24);
  }

  if ((*((_WORD *)v5 + 54) & 0x20) != 0)
  {
    self->_includeAlignments = *((_BYTE *)v5 + 96);
    *(_WORD *)&self->_has |= 0x20u;
  }

}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)returnContentItemAssetsInUserCompletion
{
  return self->_returnContentItemAssetsInUserCompletion;
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (BOOL)includeParticipants
{
  return self->_includeParticipants;
}

- (BOOL)includeAlignments
{
  return self->_includeAlignments;
}

@end
