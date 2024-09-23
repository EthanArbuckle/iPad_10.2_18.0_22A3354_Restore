@implementation LPiTunesMediaSoftwareMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaSoftwareMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *storeFrontIdentifier;
  uint64_t v10;
  NSString *storeIdentifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *subtitle;
  uint64_t v16;
  NSString *genre;
  uint64_t v18;
  NSString *platform;
  uint64_t v20;
  LPImage *icon;
  uint64_t v22;
  NSArray *screenshots;
  uint64_t v24;
  LPVideo *previewVideo;
  LPiTunesMediaSoftwareMetadata *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LPiTunesMediaSoftwareMetadata;
  v5 = -[LPiTunesMediaSoftwareMetadata init](&v28, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_isMessagesOnlyApp;
    *(_QWORD *)&v5->_isMessagesOnlyApp = v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("genre"));
    v14 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("platform"));
    v16 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v16;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v18 = objc_claimAutoreleasedReturnValue();
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;

    objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("screenshots"));
    v20 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v20;

    objc_msgSend(v4, "_lp_strictlyDecodeLPVideoForKey:", CFSTR("previewVideo"));
    v22 = objc_claimAutoreleasedReturnValue();
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v22;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMessagesOnlyApp"));
    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("messagesAppIcon"));
    v24 = objc_claimAutoreleasedReturnValue();
    previewVideo = v5->_previewVideo;
    v5->_previewVideo = (LPVideo *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_isMessagesOnlyApp, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("subtitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("genre"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_genre, CFSTR("platform"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_platform, CFSTR("icon"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("screenshots"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_screenshots, CFSTR("previewVideo"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1), CFSTR("isMessagesOnlyApp"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_previewVideo, CFSTR("messagesAppIcon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaSoftwareMetadata *v4;
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
  LPiTunesMediaSoftwareMetadata *v15;

  v4 = +[LPiTunesMediaSoftwareMetadata allocWithZone:](LPiTunesMediaSoftwareMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaSoftwareMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaSoftwareMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaSoftwareMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaSoftwareMetadata subtitle](self, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setSubtitle:](v4, "setSubtitle:", v8);

    -[LPiTunesMediaSoftwareMetadata genre](self, "genre");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setGenre:](v4, "setGenre:", v9);

    -[LPiTunesMediaSoftwareMetadata platform](self, "platform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setPlatform:](v4, "setPlatform:", v10);

    -[LPiTunesMediaSoftwareMetadata icon](self, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setIcon:](v4, "setIcon:", v11);

    -[LPiTunesMediaSoftwareMetadata screenshots](self, "screenshots");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setScreenshots:](v4, "setScreenshots:", v12);

    -[LPiTunesMediaSoftwareMetadata previewVideo](self, "previewVideo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setPreviewVideo:](v4, "setPreviewVideo:", v13);

    -[LPiTunesMediaSoftwareMetadata setIsMessagesOnlyApp:](v4, "setIsMessagesOnlyApp:", -[LPiTunesMediaSoftwareMetadata isMessagesOnlyApp](self, "isMessagesOnlyApp"));
    -[LPiTunesMediaSoftwareMetadata messagesAppIcon](self, "messagesAppIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSoftwareMetadata setMessagesAppIcon:](v4, "setMessagesAppIcon:", v14);

    v15 = v4;
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
  v8.super_class = (Class)LPiTunesMediaSoftwareMetadata;
  if (-[LPiTunesMediaSoftwareMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], *(void **)&self->_isMessagesOnlyApp) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeFrontIdentifier)
        && objectsAreEqual_0(v6[4], self->_storeIdentifier)
        && objectsAreEqual_0(v6[5], self->_name)
        && objectsAreEqual_0(v6[6], self->_subtitle)
        && objectsAreEqual_0(v6[7], self->_genre)
        && objectsAreEqual_0(v6[8], self->_platform)
        && objectsAreEqual_0(v6[9], self->_icon)
        && objectsAreEqual_0(v6[10], self->_screenshots)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1))
      {
        v5 = objectsAreEqual_0(v6[11], self->_previewVideo);
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
  return -[NSString hash](self->_storeFrontIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("icon"));
  v3[2](v3, CFSTR("screenshots"));
  v3[2](v3, CFSTR("messagesAppIcon"));
  v3[2](v3, CFSTR("previewVideo"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("subtitle"), CFSTR("genre"), CFSTR("platform"), CFSTR("icon"), CFSTR("screenshots"), CFSTR("previewVideo"), CFSTR("isMessagesOnlyApp"), CFSTR("messagesAppIcon"), 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_isMessagesOnlyApp;
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

- (NSString)subtitle
{
  return self->_name;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_subtitle;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)platform
{
  return self->_genre;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (LPImage)icon
{
  return (LPImage *)self->_platform;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSArray)screenshots
{
  return (NSArray *)self->_icon;
}

- (void)setScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (LPVideo)previewVideo
{
  return (LPVideo *)self->_screenshots;
}

- (void)setPreviewVideo:(id)a3
{
  objc_storeStrong((id *)&self->_screenshots, a3);
}

- (BOOL)isMessagesOnlyApp
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsMessagesOnlyApp:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (LPImage)messagesAppIcon
{
  return (LPImage *)self->_previewVideo;
}

- (void)setMessagesAppIcon:(id)a3
{
  objc_storeStrong((id *)&self->_previewVideo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_isMessagesOnlyApp, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  void (**v10)(void *, void *);
  void *v11;
  LPCaptionBarPresentationProperties *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD aBlock[5];

  v4 = a3;
  if (-[LPiTunesMediaSoftwareMetadata isMessagesOnlyApp](self, "isMessagesOnlyApp"))
  {
    v5 = 4;
    v6 = 18;
  }
  else
  {
    -[LPiTunesMediaSoftwareMetadata platform](self, "platform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("iOS"));

    v9 = v8 == 0;
    if (v8)
      v6 = 12;
    else
      v6 = 11;
    v5 = 1;
    if (v9)
      v5 = 2;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__LPiTunesMediaSoftwareMetadata_Transformer__presentationPropertiesForTransformer___block_invoke;
  aBlock[3] = &__block_descriptor_40_e26___LPImage_16__0__LPImage_8l;
  aBlock[4] = v5;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v11, "setCaptionBar:", v12);

  -[LPiTunesMediaSoftwareMetadata name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSoftwareMetadata subtitle](self, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    -[LPiTunesMediaSoftwareMetadata genre](self, "genre");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  populateCaptionBar(v11, v13, v15, 0, 0, v4);
  if (!v14)

  -[LPiTunesMediaSoftwareMetadata subtitle](self, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = &unk_1E44EEA68;
  else
    v17 = &unk_1E44EEA80;
  objc_msgSend(v11, "captionBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottom");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leading");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaximumNumberOfLines:", v17);

  if (!-[LPiTunesMediaSoftwareMetadata isMessagesOnlyApp](self, "isMessagesOnlyApp")
    || (-[LPiTunesMediaSoftwareMetadata messagesAppIcon](self, "messagesAppIcon"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v10[2](v10, v21),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        !v22))
  {
    -[LPiTunesMediaSoftwareMetadata icon](self, "icon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", v11, v22, 0, 0);
  -[LPiTunesMediaSoftwareMetadata screenshots](self, "screenshots");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v25);

  -[LPiTunesMediaSoftwareMetadata previewVideo](self, "previewVideo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVideo:", v26);

  return v11;
}

id __83__LPiTunesMediaSoftwareMetadata_Transformer__presentationPropertiesForTransformer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  LPImageProperties *v7;

  v3 = a2;
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5)
  {
    v6 = v3;
  }
  else
  {
    v7 = objc_alloc_init(LPImageProperties);
    -[LPImageProperties setType:](v7, "setType:", *(_QWORD *)(a1 + 32));
    v6 = -[LPImage _initWithImage:properties:]([LPImage alloc], "_initWithImage:properties:", v3, v7);

  }
  return v6;
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
  LPLocalizedString(CFSTR("App Store: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSoftwareMetadata name](self, "name");
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
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LPiTunesMediaSoftwareMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v4);

  -[LPiTunesMediaSoftwareMetadata icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:", v5);

  -[LPiTunesMediaSoftwareMetadata screenshots](self, "screenshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaSoftwareMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
