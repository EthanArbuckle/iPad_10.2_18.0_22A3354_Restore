@implementation LPAppleTVMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppleTVMetadata)initWithCoder:(id)a3
{
  id v4;
  LPAppleTVMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  LPImage *artwork;
  LPAppleTVMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPAppleTVMetadata;
  v5 = -[LPAppleTVMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v10 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPAppleTVMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPAppleTVMetadata *v8;

  v4 = +[LPAppleTVMetadata allocWithZone:](LPAppleTVMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPAppleTVMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setTitle:](v4, "setTitle:", v5);

    -[LPAppleTVMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[LPAppleTVMetadata artwork](self, "artwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setArtwork:](v4, "setArtwork:", v7);

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
  v8.super_class = (Class)LPAppleTVMetadata;
  if (-[LPAppleTVMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0 && objectsAreEqual_0(v6[3], self->_subtitle))
        v5 = objectsAreEqual_0(v6[4], self->_artwork);
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
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("artwork"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v5 = a3;
  objc_msgSend(v5, "unspecializedPresentationPropertiesForStyle:", 34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v6, "setCaptionBar:", v7);

  -[LPAppleTVMetadata artwork](self, "artwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_populateProperties:withPrimaryImage:", v6, v9);
  if (!v8)
  {

  }
  -[LPAppleTVMetadata title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v5, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[LPAppleTVMetadata subtitle](self, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v5, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appleSummary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v16 = v18;
    }
    else
    {
      objc_msgSend(v5, "metadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "summary");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  LPLocalizedString(CFSTR(" tv"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "_rowConfigurationForStyle:", objc_msgSend(v6, "style"));
  if ((unint64_t)(v22 - 2) < 2)
  {
    objc_msgSend(v6, "captionBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "top");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leading");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setText:", v12);

    objc_msgSend(v6, "captionBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottom");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leading");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v16);

    objc_msgSend(v6, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "belowBottom");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v21);
LABEL_23:

    goto LABEL_24;
  }
  if (!v22)
  {
    objc_msgSend(v6, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "top");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v12);
    goto LABEL_23;
  }
  if (v22 == 1)
  {
    objc_msgSend(v6, "captionBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "top");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leading");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v12);

    if (v16)
      v26 = v16;
    else
      v26 = v21;
    objc_msgSend(v6, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottom");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v26);
    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[LPPresentationSpecializations isAppleTVURL:](LPPresentationSpecializations, "isAppleTVURL:", v3)
    || +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", v3);

  return v4;
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR(" tv: %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPAppleTVMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

  }
  return v10;
}

- (id)previewImageForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[LPAppleTVMetadata artwork](self, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "image");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
