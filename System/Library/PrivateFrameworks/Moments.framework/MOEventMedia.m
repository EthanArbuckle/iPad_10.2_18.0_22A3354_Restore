@implementation MOEventMedia

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mediaTitle;
  id v5;

  mediaTitle = self->_mediaTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaTitle, CFSTR("mediaTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaAlbum, CFSTR("mediaAlbum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaPlayerBundleId, CFSTR("mediaPlayerBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaProductId, CFSTR("mediaProductId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaGenre, CFSTR("mediaGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaType, CFSTR("mediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaArtist, CFSTR("mediaArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaRepetitions, CFSTR("mediaRepetitions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaSumTimePlayed, CFSTR("mediaSumTimePlayed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaPlaySessions, CFSTR("mediaPlaySessions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaFirstPartyTimePlayedRatio, CFSTR("firstPartyTimePlayedRatio"));

}

- (MOEventMedia)initWithCoder:(id)a3
{
  id v4;
  MOEventMedia *v5;
  uint64_t v6;
  NSString *mediaTitle;
  uint64_t v8;
  NSString *mediaAlbum;
  uint64_t v10;
  NSString *mediaPlayerBundleId;
  uint64_t v12;
  NSString *mediaProductId;
  uint64_t v14;
  NSString *mediaGenre;
  uint64_t v16;
  NSString *mediaType;
  uint64_t v18;
  NSString *mediaArtist;
  uint64_t v20;
  NSNumber *mediaRepetitions;
  uint64_t v22;
  NSNumber *mediaSumTimePlayed;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *mediaPlaySessions;
  uint64_t v32;
  NSNumber *mediaFirstPartyTimePlayedRatio;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MOEventMedia;
  v5 = -[MOEventMedia init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaTitle = v5->_mediaTitle;
    v5->_mediaTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaAlbum"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaAlbum = v5->_mediaAlbum;
    v5->_mediaAlbum = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaPlayerBundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    mediaPlayerBundleId = v5->_mediaPlayerBundleId;
    v5->_mediaPlayerBundleId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaProductId"));
    v12 = objc_claimAutoreleasedReturnValue();
    mediaProductId = v5->_mediaProductId;
    v5->_mediaProductId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaGenre"));
    v14 = objc_claimAutoreleasedReturnValue();
    mediaGenre = v5->_mediaGenre;
    v5->_mediaGenre = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v16 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaArtist"));
    v18 = objc_claimAutoreleasedReturnValue();
    mediaArtist = v5->_mediaArtist;
    v5->_mediaArtist = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRepetitions"));
    v20 = objc_claimAutoreleasedReturnValue();
    mediaRepetitions = v5->_mediaRepetitions;
    v5->_mediaRepetitions = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaSumTimePlayed"));
    v22 = objc_claimAutoreleasedReturnValue();
    mediaSumTimePlayed = v5->_mediaSumTimePlayed;
    v5->_mediaSumTimePlayed = (NSNumber *)v22;

    v24 = (void *)MEMORY[0x1D1798EEC]();
    v25 = objc_alloc(MEMORY[0x1E0C99E60]);
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = (void *)objc_msgSend(v25, "initWithObjects:", v26, v27, v28, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v24);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("mediaPlaySessions"));
    v30 = objc_claimAutoreleasedReturnValue();
    mediaPlaySessions = v5->_mediaPlaySessions;
    v5->_mediaPlaySessions = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstPartyTimePlayedRatio"));
    v32 = objc_claimAutoreleasedReturnValue();
    mediaFirstPartyTimePlayedRatio = v5->_mediaFirstPartyTimePlayedRatio;
    v5->_mediaFirstPartyTimePlayedRatio = (NSNumber *)v32;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventMedia *v4;

  v4 = objc_alloc_init(MOEventMedia);
  objc_storeStrong((id *)&v4->_mediaType, self->_mediaType);
  objc_storeStrong((id *)&v4->_mediaAlbum, self->_mediaAlbum);
  objc_storeStrong((id *)&v4->_mediaArtist, self->_mediaArtist);
  objc_storeStrong((id *)&v4->_mediaPlayerBundleId, self->_mediaPlayerBundleId);
  objc_storeStrong((id *)&v4->_mediaProductId, self->_mediaProductId);
  objc_storeStrong((id *)&v4->_mediaGenre, self->_mediaGenre);
  objc_storeStrong((id *)&v4->_mediaRepetitions, self->_mediaRepetitions);
  objc_storeStrong((id *)&v4->_mediaSumTimePlayed, self->_mediaSumTimePlayed);
  objc_storeStrong((id *)&v4->_mediaPlaySessions, self->_mediaPlaySessions);
  objc_storeStrong((id *)&v4->_mediaTitle, self->_mediaTitle);
  objc_storeStrong((id *)&v4->_mediaFirstPartyTimePlayedRatio, self->_mediaFirstPartyTimePlayedRatio);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString mask](self->_mediaTitle, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString mask](self->_mediaAlbum, "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("mediaTitle, %@, mediaAlbum, %@, mediaPlayerBundleId, %@, mediaProductId, %@, mediaType, %@, mediaRepetitions, %@, mediaSumTimePlayed, %@, number of media play events, %lu"), v4, v5, self->_mediaPlayerBundleId, self->_mediaProductId, self->_mediaType, self->_mediaRepetitions, self->_mediaSumTimePlayed, -[NSArray count](self->_mediaPlaySessions, "count"));

  return v6;
}

- (NSString)mediaTitle
{
  return self->_mediaTitle;
}

- (void)setMediaTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTitle, a3);
}

- (NSString)mediaAlbum
{
  return self->_mediaAlbum;
}

- (void)setMediaAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAlbum, a3);
}

- (NSString)mediaPlayerBundleId
{
  return self->_mediaPlayerBundleId;
}

- (void)setMediaPlayerBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerBundleId, a3);
}

- (NSString)mediaProductId
{
  return self->_mediaProductId;
}

- (void)setMediaProductId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProductId, a3);
}

- (NSString)mediaGenre
{
  return self->_mediaGenre;
}

- (void)setMediaGenre:(id)a3
{
  objc_storeStrong((id *)&self->_mediaGenre, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)mediaArtist
{
  return self->_mediaArtist;
}

- (void)setMediaArtist:(id)a3
{
  objc_storeStrong((id *)&self->_mediaArtist, a3);
}

- (NSNumber)mediaRepetitions
{
  return self->_mediaRepetitions;
}

- (void)setMediaRepetitions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRepetitions, a3);
}

- (NSNumber)mediaSumTimePlayed
{
  return self->_mediaSumTimePlayed;
}

- (void)setMediaSumTimePlayed:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSumTimePlayed, a3);
}

- (NSArray)mediaPlaySessions
{
  return self->_mediaPlaySessions;
}

- (void)setMediaPlaySessions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlaySessions, a3);
}

- (NSNumber)mediaFirstPartyTimePlayedRatio
{
  return self->_mediaFirstPartyTimePlayedRatio;
}

- (void)setMediaFirstPartyTimePlayedRatio:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFirstPartyTimePlayedRatio, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaFirstPartyTimePlayedRatio, 0);
  objc_storeStrong((id *)&self->_mediaPlaySessions, 0);
  objc_storeStrong((id *)&self->_mediaSumTimePlayed, 0);
  objc_storeStrong((id *)&self->_mediaRepetitions, 0);
  objc_storeStrong((id *)&self->_mediaArtist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaGenre, 0);
  objc_storeStrong((id *)&self->_mediaProductId, 0);
  objc_storeStrong((id *)&self->_mediaPlayerBundleId, 0);
  objc_storeStrong((id *)&self->_mediaAlbum, 0);
  objc_storeStrong((id *)&self->_mediaTitle, 0);
}

@end
