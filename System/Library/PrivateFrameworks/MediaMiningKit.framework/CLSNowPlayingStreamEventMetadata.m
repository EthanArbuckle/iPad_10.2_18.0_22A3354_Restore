@implementation CLSNowPlayingStreamEventMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  CLSNowPlayingStreamEventMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(CLSNowPlayingStreamEventMetadata);
  -[CLSNowPlayingStreamEventMetadata album](self, "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata setAlbum:](v4, "setAlbum:", v5);

  -[CLSNowPlayingStreamEventMetadata artist](self, "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata setArtist:](v4, "setArtist:", v6);

  -[CLSNowPlayingStreamEventMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata setTitle:](v4, "setTitle:", v7);

  -[CLSNowPlayingStreamEventMetadata durationInSeconds](self, "durationInSeconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata setDurationInSeconds:](v4, "setDurationInSeconds:", v8);

  -[CLSNowPlayingStreamEventMetadata genres](self, "genres");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CLSNowPlayingStreamEventMetadata setGenres:](v4, "setGenres:", v10);

  -[CLSNowPlayingStreamEventMetadata source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata setSource:](v4, "setSource:", v11);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[CLSNowPlayingStreamEventMetadata album](self, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata artist](self, "artist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata genres](self, "genres");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSNowPlayingStreamEventMetadata durationInSeconds](self, "durationInSeconds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v9, "numberWithDouble:", v11 / 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEventMetadata source](self, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("(%p) album: %@, artist: %@, title: %@, genre: %@, duration: %@ minutes, source: %@"), self, v3, v4, v5, v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[CLSNowPlayingStreamEventMetadata album](self, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CLSNowPlayingStreamEventMetadata artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 37 * v4;

  -[CLSNowPlayingStreamEventMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 37 * v6;

  -[CLSNowPlayingStreamEventMetadata genres](self, "genres");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") + 37 * v8;

  -[CLSNowPlayingStreamEventMetadata source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") + 37 * v10 + 1178847269;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CLSNowPlayingStreamEventMetadata *v4;
  BOOL v5;

  v4 = (CLSNowPlayingStreamEventMetadata *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CLSNowPlayingStreamEventMetadata isEqualToEventMetadata:](self, "isEqualToEventMetadata:", v4);
  }

  return v5;
}

- (BOOL)isEqualToEventMetadata:(id)a3
{
  CLSNowPlayingStreamEventMetadata *v4;
  CLSNowPlayingStreamEventMetadata *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (CLSNowPlayingStreamEventMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    -[CLSNowPlayingStreamEventMetadata album](v4, "album");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSNowPlayingStreamEventMetadata album](self, "album");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v8)
      goto LABEL_6;
    -[CLSNowPlayingStreamEventMetadata artist](v5, "artist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSNowPlayingStreamEventMetadata artist](self, "artist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_6;
    -[CLSNowPlayingStreamEventMetadata title](v5, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSNowPlayingStreamEventMetadata title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      -[CLSNowPlayingStreamEventMetadata genres](v5, "genres");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSNowPlayingStreamEventMetadata genres](self, "genres");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToSet:", v16);

    }
    else
    {
LABEL_6:
      v17 = 0;
    }
  }

  return v17;
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_durationInSeconds, a3);
}

- (NSSet)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

- (CLSNowPlayingStreamEventMetadata)initWithDuetKnowledgeEvent:(id)a3
{
  id v4;
  CLSNowPlayingStreamEventMetadata *v5;
  uint64_t v6;
  NSString *album;
  uint64_t v8;
  NSString *artist;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSSet *genres;
  uint64_t v15;
  NSNumber *durationInSeconds;
  uint64_t v17;
  NSString *source;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSNowPlayingStreamEventMetadata;
  v5 = -[CLSNowPlayingStreamEventMetadata init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cls_album");
    v6 = objc_claimAutoreleasedReturnValue();
    album = v5->_album;
    v5->_album = (NSString *)v6;

    objc_msgSend(v4, "cls_artist");
    v8 = objc_claimAutoreleasedReturnValue();
    artist = v5->_artist;
    v5->_artist = (NSString *)v8;

    objc_msgSend(v4, "cls_title");
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "cls_genre");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    genres = v5->_genres;
    v5->_genres = (NSSet *)v13;

    objc_msgSend(v4, "cls_durationInSeconds");
    v15 = objc_claimAutoreleasedReturnValue();
    durationInSeconds = v5->_durationInSeconds;
    v5->_durationInSeconds = (NSNumber *)v15;

    objc_msgSend(v4, "cls_identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v17;

  }
  return v5;
}

@end
