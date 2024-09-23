@implementation LPiTunesMediaRadioMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaRadioMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaRadioMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *curator;
  uint64_t v14;
  LPImage *artwork;
  uint64_t v16;
  LPArtworkMetadata *artworkMetadata;
  LPiTunesMediaRadioMetadata *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiTunesMediaRadioMetadata;
  v5 = -[LPiTunesMediaRadioMetadata init](&v20, sel_init);
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

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curator, CFSTR("curator"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaRadioMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPiTunesMediaRadioMetadata *v11;

  v4 = +[LPiTunesMediaRadioMetadata allocWithZone:](LPiTunesMediaRadioMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaRadioMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaRadioMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaRadioMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaRadioMetadata curator](self, "curator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setCurator:](v4, "setCurator:", v8);

    -[LPiTunesMediaRadioMetadata artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setArtwork:](v4, "setArtwork:", v9);

    -[LPiTunesMediaRadioMetadata artworkMetadata](self, "artworkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v10);

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaRadioMetadata;
  if (-[LPiTunesMediaRadioMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_storeFrontIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeIdentifier)
        && objectsAreEqual_0(v6[4], self->_name)
        && objectsAreEqual_0(v6[5], self->_curator)
        && objectsAreEqual_0(v6[6], self->_artwork))
      {
        v5 = objectsAreEqual_0(v6[7], self->_artworkMetadata);
      }
      else
      {
        v5 = 0;
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("curator"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
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

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (LPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  LPCaptionBarPresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(v5, "commonPresentationPropertiesForStyle:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v6, "setCaptionBar:", v7);

  -[LPiTunesMediaRadioMetadata curator](self, "curator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (objc_msgSend(v5, "effectiveSizeClass") == 2)
    {
      LPLocalizedString(CFSTR("Radio"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  -[LPiTunesMediaRadioMetadata name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  appleMusicWordmark(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v6, v9, v8, v10, 1, v5);

  -[LPiTunesMediaRadioMetadata artwork](self, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_populateProperties:withPrimaryImage:", v6, v11);

  -[LPiTunesMediaRadioMetadata storeIdentifier](self, "storeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaRadioMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(v5, "canonicalURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    storefrontIdentifierFromURL(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[LPInlineMediaPlaybackInformation radioPlaybackInformationWithStoreIdentifier:storefrontIdentifier:](LPInlineMediaPlaybackInformation, "radioPlaybackInformationWithStoreIdentifier:storefrontIdentifier:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

  }
  objc_msgSend(v6, "setInlinePlaybackInformation:", v15);

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[LPiTunesMediaRadioMetadata name](self, "name", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[LPiTunesMediaRadioMetadata curator](self, "curator"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Radio: %@ – %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata curator](self, "curator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Radio: %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
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
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LPiTunesMediaRadioMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[LPiTunesMediaRadioMetadata curator](self, "curator"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[LPiTunesMediaRadioMetadata name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaRadioMetadata curator](self, "curator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    joinedByEmDash(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v8);

  }
  else
  {
    -[LPiTunesMediaRadioMetadata name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v6);
  }

  -[LPiTunesMediaRadioMetadata artwork](self, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaRadioMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
