@implementation _BlastDoorLPiTunesMediaPlaylistMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaPlaylistMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaPlaylistMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *curator;
  uint64_t v14;
  NSURL *curatorProfileURL;
  uint64_t v16;
  NSString *curatorHandle;
  uint64_t v18;
  _BlastDoorLPImage *artwork;
  uint64_t v20;
  _BlastDoorLPArtworkMetadata *artworkMetadata;
  _BlastDoorLPiTunesMediaPlaylistMetadata *v22;
  objc_super v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_BlastDoorLPiTunesMediaPlaylistMetadata;
  v5 = -[_BlastDoorLPiTunesMediaPlaylistMetadata init](&v24, sel_init);
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

    decodeStringForKey(v4, (uint64_t)CFSTR("curator"));
    v12 = objc_claimAutoreleasedReturnValue();
    curator = v5->_curator;
    v5->_curator = (NSString *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("curatorProfileURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    curatorProfileURL = v5->_curatorProfileURL;
    v5->_curatorProfileURL = (NSURL *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("curatorHandle"));
    v16 = objc_claimAutoreleasedReturnValue();
    curatorHandle = v5->_curatorHandle;
    v5->_curatorHandle = (NSString *)v16;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v18;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v20;

    v22 = v5;
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
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_curator, CFSTR("curator"));
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_curatorProfileURL, CFSTR("curatorProfileURL"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_curatorHandle, CFSTR("curatorHandle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaPlaylistMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BlastDoorLPiTunesMediaPlaylistMetadata *v13;

  v4 = +[_BlastDoorLPiTunesMediaPlaylistMetadata allocWithZone:](_BlastDoorLPiTunesMediaPlaylistMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaPlaylistMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setName:](v4, "setName:", v7);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata curator](self, "curator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setCurator:](v4, "setCurator:", v8);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata curatorProfileURL](self, "curatorProfileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setCuratorProfileURL:](v4, "setCuratorProfileURL:", v9);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setCuratorHandle:](v4, "setCuratorHandle:", v10);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setArtwork:](v4, "setArtwork:", v11);

    -[_BlastDoorLPiTunesMediaPlaylistMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPlaylistMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

    v13 = v4;
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
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPiTunesMediaPlaylistMetadata;
  if (-[_BlastDoorLPiTunesMediaPlaylistMetadata isEqual:](&v16, sel_isEqual_, v4))
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
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_storeIdentifier)
        && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[4], v9 | (unint64_t)self->_name) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[5], v10 | (unint64_t)self->_curator) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[8], v11 | (unint64_t)self->_artwork) && !objc_msgSend((id)v11, "isEqual:")
        || (v12 = v6[9], v12 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v12, "isEqual:")
        || (v13 = v6[6], v13 | (unint64_t)self->_curatorProfileURL)
        && !objc_msgSend((id)v13, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v14 = v6[7];
        if (v14 | (unint64_t)self->_curatorHandle)
          v5 = objc_msgSend((id)v14, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("curator"), CFSTR("curatorProfileURL"), CFSTR("curatorHandle"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
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

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)curatorProfileURL
{
  return self->_curatorProfileURL;
}

- (void)setCuratorProfileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)curatorHandle
{
  return self->_curatorHandle;
}

- (void)setCuratorHandle:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curatorHandle, 0);
  objc_storeStrong((id *)&self->_curatorProfileURL, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
