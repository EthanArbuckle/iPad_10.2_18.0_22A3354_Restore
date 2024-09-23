@implementation LPiTunesUserProfileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesUserProfileMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesUserProfileMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  LPImage *artwork;
  uint64_t v10;
  LPArtworkMetadata *artworkMetadata;
  LPiTunesUserProfileMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPiTunesUserProfileMetadata;
  v5 = -[LPiTunesUserProfileMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v8 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesUserProfileMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPiTunesUserProfileMetadata *v8;

  v4 = +[LPiTunesUserProfileMetadata allocWithZone:](LPiTunesUserProfileMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesUserProfileMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesUserProfileMetadata setName:](v4, "setName:", v5);

    -[LPiTunesUserProfileMetadata artwork](self, "artwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesUserProfileMetadata setArtwork:](v4, "setArtwork:", v6);

    -[LPiTunesUserProfileMetadata artworkMetadata](self, "artworkMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesUserProfileMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v7);

    v8 = v4;
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
  v8.super_class = (Class)LPiTunesUserProfileMetadata;
  if (-[LPiTunesUserProfileMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0 && objectsAreEqual_0(v6[3], self->_artwork))
        v5 = objectsAreEqual_0(v6[4], self->_artworkMetadata);
      else
        v5 = 0;

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
  return -[NSString hash](self->_name, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  if (objc_msgSend(v4, "effectiveSizeClass") == 2)
  {
    -[LPiTunesUserProfileMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(CFSTR("Profile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    appleMusicWordmark(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    populateCaptionBar(v5, v7, v8, v9, 1, v4);

  }
  else
  {
    -[LPiTunesUserProfileMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    appleMusicWordmark(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    populateCaptionBar(v5, v7, 0, v8, 1, v4);
  }

  -[LPiTunesUserProfileMetadata artwork](self, "artwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v10);

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

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Profile: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesUserProfileMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LPiTunesUserProfileMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[LPiTunesUserProfileMetadata artwork](self, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

@end
