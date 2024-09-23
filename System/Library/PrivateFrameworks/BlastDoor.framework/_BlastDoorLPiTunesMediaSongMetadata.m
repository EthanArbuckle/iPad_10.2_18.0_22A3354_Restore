@implementation _BlastDoorLPiTunesMediaSongMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaSongMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaSongMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *artist;
  uint64_t v14;
  NSString *album;
  uint64_t v16;
  NSString *lyrics;
  uint64_t v18;
  _BlastDoorLPImage *artwork;
  uint64_t v20;
  _BlastDoorLPArtworkMetadata *artworkMetadata;
  uint64_t v22;
  NSURL *previewURL;
  uint64_t v24;
  NSArray *offers;
  uint64_t v26;
  _BlastDoorLPLyricExcerptMetadata *lyricExcerpt;
  _BlastDoorLPiTunesMediaSongMetadata *v28;
  objc_super v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_BlastDoorLPiTunesMediaSongMetadata;
  v5 = -[_BlastDoorLPiTunesMediaSongMetadata init](&v30, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("artist"));
    v12 = objc_claimAutoreleasedReturnValue();
    artist = v5->_artist;
    v5->_artist = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("album"));
    v14 = objc_claimAutoreleasedReturnValue();
    album = v5->_album;
    v5->_album = (NSString *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("lyrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v16;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v18;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v20;

    decodeURLForKey(v4, CFSTR("previewURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v22;

    decodeArrayOfStringsForKey(v4);
    v24 = objc_claimAutoreleasedReturnValue();
    offers = v5->_offers;
    v5->_offers = (NSArray *)v24;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lyricExcerpt"));
    v26 = objc_claimAutoreleasedReturnValue();
    lyricExcerpt = v5->_lyricExcerpt;
    v5->_lyricExcerpt = (_BlastDoorLPLyricExcerptMetadata *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *storeFrontIdentifier;
  id v5;

  storeFrontIdentifier = self->_storeFrontIdentifier;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_album, CFSTR("album"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_lyrics, CFSTR("lyrics"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, CFSTR("previewURL"));
  objc_msgSend(v5, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, CFSTR("offers"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_lyricExcerpt, CFSTR("lyricExcerpt"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaSongMetadata *v4;
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
  _BlastDoorLPiTunesMediaSongMetadata *v16;

  v4 = +[_BlastDoorLPiTunesMediaSongMetadata allocWithZone:](_BlastDoorLPiTunesMediaSongMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaSongMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaSongMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaSongMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setName:](v4, "setName:", v7);

    -[_BlastDoorLPiTunesMediaSongMetadata artist](self, "artist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setArtist:](v4, "setArtist:", v8);

    -[_BlastDoorLPiTunesMediaSongMetadata album](self, "album");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setAlbum:](v4, "setAlbum:", v9);

    -[_BlastDoorLPiTunesMediaSongMetadata lyrics](self, "lyrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setLyrics:](v4, "setLyrics:", v10);

    -[_BlastDoorLPiTunesMediaSongMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setArtwork:](v4, "setArtwork:", v11);

    -[_BlastDoorLPiTunesMediaSongMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

    -[_BlastDoorLPiTunesMediaSongMetadata previewURL](self, "previewURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setPreviewURL:](v4, "setPreviewURL:", v13);

    -[_BlastDoorLPiTunesMediaSongMetadata offers](self, "offers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setOffers:](v4, "setOffers:", v14);

    -[_BlastDoorLPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSongMetadata setLyricExcerpt:](v4, "setLyricExcerpt:", v15);

    v16 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPiTunesMediaSongMetadata;
  if (-[_BlastDoorLPiTunesMediaSongMetadata isEqual:](&v19, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:"))
        goto LABEL_27;
      v8 = v6[3];
      if (v8 | (unint64_t)self->_storeIdentifier)
      {
        if (!objc_msgSend((id)v8, "isEqual:"))
          goto LABEL_27;
      }
      v9 = v6[4];
      if (v9 | (unint64_t)self->_name)
      {
        if (!objc_msgSend((id)v9, "isEqual:"))
          goto LABEL_27;
      }
      if ((v10 = v6[5], v10 | (unint64_t)self->_artist) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[6], v11 | (unint64_t)self->_album) && !objc_msgSend((id)v11, "isEqual:")
        || (v12 = v6[7], v12 | (unint64_t)self->_lyrics) && !objc_msgSend((id)v12, "isEqual:")
        || (v13 = v6[8], v13 | (unint64_t)self->_artwork) && !objc_msgSend((id)v13, "isEqual:")
        || (v14 = v6[9], v14 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v14, "isEqual:")
        || (v15 = v6[10], v15 | (unint64_t)self->_previewURL) && !objc_msgSend((id)v15, "isEqual:")
        || (v16 = v6[11], v16 | (unint64_t)self->_offers) && !objc_msgSend((id)v16, "isEqual:"))
      {
LABEL_27:
        v5 = 0;
      }
      else
      {
        v17 = v6[12];
        if (v17 | (unint64_t)self->_lyricExcerpt)
          v5 = objc_msgSend((id)v17, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_storeIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("artist"), CFSTR("album"), CFSTR("lyrics"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("previewURL"), CFSTR("offers"), CFSTR("lyricExcerpt"), 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_BlastDoorLPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_BlastDoorLPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (void)setLyricExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
