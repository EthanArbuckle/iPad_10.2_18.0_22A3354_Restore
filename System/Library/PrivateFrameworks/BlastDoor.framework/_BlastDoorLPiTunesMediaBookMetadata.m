@implementation _BlastDoorLPiTunesMediaBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaBookMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaBookMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *storeFrontIdentifier;
  uint64_t v10;
  NSString *storeIdentifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *author;
  uint64_t v16;
  _BlastDoorLPImage *artwork;
  _BlastDoorLPiTunesMediaBookMetadata *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPiTunesMediaBookMetadata;
  v5 = -[_BlastDoorLPiTunesMediaBookMetadata init](&v20, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_hasSpineOnRight;
    *(_QWORD *)&v5->_hasSpineOnRight = v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("author"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v14;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v16;

    *(&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpineOnRight"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->_hasSpineOnRight;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, CFSTR("name"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("author"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_author, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artworkMetadata"));
  objc_msgSend(v5, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1), CFSTR("hasSpineOnRight"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaBookMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BlastDoorLPiTunesMediaBookMetadata *v11;

  v4 = +[_BlastDoorLPiTunesMediaBookMetadata allocWithZone:](_BlastDoorLPiTunesMediaBookMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaBookMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaBookMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaBookMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setName:](v4, "setName:", v7);

    -[_BlastDoorLPiTunesMediaBookMetadata author](self, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setAuthor:](v4, "setAuthor:", v8);

    -[_BlastDoorLPiTunesMediaBookMetadata artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setArtwork:](v4, "setArtwork:", v9);

    -[_BlastDoorLPiTunesMediaBookMetadata artworkMetadata](self, "artworkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaBookMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v10);

    -[_BlastDoorLPiTunesMediaBookMetadata setHasSpineOnRight:](v4, "setHasSpineOnRight:", -[_BlastDoorLPiTunesMediaBookMetadata hasSpineOnRight](self, "hasSpineOnRight"));
    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiTunesMediaBookMetadata;
  if (-[_BlastDoorLPiTunesMediaBookMetadata isEqual:](&v14, sel_isEqual_, v4))
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
      v5 = (!(v7 | *(_QWORD *)&self->_hasSpineOnRight) || objc_msgSend((id)v7, "isEqual:"))
        && ((v8 = v6[3], !(v8 | (unint64_t)self->_storeFrontIdentifier))
         || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = v6[4], !(v9 | (unint64_t)self->_storeIdentifier))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[5], !(v10 | (unint64_t)self->_name)) || objc_msgSend((id)v10, "isEqual:"))
        && ((v11 = v6[6], !(v11 | (unint64_t)self->_author)) || objc_msgSend((id)v11, "isEqual:"))
        && ((v12 = v6[7], !(v12 | (unint64_t)self->_artwork)) || objc_msgSend((id)v12, "isEqual:"))
        && *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1);

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
  return -[NSString hash](self->_storeFrontIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("author"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("hasSpineOnRight"), 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_hasSpineOnRight;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_storeIdentifier;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)author
{
  return self->_name;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_BlastDoorLPImage)artwork
{
  return (_BlastDoorLPImage *)self->_author;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
{
  return (_BlastDoorLPArtworkMetadata *)self->_artwork;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasSpineOnRight
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setHasSpineOnRight:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_hasSpineOnRight, 0);
}

@end
