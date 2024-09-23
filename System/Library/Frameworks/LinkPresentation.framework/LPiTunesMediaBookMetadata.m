@implementation LPiTunesMediaBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaBookMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaBookMetadata *v5;
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
  LPImage *artwork;
  LPiTunesMediaBookMetadata *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiTunesMediaBookMetadata;
  v5 = -[LPiTunesMediaBookMetadata init](&v20, sel_init);
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

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v16;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpineOnRight"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_hasSpineOnRight, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("author"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_author, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artworkMetadata"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1), CFSTR("hasSpineOnRight"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaBookMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPiTunesMediaBookMetadata *v11;

  v4 = +[LPiTunesMediaBookMetadata allocWithZone:](LPiTunesMediaBookMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaBookMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaBookMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaBookMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaBookMetadata author](self, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setAuthor:](v4, "setAuthor:", v8);

    -[LPiTunesMediaBookMetadata artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setArtwork:](v4, "setArtwork:", v9);

    -[LPiTunesMediaBookMetadata artworkMetadata](self, "artworkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaBookMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v10);

    -[LPiTunesMediaBookMetadata setHasSpineOnRight:](v4, "setHasSpineOnRight:", -[LPiTunesMediaBookMetadata hasSpineOnRight](self, "hasSpineOnRight"));
    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaBookMetadata;
  if (-[LPiTunesMediaBookMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_hasSpineOnRight) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeFrontIdentifier)
        && objectsAreEqual_0(v6[4], self->_storeIdentifier)
        && objectsAreEqual_0(v6[5], self->_name)
        && objectsAreEqual_0(v6[6], self->_author)
        && objectsAreEqual_0(v6[7], self->_artwork)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1);

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

- (LPImage)artwork
{
  return (LPImage *)self->_author;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (LPArtworkMetadata)artworkMetadata
{
  return (LPArtworkMetadata *)self->_artwork;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasSpineOnRight
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setHasSpineOnRight:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
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

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPImagePresentationProperties *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  -[LPiTunesMediaBookMetadata name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaBookMetadata author](self, "author");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR(" Books"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v5, v7, v8, v9, 1, v4);

  -[LPiTunesMediaBookMetadata artwork](self, "artwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v10);

  v11 = objc_alloc_init(LPImagePresentationProperties);
  if (-[LPiTunesMediaBookMetadata hasSpineOnRight](self, "hasSpineOnRight"))
    v12 = 9;
  else
    v12 = 8;
  -[LPImagePresentationProperties setFilter:](v11, "setFilter:", v12);
  objc_msgSend(v5, "setImageProperties:", v11);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Book: %@ – %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaBookMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaBookMetadata author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LPiTunesMediaBookMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaBookMetadata author](self, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByEmDash(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v6);

  -[LPiTunesMediaBookMetadata artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaBookMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
