@implementation MPCModelGenericAVItemTimedMetadataStreamFields

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  _BOOL8 explicitContent;
  NSUInteger v6;

  v3 = -[NSString hash](self->_album, "hash");
  v4 = -[NSString hash](self->_artist, "hash") ^ v3;
  explicitContent = self->_explicitContent;
  v6 = v4 ^ explicitContent ^ -[NSString hash](self->_title, "hash");
  return v6 ^ -[NSArray hash](self->_artworkDictionaries, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MPCModelGenericAVItemTimedMetadataStreamFields *v4;
  NSString *album;
  NSString *title;
  NSString *artist;
  NSArray *artworkDictionaries;
  char v9;

  v4 = (MPCModelGenericAVItemTimedMetadataStreamFields *)a3;
  if (v4 == self)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (album = self->_album, album != v4->_album) && !-[NSString isEqual:](album, "isEqual:")
    || (title = self->_title, title != v4->_title) && !-[NSString isEqual:](title, "isEqual:")
    || (artist = self->_artist, artist != v4->_artist) && !-[NSString isEqual:](artist, "isEqual:")
    || self->_explicitContent != v4->_explicitContent)
  {
    v9 = 0;
    goto LABEL_14;
  }
  artworkDictionaries = self->_artworkDictionaries;
  if (artworkDictionaries == v4->_artworkDictionaries)
  {
LABEL_13:
    v9 = 1;
    goto LABEL_14;
  }
  v9 = -[NSArray isEqual:](artworkDictionaries, "isEqual:");
LABEL_14:

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSArray)artworkDictionaries
{
  return self->_artworkDictionaries;
}

- (void)setArtworkDictionaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDictionaries, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
