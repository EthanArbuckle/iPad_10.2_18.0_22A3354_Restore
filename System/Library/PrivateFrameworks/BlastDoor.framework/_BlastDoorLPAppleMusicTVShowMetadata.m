@implementation _BlastDoorLPAppleMusicTVShowMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAppleMusicTVShowMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAppleMusicTVShowMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  _BlastDoorLPImage *artwork;
  uint64_t v14;
  _BlastDoorLPArtworkMetadata *artworkMetadata;
  _BlastDoorLPAppleMusicTVShowMetadata *v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPAppleMusicTVShowMetadata;
  v5 = -[_BlastDoorLPAppleMusicTVShowMetadata init](&v18, sel_init);
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

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v12 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v14 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v14;

    v16 = v5;
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
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAppleMusicTVShowMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BlastDoorLPAppleMusicTVShowMetadata *v10;

  v4 = +[_BlastDoorLPAppleMusicTVShowMetadata allocWithZone:](_BlastDoorLPAppleMusicTVShowMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAppleMusicTVShowMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleMusicTVShowMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPAppleMusicTVShowMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleMusicTVShowMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPAppleMusicTVShowMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleMusicTVShowMetadata setName:](v4, "setName:", v7);

    -[_BlastDoorLPAppleMusicTVShowMetadata artwork](self, "artwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleMusicTVShowMetadata setArtwork:](v4, "setArtwork:", v8);

    -[_BlastDoorLPAppleMusicTVShowMetadata artworkMetadata](self, "artworkMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleMusicTVShowMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v9);

    v10 = v4;
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
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPAppleMusicTVShowMetadata;
  if (-[_BlastDoorLPAppleMusicTVShowMetadata isEqual:](&v13, sel_isEqual_, v4))
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
        || (v10 = v6[5], v10 | (unint64_t)self->_artwork) && !objc_msgSend((id)v10, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v11 = v6[6];
        if (v11 | (unint64_t)self->_artworkMetadata)
          v5 = objc_msgSend((id)v11, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
