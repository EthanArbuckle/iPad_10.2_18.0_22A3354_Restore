@implementation MRPlaybackQueueRequest

- (id)requestByRemovingArtwork
{
  void *v2;

  v2 = (void *)-[MRPlaybackQueueRequest copy](self, "copy");
  objc_msgSend(v2, "setArtworkWidth:", 0.0);
  objc_msgSend(v2, "setArtworkHeight:", 0.0);
  return v2;
}

- (MRPlaybackQueueRequest)skeleton
{
  MRPlaybackQueueRequest *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MRPlaybackQueueRequest);
  if (-[MRPlaybackQueueRequest hasLocation](self, "hasLocation"))
    -[MRPlaybackQueueRequest setLocation:](v3, "setLocation:", -[MRPlaybackQueueRequest location](self, "location"));
  if (-[MRPlaybackQueueRequest hasLength](self, "hasLength"))
    -[MRPlaybackQueueRequest setLength:](v3, "setLength:", -[MRPlaybackQueueRequest length](self, "length"));
  if (-[MRPlaybackQueueRequest hasCachingPolicy](self, "hasCachingPolicy"))
    -[MRPlaybackQueueRequest setCachingPolicy:](v3, "setCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy"));
  if (-[MRPlaybackQueueRequest hasLegacyNowPlayingInfoRequest](self, "hasLegacyNowPlayingInfoRequest"))
    -[MRPlaybackQueueRequest setLegacyNowPlayingInfoRequest:](v3, "setLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueRequest setRequestIdentifier:](v3, "setRequestIdentifier:", v4);

  -[MRPlaybackQueueRequest label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueRequest setLabel:](v3, "setLabel:", v5);

  -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueRequest setContentItemIdentifiers:](v3, "setContentItemIdentifiers:", v6);

  return v3;
}

- (BOOL)hasLegacyNowPlayingInfoRequest
{
  return self->_hasLegacyNowPlayingInfoRequest;
}

- (BOOL)hasCachingPolicy
{
  return self->_hasCachingPolicy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLocation:", -[MRPlaybackQueueRequest location](self, "location"));
  objc_msgSend(v5, "setHasLocation:", -[MRPlaybackQueueRequest hasLocation](self, "hasLocation"));
  objc_msgSend(v5, "setLength:", -[MRPlaybackQueueRequest length](self, "length"));
  objc_msgSend(v5, "setHasLength:", -[MRPlaybackQueueRequest hasLength](self, "hasLength"));
  objc_msgSend(v5, "setIncludeMetadata:", -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata"));
  objc_msgSend(v5, "setHasIncludeMetadata:", -[MRPlaybackQueueRequest hasIncludeMetadata](self, "hasIncludeMetadata"));
  -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
  objc_msgSend(v5, "setArtworkWidth:");
  objc_msgSend(v5, "setHasArtworkWidth:", -[MRPlaybackQueueRequest hasArtworkWidth](self, "hasArtworkWidth"));
  -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
  objc_msgSend(v5, "setArtworkHeight:");
  objc_msgSend(v5, "setHasArtworkHeight:", -[MRPlaybackQueueRequest hasArtworkHeight](self, "hasArtworkHeight"));
  objc_msgSend(v5, "setIncludeLyrics:", -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"));
  objc_msgSend(v5, "setHasIncludeLyrics:", -[MRPlaybackQueueRequest hasIncludeLyrics](self, "hasIncludeLyrics"));
  objc_msgSend(v5, "setIncludeSections:", -[MRPlaybackQueueRequest includeSections](self, "includeSections"));
  objc_msgSend(v5, "setHasIncludeSections:", -[MRPlaybackQueueRequest hasIncludeSections](self, "hasIncludeSections"));
  objc_msgSend(v5, "setIncludeInfo:", -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"));
  objc_msgSend(v5, "setHasIncludeInfo:", -[MRPlaybackQueueRequest hasIncludeInfo](self, "hasIncludeInfo"));
  objc_msgSend(v5, "setIncludeAlignments:", -[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"));
  objc_msgSend(v5, "setHasIncludeAlignments:", -[MRPlaybackQueueRequest hasIncludeAlignments](self, "hasIncludeAlignments"));
  objc_msgSend(v5, "setIncludeLanguageOptions:", -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"));
  objc_msgSend(v5, "setHasIncludeLanguageOptions:", -[MRPlaybackQueueRequest hasIncludeLanguageOptions](self, "hasIncludeLanguageOptions"));
  objc_msgSend(v5, "setIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest includeAvailableArtworkFormats](self, "includeAvailableArtworkFormats"));
  objc_msgSend(v5, "setHasIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](self, "hasIncludeAvailableArtworkFormats"));
  -[MRPlaybackQueueRequest requestedArtworkFormats](self, "requestedArtworkFormats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedArtworkFormats:", v6);

  -[MRPlaybackQueueRequest requestedRemoteArtworkFormats](self, "requestedRemoteArtworkFormats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedRemoteArtworkFormats:", v7);

  objc_msgSend(v5, "setLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  objc_msgSend(v5, "setHasLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  objc_msgSend(v5, "setCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy"));
  objc_msgSend(v5, "setHasCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy") != 0);
  -[MRPlaybackQueueRequest playerPath](self, "playerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlayerPath:", v9);

  -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setRequestIdentifier:", v11);

  -[MRPlaybackQueueRequest label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setLabel:", v13);

  -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setContentItemIdentifiers:", v15);

  return v5;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)location
{
  return self->_location;
}

- (int64_t)length
{
  return self->_length;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (BOOL)includeLanguageOptions
{
  return self->_includeLanguageOptions;
}

- (BOOL)includeSections
{
  return self->_includeSections;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)hasLength
{
  return self->_hasLength;
}

- (BOOL)includeLyrics
{
  return self->_includeLyrics;
}

- (NSArray)requestedRemoteArtworkFormats
{
  return self->_requestedRemoteArtworkFormats;
}

- (BOOL)includeAvailableArtworkFormats
{
  return self->_includeAvailableArtworkFormats;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isLegacyNowPlayingInfoRequest
{
  return self->_legacyNowPlayingInfoRequest;
}

- (unsigned)cachingPolicy
{
  return self->_cachingPolicy;
}

- (void)setContentItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
  self->_hasLocation = 1;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
  self->_hasLength = 1;
}

- (NSArray)requestedArtworkFormats
{
  return self->_requestedArtworkFormats;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  self->_includeMetadata = a3;
  if (a3)
    -[MRPlaybackQueueRequest setIncludeAvailableArtworkFormats:](self, "setIncludeAvailableArtworkFormats:", 1);
  self->_hasIncludeMetadata = 1;
}

- (void)setIncludeAvailableArtworkFormats:(BOOL)a3
{
  self->_includeAvailableArtworkFormats = a3;
  self->_hasIncludeAvailableArtworkFormats = 1;
}

- (void)setIncludeLanguageOptions:(BOOL)a3
{
  self->_includeLanguageOptions = a3;
  self->_hasIncludeLanguageOptions = 1;
}

- (void)setIncludeInfo:(BOOL)a3
{
  self->_includeInfo = a3;
  self->_hasIncludeInfo = 1;
}

- (BOOL)hasIncludeAvailableArtworkFormats
{
  return self->_hasIncludeAvailableArtworkFormats;
}

- (BOOL)hasArtworkWidth
{
  return self->_hasArtworkWidth;
}

- (BOOL)hasArtworkHeight
{
  return self->_hasArtworkHeight;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
  self->_hasArtworkWidth = 1;
}

- (void)setArtworkHeight:(double)a3
{
  self->_artworkHeight = a3;
  self->_hasArtworkHeight = 1;
}

- (void)setLegacyNowPlayingInfoRequest:(BOOL)a3
{
  self->_legacyNowPlayingInfoRequest = a3;
  self->_hasLegacyNowPlayingInfoRequest = 1;
}

- (void)setCachingPolicy:(unsigned int)a3
{
  self->_cachingPolicy = a3;
  self->_hasCachingPolicy = 1;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (BOOL)hasIncludeSections
{
  return self->_hasIncludeSections;
}

- (BOOL)hasIncludeMetadata
{
  return self->_hasIncludeMetadata;
}

- (BOOL)hasIncludeLyrics
{
  return self->_hasIncludeLyrics;
}

- (BOOL)hasIncludeLanguageOptions
{
  return self->_hasIncludeLanguageOptions;
}

- (BOOL)hasIncludeInfo
{
  return self->_hasIncludeInfo;
}

- (void)setRequestedRemoteArtworkFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setRequestedArtworkFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (void)setIncludeSections:(BOOL)a3
{
  self->_includeSections = a3;
  self->_hasIncludeSections = 1;
}

- (void)setIncludeLyrics:(BOOL)a3
{
  self->_includeLyrics = a3;
  self->_hasIncludeLyrics = 1;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (void)setHasLength:(BOOL)a3
{
  self->_hasLength = a3;
}

- (void)setHasLegacyNowPlayingInfoRequest:(BOOL)a3
{
  self->_hasLegacyNowPlayingInfoRequest = a3;
}

- (void)setHasIncludeSections:(BOOL)a3
{
  self->_hasIncludeSections = a3;
}

- (void)setHasIncludeMetadata:(BOOL)a3
{
  self->_hasIncludeMetadata = a3;
}

- (void)setHasIncludeLyrics:(BOOL)a3
{
  self->_hasIncludeLyrics = a3;
}

- (void)setHasIncludeLanguageOptions:(BOOL)a3
{
  self->_hasIncludeLanguageOptions = a3;
}

- (void)setHasIncludeInfo:(BOOL)a3
{
  self->_hasIncludeInfo = a3;
}

- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3
{
  self->_hasIncludeAvailableArtworkFormats = a3;
}

- (void)setHasCachingPolicy:(BOOL)a3
{
  self->_hasCachingPolicy = a3;
}

- (void)setHasArtworkWidth:(BOOL)a3
{
  self->_hasArtworkWidth = a3;
}

- (void)setHasArtworkHeight:(BOOL)a3
{
  self->_hasArtworkHeight = a3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v4);

  -[MRPlaybackQueueRequest label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v5);

  -[MRPlaybackQueueRequest _buildRequestedPropertiesDescription](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    for (i = 0; ; ++i)
    {
      -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") > 3)
      {

        if (i >= 3)
        {
LABEL_8:
          -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("/IDs (%ld): %@"), objc_msgSend(v15, "count"), v8);

          break;
        }
      }
      else
      {
        -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (i >= v12)
          goto LABEL_8;
      }
      -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v14);
    }
  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (NSArray)contentItemIdentifiers
{
  return self->_contentItemIdentifiers;
}

- (BOOL)includeRemoteArtwork
{
  void *v2;
  BOOL v3;

  -[MRPlaybackQueueRequest requestedRemoteArtworkFormats](self, "requestedRemoteArtworkFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)exactMatch:(id)a3
{
  MRPlaybackQueueRequest *v4;
  MRPlaybackQueueRequest *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v14;

  v4 = (MRPlaybackQueueRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else if (v4
         && (v6 = -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata"),
             v6 == -[MRPlaybackQueueRequest includeMetadata](v5, "includeMetadata"))
         && (v7 = -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"),
             v7 == -[MRPlaybackQueueRequest includeInfo](v5, "includeInfo"))
         && (v8 = -[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"),
             v8 == -[MRPlaybackQueueRequest includeAlignments](v5, "includeAlignments"))
         && (v9 = -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"),
             v9 == -[MRPlaybackQueueRequest includeLyrics](v5, "includeLyrics"))
         && (v10 = -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"),
             v10 == -[MRPlaybackQueueRequest includeLanguageOptions](v5, "includeLanguageOptions"))
         && (v11 = -[MRPlaybackQueueRequest includeSections](self, "includeSections"),
             v11 == -[MRPlaybackQueueRequest includeSections](v5, "includeSections")))
  {
    v14 = -[MRPlaybackQueueRequest includeArtwork](self, "includeArtwork");
    v12 = v14 ^ -[MRPlaybackQueueRequest includeArtwork](v5, "includeArtwork") ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeArtwork
{
  double v3;
  double v4;

  -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
  if (fabs(v3) <= 2.22044605e-16)
    return 0;
  -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
  return fabs(v4) > 2.22044605e-16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestedArtworkFormats, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (_NSRange)range
{
  int64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[MRPlaybackQueueRequest location](self, "location");
  v4 = -[MRPlaybackQueueRequest length](self, "length");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "includeMetadata"))
    -[MRPlaybackQueueRequest setIncludeMetadata:](self, "setIncludeMetadata:", objc_msgSend(v10, "includeMetadata"));
  if (objc_msgSend(v10, "includeInfo"))
    -[MRPlaybackQueueRequest setIncludeInfo:](self, "setIncludeInfo:", objc_msgSend(v10, "includeInfo"));
  if (objc_msgSend(v10, "includeAlignments"))
    -[MRPlaybackQueueRequest setIncludeAlignments:](self, "setIncludeAlignments:", objc_msgSend(v10, "includeAlignments"));
  if (objc_msgSend(v10, "includeLyrics"))
    -[MRPlaybackQueueRequest setIncludeLyrics:](self, "setIncludeLyrics:", objc_msgSend(v10, "includeLyrics"));
  if (objc_msgSend(v10, "includeSections"))
    -[MRPlaybackQueueRequest setIncludeSections:](self, "setIncludeSections:", objc_msgSend(v10, "includeSections"));
  if (objc_msgSend(v10, "includeLanguageOptions"))
    -[MRPlaybackQueueRequest setIncludeLanguageOptions:](self, "setIncludeLanguageOptions:", objc_msgSend(v10, "includeLanguageOptions"));
  if (objc_msgSend(v10, "hasArtworkWidth"))
  {
    objc_msgSend(v10, "artworkWidth");
    -[MRPlaybackQueueRequest setArtworkWidth:](self, "setArtworkWidth:");
  }
  if (objc_msgSend(v10, "hasArtworkHeight"))
  {
    objc_msgSend(v10, "artworkHeight");
    -[MRPlaybackQueueRequest setArtworkHeight:](self, "setArtworkHeight:");
  }
  if (objc_msgSend(v10, "hasIncludeAvailableArtworkFormats"))
    -[MRPlaybackQueueRequest setIncludeAvailableArtworkFormats:](self, "setIncludeAvailableArtworkFormats:", objc_msgSend(v10, "includeAvailableArtworkFormats"));
  objc_msgSend(v10, "requestedArtworkFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v10, "requestedArtworkFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest setRequestedArtworkFormats:](self, "setRequestedArtworkFormats:", v6);

  }
  objc_msgSend(v10, "requestedRemoteArtworkFormats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v10, "requestedRemoteArtworkFormats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest setRequestedRemoteArtworkFormats:](self, "setRequestedRemoteArtworkFormats:", v9);

  }
}

- (BOOL)hasRange
{
  _BOOL4 v3;

  v3 = -[MRPlaybackQueueRequest hasLocation](self, "hasLocation");
  if (v3)
    LOBYTE(v3) = -[MRPlaybackQueueRequest hasLength](self, "hasLength");
  return v3;
}

- (BOOL)shouldRequestItem
{
  return -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata")
      || -[MRPlaybackQueueRequest shouldRequestItemNotConsideringMetadata](self, "shouldRequestItemNotConsideringMetadata");
}

- (MRPlaybackQueueRequest)initWithData:(id)a3
{
  id v4;
  _MRPlaybackQueueRequestProtobuf *v5;
  MRPlaybackQueueRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRPlaybackQueueRequestProtobuf initWithData:]([_MRPlaybackQueueRequestProtobuf alloc], "initWithData:", v4);

    self = -[MRPlaybackQueueRequest initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRPlaybackQueueRequest)initWithProtobuf:(id)a3
{
  id v4;
  MRPlaybackQueueRequest *v5;
  double v6;
  double v7;
  MRPlayerPath *v8;
  void *v9;
  uint64_t v10;
  MRPlayerPath *playerPath;
  void *v12;
  uint64_t v13;
  NSString *requestIdentifier;
  void *v15;
  uint64_t v16;
  NSString *label;
  void *v18;
  uint64_t v19;
  NSArray *contentItemIdentifiers;
  void *v21;
  uint64_t v22;
  NSArray *requestedArtworkFormats;
  void *v24;
  uint64_t v25;
  NSArray *requestedRemoteArtworkFormats;
  MRPlaybackQueueRequest *v27;
  objc_super v29;

  v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)MRPlaybackQueueRequest;
    v5 = -[MRPlaybackQueueRequest init](&v29, sel_init);
    if (v5)
    {
      v5->_location = (int)objc_msgSend(v4, "location");
      v5->_hasLocation = objc_msgSend(v4, "hasLocation");
      v5->_length = (int)objc_msgSend(v4, "length");
      v5->_hasLength = objc_msgSend(v4, "hasLength");
      v5->_includeMetadata = objc_msgSend(v4, "includeMetadata");
      v5->_hasIncludeMetadata = objc_msgSend(v4, "hasIncludeMetadata");
      objc_msgSend(v4, "artworkWidth");
      v5->_artworkWidth = v6;
      v5->_hasArtworkWidth = objc_msgSend(v4, "hasArtworkWidth");
      objc_msgSend(v4, "artworkHeight");
      v5->_artworkHeight = v7;
      v5->_hasArtworkHeight = objc_msgSend(v4, "hasArtworkHeight");
      v5->_includeLyrics = objc_msgSend(v4, "includeLyrics");
      v5->_hasIncludeLyrics = objc_msgSend(v4, "hasIncludeLyrics");
      v5->_includeSections = objc_msgSend(v4, "includeSections");
      v5->_hasIncludeSections = objc_msgSend(v4, "hasIncludeSections");
      v5->_includeInfo = objc_msgSend(v4, "includeInfo");
      v5->_hasIncludeInfo = objc_msgSend(v4, "hasIncludeInfo");
      v5->_includeAlignments = objc_msgSend(v4, "includeAlignments");
      v5->_hasIncludeAlignments = objc_msgSend(v4, "hasIncludeAlignments");
      v5->_includeLanguageOptions = objc_msgSend(v4, "includeLanguageOptions");
      v5->_hasIncludeLanguageOptions = objc_msgSend(v4, "hasIncludeLanguageOptions");
      v5->_includeAvailableArtworkFormats = objc_msgSend(v4, "includeAvailableArtworkFormats");
      v5->_hasIncludeAvailableArtworkFormats = objc_msgSend(v4, "hasIncludeAvailableArtworkFormats");
      v5->_legacyNowPlayingInfoRequest = objc_msgSend(v4, "isLegacyNowPlayingInfoRequest");
      v5->_hasLegacyNowPlayingInfoRequest = objc_msgSend(v4, "hasIsLegacyNowPlayingInfoRequest");
      v5->_cachingPolicy = objc_msgSend(v4, "cachingPolicy");
      v5->_hasCachingPolicy = objc_msgSend(v4, "hasCachingPolicy");
      if (objc_msgSend(v4, "hasPlayerPath"))
      {
        v8 = [MRPlayerPath alloc];
        objc_msgSend(v4, "playerPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MRPlayerPath initWithProtobuf:](v8, "initWithProtobuf:", v9);
        playerPath = v5->_playerPath;
        v5->_playerPath = (MRPlayerPath *)v10;

      }
      objc_msgSend(v4, "requestID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v13;

      objc_msgSend(v4, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      label = v5->_label;
      v5->_label = (NSString *)v16;

      objc_msgSend(v4, "contentItemIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      contentItemIdentifiers = v5->_contentItemIdentifiers;
      v5->_contentItemIdentifiers = (NSArray *)v19;

      objc_msgSend(v4, "requestedArtworkFormats");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      requestedArtworkFormats = v5->_requestedArtworkFormats;
      v5->_requestedArtworkFormats = (NSArray *)v22;

      objc_msgSend(v4, "requestedRemoteArtworkFormats");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "copy");
      requestedRemoteArtworkFormats = v5->_requestedRemoteArtworkFormats;
      v5->_requestedRemoteArtworkFormats = (NSArray *)v25;

    }
    self = v5;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)containsNonDefaultAssets
{
  void *v3;

  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "match:", self);

  return (char)self;
}

- (BOOL)match:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  v5 = -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata");
  if (v5 == objc_msgSend(v4, "includeMetadata")
    || (v6 = -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"),
        v6 == objc_msgSend(v4, "includeInfo"))
    || (v7 = -[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"),
        v7 == objc_msgSend(v4, "includeAlignments"))
    || (v8 = -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"),
        v8 == objc_msgSend(v4, "includeLyrics"))
    || (v9 = -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"),
        v9 == objc_msgSend(v4, "includeLanguageOptions"))
    || (v10 = -[MRPlaybackQueueRequest includeSections](self, "includeSections"),
        v10 == objc_msgSend(v4, "includeSections")))
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v11 = -[MRPlaybackQueueRequest includeArtwork](self, "includeArtwork");
    v12 = v11 ^ objc_msgSend(v4, "includeArtwork") ^ 1;
  }

  return v12;
}

+ (id)defaultPlaybackQueueRequestWithRange:(_NSRange)a3
{
  MRPlaybackQueueRequest *v3;

  v3 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", a3.location, a3.length);
  -[MRPlaybackQueueRequest setIncludeMetadata:](v3, "setIncludeMetadata:", 1);
  -[MRPlaybackQueueRequest setIncludeLanguageOptions:](v3, "setIncludeLanguageOptions:", 1);
  return v3;
}

- (MRPlaybackQueueRequest)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  MRPlaybackQueueRequest *result;

  length = a3.length;
  location = a3.location;
  result = -[MRPlaybackQueueRequest init](self, "init");
  if (result)
  {
    *(_WORD *)&result->_hasLocation = 257;
    result->_location = location;
    result->_length = length;
  }
  return result;
}

+ (id)defaultPlaybackQueueRequest
{
  return (id)objc_msgSend(a1, "defaultPlaybackQueueRequestWithRange:", 0, 1);
}

- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3
{
  id v4;
  MRPlaybackQueueRequest *v5;
  uint64_t v6;
  NSArray *contentItemIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackQueueRequest;
  v5 = -[MRPlaybackQueueRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contentItemIdentifiers = v5->_contentItemIdentifiers;
    v5->_contentItemIdentifiers = (NSArray *)v6;

  }
  return v5;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlaybackQueueRequest protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRPlaybackQueueRequestProtobuf)protobuf
{
  _MRPlaybackQueueRequestProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(_MRPlaybackQueueRequestProtobuf);
  -[_MRPlaybackQueueRequestProtobuf setLocation:](v3, "setLocation:", -[MRPlaybackQueueRequest location](self, "location"));
  -[_MRPlaybackQueueRequestProtobuf setHasLocation:](v3, "setHasLocation:", -[MRPlaybackQueueRequest hasLocation](self, "hasLocation"));
  -[_MRPlaybackQueueRequestProtobuf setLength:](v3, "setLength:", -[MRPlaybackQueueRequest length](self, "length"));
  -[_MRPlaybackQueueRequestProtobuf setHasLength:](v3, "setHasLength:", -[MRPlaybackQueueRequest hasLength](self, "hasLength"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeMetadata:](v3, "setIncludeMetadata:", -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeMetadata:](v3, "setHasIncludeMetadata:", -[MRPlaybackQueueRequest hasIncludeMetadata](self, "hasIncludeMetadata"));
  -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
  -[_MRPlaybackQueueRequestProtobuf setArtworkWidth:](v3, "setArtworkWidth:");
  -[_MRPlaybackQueueRequestProtobuf setHasArtworkWidth:](v3, "setHasArtworkWidth:", -[MRPlaybackQueueRequest hasArtworkWidth](self, "hasArtworkWidth"));
  -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
  -[_MRPlaybackQueueRequestProtobuf setArtworkHeight:](v3, "setArtworkHeight:");
  -[_MRPlaybackQueueRequestProtobuf setHasArtworkHeight:](v3, "setHasArtworkHeight:", -[MRPlaybackQueueRequest hasArtworkHeight](self, "hasArtworkHeight"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeLyrics:](v3, "setIncludeLyrics:", -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeLyrics:](v3, "setHasIncludeLyrics:", -[MRPlaybackQueueRequest hasIncludeLyrics](self, "hasIncludeLyrics"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeSections:](v3, "setIncludeSections:", -[MRPlaybackQueueRequest includeSections](self, "includeSections"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeSections:](v3, "setHasIncludeSections:", -[MRPlaybackQueueRequest hasIncludeSections](self, "hasIncludeSections"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeInfo:](v3, "setIncludeInfo:", -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeInfo:](v3, "setHasIncludeInfo:", -[MRPlaybackQueueRequest hasIncludeInfo](self, "hasIncludeInfo"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeLanguageOptions:](v3, "setIncludeLanguageOptions:", -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeLanguageOptions:](v3, "setHasIncludeLanguageOptions:", -[MRPlaybackQueueRequest hasIncludeLanguageOptions](self, "hasIncludeLanguageOptions"));
  -[_MRPlaybackQueueRequestProtobuf setIncludeAvailableArtworkFormats:](v3, "setIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest includeAvailableArtworkFormats](self, "includeAvailableArtworkFormats"));
  -[_MRPlaybackQueueRequestProtobuf setHasIncludeAvailableArtworkFormats:](v3, "setHasIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](self, "hasIncludeAvailableArtworkFormats"));
  -[_MRPlaybackQueueRequestProtobuf setReturnContentItemAssetsInUserCompletion:](v3, "setReturnContentItemAssetsInUserCompletion:", 1);
  -[_MRPlaybackQueueRequestProtobuf setHasReturnContentItemAssetsInUserCompletion:](v3, "setHasReturnContentItemAssetsInUserCompletion:", 1);
  -[_MRPlaybackQueueRequestProtobuf setIsLegacyNowPlayingInfoRequest:](v3, "setIsLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  -[_MRPlaybackQueueRequestProtobuf setHasIsLegacyNowPlayingInfoRequest:](v3, "setHasIsLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  -[_MRPlaybackQueueRequestProtobuf setCachingPolicy:](v3, "setCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy"));
  -[_MRPlaybackQueueRequestProtobuf setHasCachingPolicy:](v3, "setHasCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy") != 0);
  -[MRPlaybackQueueRequest playerPath](self, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueRequestProtobuf setPlayerPath:](v3, "setPlayerPath:", v5);

  -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_MRPlaybackQueueRequestProtobuf setRequestID:](v3, "setRequestID:", v7);

  -[MRPlaybackQueueRequest label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[_MRPlaybackQueueRequestProtobuf setLabel:](v3, "setLabel:", v9);

  -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[_MRPlaybackQueueRequestProtobuf setContentItemIdentifiers:](v3, "setContentItemIdentifiers:", v11);

  -[MRPlaybackQueueRequest requestedArtworkFormats](self, "requestedArtworkFormats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  -[_MRPlaybackQueueRequestProtobuf setRequestedArtworkFormats:](v3, "setRequestedArtworkFormats:", v13);

  -[MRPlaybackQueueRequest requestedRemoteArtworkFormats](self, "requestedRemoteArtworkFormats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  -[_MRPlaybackQueueRequestProtobuf setRequestedRemoteArtworkFormats:](v3, "setRequestedRemoteArtworkFormats:", v15);

  return v3;
}

+ (MRPlaybackQueueRequest)requestWithCurrentState:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  MRPlaybackQueueRequest *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = -[MRPlaybackQueueRequest initWithIdentifiers:range:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:range:", v6, location, length);

  return v7;
}

- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MRPlaybackQueueRequest *result;

  length = a4.length;
  location = a4.location;
  result = -[MRPlaybackQueueRequest initWithIdentifiers:](self, "initWithIdentifiers:", a3);
  if (result)
  {
    *(_WORD *)&result->_hasLocation = 257;
    result->_location = location;
    result->_length = length;
  }
  return result;
}

- (id)initFromTransactionName:(unint64_t)a3
{
  id result;
  uint64_t v5;

  result = -[MRPlaybackQueueRequest initWithRange:](self, "initWithRange:", 0, 0);
  if (result)
  {
    switch(a3)
    {
      case 2uLL:
        *((_BYTE *)result + 8) = 1;
        v5 = 17;
        goto LABEL_10;
      case 3uLL:
        *((_BYTE *)result + 11) = 1;
        v5 = 22;
        goto LABEL_10;
      case 4uLL:
        *((_BYTE *)result + 9) = 1;
        v5 = 20;
        goto LABEL_10;
      case 5uLL:
        *((_BYTE *)result + 13) = 1;
        v5 = 24;
        goto LABEL_10;
      case 6uLL:
        *((_BYTE *)result + 10) = 1;
        v5 = 21;
        goto LABEL_10;
      case 7uLL:
        *((_BYTE *)result + 18) = 1;
        *(int64x2_t *)((char *)result + 40) = vdupq_n_s64(0x4082C00000000000uLL);
        v5 = 19;
        goto LABEL_10;
      case 8uLL:
        *((_BYTE *)result + 12) = 1;
        v5 = 23;
LABEL_10:
        *((_BYTE *)result + v5) = 1;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)defaultArtworkWidth
{
  return 600.0;
}

+ (double)defaultArtworkHeight
{
  return 600.0;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("playbackQueueRequest");
  -[MRPlaybackQueueRequest description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)rangeContainsNowPlayingItem
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[MRPlaybackQueueRequest location](self, "location");
  v4 = -[MRPlaybackQueueRequest location](self, "location");
  v5 = -[MRPlaybackQueueRequest length](self, "length") + v4;
  return v3 < 1 && v5 > 0;
}

- (BOOL)shouldRequestItemNotConsideringMetadata
{
  double v3;
  double v4;
  BOOL v5;
  void *v7;
  void *v8;

  if (-[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"))
    return 1;
  if (-[MRPlaybackQueueRequest includeSections](self, "includeSections"))
    return 1;
  if (-[MRPlaybackQueueRequest includeInfo](self, "includeInfo"))
    return 1;
  if (-[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"))
    return 1;
  if (-[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"))
    return 1;
  -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
  if (v3 != 0.0)
  {
    -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
    if (v4 != 0.0)
      return 1;
  }
  if (-[MRPlaybackQueueRequest includeAvailableArtworkFormats](self, "includeAvailableArtworkFormats"))
    return 1;
  -[MRPlaybackQueueRequest requestedArtworkFormats](self, "requestedArtworkFormats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[MRPlaybackQueueRequest requestedRemoteArtworkFormats](self, "requestedRemoteArtworkFormats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "count") != 0;

  }
  return v5;
}

- (void)setIncludeAlignments:(BOOL)a3
{
  self->_includeAlignments = a3;
  self->_hasIncludeAlignments = 1;
}

- (BOOL)isEqual:(id)a3
{
  MRPlaybackQueueRequest *v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = (MRPlaybackQueueRequest *)a3;
  if (v4 == self)
  {
    v41 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_66;
    v5 = -[MRPlaybackQueueRequest hasLocation](v4, "hasLocation");
    if (v5 != -[MRPlaybackQueueRequest hasLocation](self, "hasLocation"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasLocation](v4, "hasLocation"))
    {
      if (-[MRPlaybackQueueRequest hasLocation](self, "hasLocation"))
      {
        v6 = -[MRPlaybackQueueRequest location](v4, "location");
        if (v6 != -[MRPlaybackQueueRequest location](self, "location"))
          goto LABEL_66;
      }
    }
    v7 = -[MRPlaybackQueueRequest hasLength](v4, "hasLength");
    if (v7 != -[MRPlaybackQueueRequest hasLength](self, "hasLength"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasLength](v4, "hasLength"))
    {
      if (-[MRPlaybackQueueRequest hasLength](self, "hasLength"))
      {
        v8 = -[MRPlaybackQueueRequest length](v4, "length");
        if (v8 != -[MRPlaybackQueueRequest length](self, "length"))
          goto LABEL_66;
      }
    }
    v9 = -[MRPlaybackQueueRequest hasIncludeMetadata](v4, "hasIncludeMetadata");
    if (v9 != -[MRPlaybackQueueRequest hasIncludeMetadata](self, "hasIncludeMetadata"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeMetadata](v4, "hasIncludeMetadata"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeMetadata](self, "hasIncludeMetadata"))
      {
        v10 = -[MRPlaybackQueueRequest includeMetadata](v4, "includeMetadata");
        if (v10 != -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata"))
          goto LABEL_66;
      }
    }
    v11 = -[MRPlaybackQueueRequest hasArtworkWidth](v4, "hasArtworkWidth");
    if (v11 != -[MRPlaybackQueueRequest hasArtworkWidth](self, "hasArtworkWidth"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasArtworkWidth](v4, "hasArtworkWidth"))
    {
      if (-[MRPlaybackQueueRequest hasArtworkWidth](self, "hasArtworkWidth"))
      {
        -[MRPlaybackQueueRequest artworkWidth](v4, "artworkWidth");
        v13 = v12;
        -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
        if (v13 != v14)
          goto LABEL_66;
      }
    }
    v15 = -[MRPlaybackQueueRequest hasArtworkHeight](v4, "hasArtworkHeight");
    if (v15 != -[MRPlaybackQueueRequest hasArtworkHeight](self, "hasArtworkHeight"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasArtworkHeight](v4, "hasArtworkHeight"))
    {
      if (-[MRPlaybackQueueRequest hasArtworkHeight](self, "hasArtworkHeight"))
      {
        -[MRPlaybackQueueRequest artworkHeight](v4, "artworkHeight");
        v17 = v16;
        -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
        if (v17 != v18)
          goto LABEL_66;
      }
    }
    v19 = -[MRPlaybackQueueRequest hasIncludeLyrics](v4, "hasIncludeLyrics");
    if (v19 != -[MRPlaybackQueueRequest hasIncludeLyrics](self, "hasIncludeLyrics"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeLyrics](v4, "hasIncludeLyrics"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeLyrics](self, "hasIncludeLyrics"))
      {
        v20 = -[MRPlaybackQueueRequest includeLyrics](v4, "includeLyrics");
        if (v20 != -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"))
          goto LABEL_66;
      }
    }
    v21 = -[MRPlaybackQueueRequest hasIncludeSections](v4, "hasIncludeSections");
    if (v21 != -[MRPlaybackQueueRequest hasIncludeSections](self, "hasIncludeSections"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeSections](v4, "hasIncludeSections"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeSections](self, "hasIncludeSections"))
      {
        v22 = -[MRPlaybackQueueRequest includeSections](v4, "includeSections");
        if (v22 != -[MRPlaybackQueueRequest includeSections](self, "includeSections"))
          goto LABEL_66;
      }
    }
    v23 = -[MRPlaybackQueueRequest hasIncludeInfo](v4, "hasIncludeInfo");
    if (v23 != -[MRPlaybackQueueRequest hasIncludeInfo](self, "hasIncludeInfo"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeInfo](v4, "hasIncludeInfo"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeInfo](self, "hasIncludeInfo"))
      {
        v24 = -[MRPlaybackQueueRequest includeInfo](v4, "includeInfo");
        if (v24 != -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"))
          goto LABEL_66;
      }
    }
    v25 = -[MRPlaybackQueueRequest hasIncludeAlignments](v4, "hasIncludeAlignments");
    if (v25 != -[MRPlaybackQueueRequest hasIncludeAlignments](self, "hasIncludeAlignments"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeAlignments](v4, "hasIncludeAlignments"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeAlignments](self, "hasIncludeAlignments"))
      {
        v26 = -[MRPlaybackQueueRequest includeAlignments](v4, "includeAlignments");
        if (v26 != -[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"))
          goto LABEL_66;
      }
    }
    v27 = -[MRPlaybackQueueRequest hasIncludeLanguageOptions](v4, "hasIncludeLanguageOptions");
    if (v27 != -[MRPlaybackQueueRequest hasIncludeLanguageOptions](self, "hasIncludeLanguageOptions"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeLanguageOptions](v4, "hasIncludeLanguageOptions"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeLanguageOptions](self, "hasIncludeLanguageOptions"))
      {
        v28 = -[MRPlaybackQueueRequest includeLanguageOptions](v4, "includeLanguageOptions");
        if (v28 != -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"))
          goto LABEL_66;
      }
    }
    v29 = -[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](v4, "hasIncludeAvailableArtworkFormats");
    if (v29 != -[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](self, "hasIncludeAvailableArtworkFormats"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](v4, "hasIncludeAvailableArtworkFormats"))
    {
      if (-[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](self, "hasIncludeAvailableArtworkFormats"))
      {
        v30 = -[MRPlaybackQueueRequest includeAvailableArtworkFormats](v4, "includeAvailableArtworkFormats");
        if (v30 != -[MRPlaybackQueueRequest includeAvailableArtworkFormats](self, "includeAvailableArtworkFormats"))
          goto LABEL_66;
      }
    }
    v31 = -[MRPlaybackQueueRequest hasLegacyNowPlayingInfoRequest](v4, "hasLegacyNowPlayingInfoRequest");
    if (v31 != -[MRPlaybackQueueRequest hasLegacyNowPlayingInfoRequest](self, "hasLegacyNowPlayingInfoRequest"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasLegacyNowPlayingInfoRequest](v4, "hasLegacyNowPlayingInfoRequest"))
    {
      if (-[MRPlaybackQueueRequest hasLegacyNowPlayingInfoRequest](self, "hasLegacyNowPlayingInfoRequest"))
      {
        v32 = -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](v4, "isLegacyNowPlayingInfoRequest");
        if (v32 != -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"))
          goto LABEL_66;
      }
    }
    v33 = -[MRPlaybackQueueRequest hasCachingPolicy](v4, "hasCachingPolicy");
    if (v33 != -[MRPlaybackQueueRequest hasCachingPolicy](self, "hasCachingPolicy"))
      goto LABEL_66;
    if (-[MRPlaybackQueueRequest hasCachingPolicy](v4, "hasCachingPolicy"))
    {
      if (-[MRPlaybackQueueRequest hasCachingPolicy](self, "hasCachingPolicy"))
      {
        v34 = -[MRPlaybackQueueRequest cachingPolicy](v4, "cachingPolicy");
        if (v34 != -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy"))
          goto LABEL_66;
      }
    }
    -[MRPlaybackQueueRequest playerPath](v4, "playerPath");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest playerPath](self, "playerPath");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v35 == (void *)v36)
    {

    }
    else
    {
      v37 = (void *)v36;
      -[MRPlaybackQueueRequest playerPath](v4, "playerPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueueRequest playerPath](self, "playerPath");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if (!v40)
        goto LABEL_66;
    }
    -[MRPlaybackQueueRequest requestIdentifier](v4, "requestIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 == (void *)v43)
    {

    }
    else
    {
      v44 = (void *)v43;
      -[MRPlaybackQueueRequest requestIdentifier](v4, "requestIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueueRequest requestIdentifier](self, "requestIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqualToString:", v46);

      if (!v47)
        goto LABEL_66;
    }
    -[MRPlaybackQueueRequest label](v4, "label");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest label](self, "label");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[MRPlaybackQueueRequest label](v4, "label");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueueRequest label](self, "label");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if (!v53)
      {
LABEL_66:
        v41 = 0;
        goto LABEL_67;
      }
    }
    -[MRPlaybackQueueRequest contentItemIdentifiers](v4, "contentItemIdentifiers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {
      v41 = 1;
      v57 = v55;
    }
    else
    {
      v57 = (void *)v56;
      -[MRPlaybackQueueRequest contentItemIdentifiers](v4, "contentItemIdentifiers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackQueueRequest contentItemIdentifiers](self, "contentItemIdentifiers");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v58, "isEqualToArray:", v59);

    }
  }
LABEL_67:

  return v41;
}

- (id)_buildRequestedPropertiesDescription
{
  id v1;
  id v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend(v1, "includeMetadata"))
      objc_msgSend(v2, "appendString:", CFSTR("/M"));
    if (objc_msgSend(v1, "includeInfo"))
      objc_msgSend(v2, "appendString:", CFSTR("/I"));
    if (objc_msgSend(v1, "includeLanguageOptions"))
      objc_msgSend(v2, "appendString:", CFSTR("/L"));
    if (objc_msgSend(v1, "includeLyrics"))
      objc_msgSend(v2, "appendString:", CFSTR("/Ly"));
    if (objc_msgSend(v1, "includeAlignments"))
      objc_msgSend(v2, "appendString:", CFSTR("/Al"));
    if (objc_msgSend(v1, "includeSections"))
      objc_msgSend(v2, "appendString:", CFSTR("/S"));
    if (objc_msgSend(v1, "includeAvailableArtworkFormats"))
      objc_msgSend(v2, "appendString:", CFSTR("/AF"));
    objc_msgSend(v1, "artworkWidth");
    if (v3 != 0.0)
    {
      objc_msgSend(v1, "artworkHeight");
      if (v4 != 0.0)
      {
        objc_msgSend(v1, "artworkWidth");
        v6 = v5;
        objc_msgSend(v1, "artworkHeight");
        objc_msgSend(v2, "appendFormat:", CFSTR("/A%lfx%lf"), v6, v7);
      }
    }
    objc_msgSend(v1, "requestedArtworkFormats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v1, "requestedArtworkFormats");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("/FA[%ld]"), objc_msgSend(v10, "count"));

    }
    objc_msgSend(v1, "requestedRemoteArtworkFormats");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v1, "requestedRemoteArtworkFormats");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("/RFA[%ld]"), objc_msgSend(v13, "count"));

    }
    if (objc_msgSend(v1, "hasLocation") && objc_msgSend(v1, "hasLength"))
      objc_msgSend(v2, "appendFormat:", CFSTR("/R[%ld:%ld]"), objc_msgSend(v1, "location"), objc_msgSend(v1, "length"));
    v1 = (id)objc_msgSend(v2, "copy");

  }
  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlaybackQueueRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MRPlaybackQueueRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v5, v6);

    v5 = 0;
  }
  v7 = -[MRPlaybackQueueRequest initWithProtobuf:](self, "initWithProtobuf:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRPlaybackQueueRequest protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (void)performRequestForDestination:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRNowPlayingControllerConfiguration *v8;
  MRNowPlayingController *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[MRNowPlayingControllerConfiguration initWithDestination:]([MRNowPlayingControllerConfiguration alloc], "initWithDestination:", v7);

  -[MRNowPlayingControllerConfiguration setPlaybackQueueRequest:](v8, "setPlaybackQueueRequest:", self);
  -[MRNowPlayingControllerConfiguration setLabel:](v8, "setLabel:", CFSTR("performPlaybackQueueRequest"));
  v9 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MRPlaybackQueueRequest_performRequestForDestination_completion___block_invoke;
  v11[3] = &unk_1E30CB310;
  v12 = v6;
  v10 = v6;
  -[MRNowPlayingController performRequestWithCompletion:](v9, "performRequestWithCompletion:", v11);

}

void __66__MRPlaybackQueueRequest_performRequestForDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "playbackQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (BOOL)includeAlignments
{
  return self->_includeAlignments;
}

- (BOOL)hasIncludeAlignments
{
  return self->_hasIncludeAlignments;
}

- (void)setHasIncludeAlignments:(BOOL)a3
{
  self->_hasIncludeAlignments = a3;
}

@end
