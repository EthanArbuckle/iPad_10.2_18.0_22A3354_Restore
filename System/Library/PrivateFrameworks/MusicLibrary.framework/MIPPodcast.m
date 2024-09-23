@implementation MIPPodcast

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasSeries
{
  return self->_series != 0;
}

- (BOOL)hasExternalGuid
{
  return self->_externalGuid != 0;
}

- (BOOL)hasFeedUrl
{
  return self->_feedUrl != 0;
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
  v8.super_class = (Class)MIPPodcast;
  -[MIPPodcast description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPodcast dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MIPArtist *artist;
  void *v5;
  MIPSeries *series;
  void *v7;
  NSString *externalGuid;
  NSString *feedUrl;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("artist"));

  }
  series = self->_series;
  if (series)
  {
    -[MIPSeries dictionaryRepresentation](series, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("series"));

  }
  externalGuid = self->_externalGuid;
  if (externalGuid)
    objc_msgSend(v3, "setObject:forKey:", externalGuid, CFSTR("externalGuid"));
  feedUrl = self->_feedUrl;
  if (feedUrl)
    objc_msgSend(v3, "setObject:forKey:", feedUrl, CFSTR("feedUrl"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPPodcastReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_series)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_externalGuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_feedUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_artist)
  {
    objc_msgSend(v4, "setArtist:");
    v4 = v5;
  }
  if (self->_series)
  {
    objc_msgSend(v5, "setSeries:");
    v4 = v5;
  }
  if (self->_externalGuid)
  {
    objc_msgSend(v5, "setExternalGuid:");
    v4 = v5;
  }
  if (self->_feedUrl)
  {
    objc_msgSend(v5, "setFeedUrl:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[MIPSeries copyWithZone:](self->_series, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_externalGuid, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_feedUrl, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MIPArtist *artist;
  MIPSeries *series;
  NSString *externalGuid;
  NSString *feedUrl;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((artist = self->_artist, !((unint64_t)artist | v4[1])) || -[MIPArtist isEqual:](artist, "isEqual:"))
    && ((series = self->_series, !((unint64_t)series | v4[4])) || -[MIPSeries isEqual:](series, "isEqual:"))
    && ((externalGuid = self->_externalGuid, !((unint64_t)externalGuid | v4[2]))
     || -[NSString isEqual:](externalGuid, "isEqual:")))
  {
    feedUrl = self->_feedUrl;
    if ((unint64_t)feedUrl | v4[3])
      v9 = -[NSString isEqual:](feedUrl, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[MIPArtist hash](self->_artist, "hash");
  v4 = -[MIPSeries hash](self->_series, "hash") ^ v3;
  v5 = -[NSString hash](self->_externalGuid, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_feedUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  MIPArtist *artist;
  uint64_t v6;
  MIPSeries *series;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  artist = self->_artist;
  v6 = v4[1];
  v9 = v4;
  if (artist)
  {
    if (!v6)
      goto LABEL_7;
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MIPPodcast setArtist:](self, "setArtist:");
  }
  v4 = v9;
LABEL_7:
  series = self->_series;
  v8 = v4[4];
  if (series)
  {
    if (!v8)
      goto LABEL_13;
    -[MIPSeries mergeFrom:](series, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[MIPPodcast setSeries:](self, "setSeries:");
  }
  v4 = v9;
LABEL_13:
  if (v4[2])
  {
    -[MIPPodcast setExternalGuid:](self, "setExternalGuid:");
    v4 = v9;
  }
  if (v4[3])
  {
    -[MIPPodcast setFeedUrl:](self, "setFeedUrl:");
    v4 = v9;
  }

}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (MIPSeries)series
{
  return self->_series;
}

- (void)setSeries:(id)a3
{
  objc_storeStrong((id *)&self->_series, a3);
}

- (NSString)externalGuid
{
  return self->_externalGuid;
}

- (void)setExternalGuid:(id)a3
{
  objc_storeStrong((id *)&self->_externalGuid, a3);
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_feedUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_externalGuid, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
