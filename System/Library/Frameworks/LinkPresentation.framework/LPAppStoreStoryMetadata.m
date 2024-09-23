@implementation LPAppStoreStoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppStoreStoryMetadata)initWithCoder:(id)a3
{
  id v4;
  LPAppStoreStoryMetadata *v5;
  uint64_t v6;
  NSString *subtitle;
  LPAppStoreStoryMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAppStoreStoryMetadata;
  v5 = -[LPAppStoreStoryMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPAppStoreStoryMetadata *v4;
  void *v5;
  LPAppStoreStoryMetadata *v6;

  v4 = +[LPAppStoreStoryMetadata allocWithZone:](LPAppStoreStoryMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPAppStoreStoryMetadata subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppStoreStoryMetadata setSubtitle:](v4, "setSubtitle:", v5);

    v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPAppStoreStoryMetadata;
  if (-[LPAppStoreStoryMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objectsAreEqual_0(v4[2], self->_subtitle);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_subtitle, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("subtitle"), 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "unspecializedPresentationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style")) - 1) < 3)
  {
    -[LPAppStoreStoryMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      LPLocalizedString(CFSTR("App Store"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "captionBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v7);

    if (!v6)
  }

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("App Store: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
