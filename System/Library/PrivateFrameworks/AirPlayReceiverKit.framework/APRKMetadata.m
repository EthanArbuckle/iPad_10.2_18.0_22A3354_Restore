@implementation APRKMetadata

- (APRKMetadata)initWithDictionary:(id)a3
{
  id v4;
  APRKMetadata *v5;
  APRKMetadata *v6;
  APRKMetadata *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)APRKMetadata;
    v5 = -[APRKMetadata init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[APRKMetadata updateMedatataWithDictionary:](v5, "updateMedatataWithDictionary:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Title = %@\nAlbum = %@\nArtist = %@\nArtwork = %@\nArtworkMIMEType = %@\nTotalTrackCount = %lu\nTrackNumber = %lu"), self->_title, self->_artist, self->_album, self->_artworkDataInBase64, self->_artworkMIMEType, self->_totalTrackCount, self->_trackNumber);
}

- (void)updateMedatataWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("Album"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&self->_album, v5);
    objc_msgSend(v12, "objectForKey:", CFSTR("Artist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_storeStrong((id *)&self->_artist, v6);
    objc_msgSend(v12, "objectForKey:", CFSTR("ArtworkData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_storeStrong((id *)&self->_artworkDataInBase64, v7);
    objc_msgSend(v12, "objectForKey:", CFSTR("ArtworkMIMEType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_storeStrong((id *)&self->_artworkMIMEType, v8);
    objc_msgSend(v12, "objectForKey:", CFSTR("Title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_storeStrong((id *)&self->_title, v9);
    objc_msgSend(v12, "objectForKey:", CFSTR("TotalTrackCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      self->_totalTrackCount = objc_msgSend(v10, "integerValue");
    objc_msgSend(v12, "objectForKey:", CFSTR("TrackNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      self->_trackNumber = objc_msgSend(v11, "integerValue");

    v4 = v12;
  }

}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)artworkDataInBase64
{
  return self->_artworkDataInBase64;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)totalTrackCount
{
  return self->_totalTrackCount;
}

- (int64_t)trackNumber
{
  return self->_trackNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkDataInBase64, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
