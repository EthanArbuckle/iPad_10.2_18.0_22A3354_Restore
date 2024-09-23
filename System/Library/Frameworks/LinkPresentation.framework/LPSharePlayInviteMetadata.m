@implementation LPSharePlayInviteMetadata

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v27;
  void *v28;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  LPLocalizedString(CFSTR("SharePlay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "top");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leading");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v7);

  -[LPSharePlayInviteMetadata title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v11);

  objc_msgSend(v5, "captionBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottom");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leading");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaximumNumberOfLines:", &unk_1E44EEA08);

  v18 = (void *)objc_opt_class();
  -[LPSharePlayInviteMetadata applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharePlayInviteMetadata application](self, "application");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applicationNameToDisplayForBundleID:fallbackName:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "belowBottom");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leading");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v21);

  objc_msgSend(v5, "captionBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "belowBottom");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leading");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMaximumNumberOfLines:", &unk_1E44EEA08);

  -[LPSharePlayInviteMetadata icon](self, "icon");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v28);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 0;
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[LPSharePlayInviteMetadata title](self, "title", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("SharePlay Link: %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharePlayInviteMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LPLocalizedString(CFSTR("SharePlay Link"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
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
  id v7;

  v7 = a3;
  -[LPSharePlayInviteMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    LPLocalizedString(CFSTR("SharePlay Link"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setTitle:", v5);
  if (!v4)

  -[LPSharePlayInviteMetadata icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v6);

}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v4;
  LPSourceApplicationMetadata *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(LPSourceApplicationMetadata);
  v6 = objc_alloc(MEMORY[0x1E0D3A820]);
  -[LPSharePlayInviteMetadata applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v7);

  v9 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(v4, "scaleFactor");
  v11 = (void *)objc_msgSend(v9, "initWithSize:scale:", 8.0, 8.0, v10);
  objc_msgSend(v11, "setShouldApplyMask:", 0);
  objc_msgSend(v8, "prepareImageForDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", objc_msgSend(v12, "CGImage"));
  -[LPSourceApplicationMetadata setIcon:](v5, "setIcon:", v13);

  return v5;
}

+ (id)applicationNameToDisplayForBundleID:(id)a3 fallbackName:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v7 = CFSTR(" Podcasts");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
  {
    v7 = CFSTR(" News");
  }
  else if ((objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("com.apple.tv")) & 1) != 0)
  {
    v7 = CFSTR(" tv");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0)
  {
    v7 = CFSTR(" Music");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.iBooks")))
    {
      v8 = v6;
      goto LABEL_12;
    }
    v7 = CFSTR(" Books");
  }
  LPLocalizedString(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v9 = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharePlayInviteMetadata)initWithCoder:(id)a3
{
  id v4;
  LPSharePlayInviteMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *applicationBundleIdentifier;
  uint64_t v10;
  NSString *application;
  uint64_t v12;
  LPImage *icon;
  LPSharePlayInviteMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPSharePlayInviteMetadata;
  v5 = -[LPSharePlayInviteMetadata init](&v16, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("applicationBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("application"));
    v10 = objc_claimAutoreleasedReturnValue();
    application = v5->_application;
    v5->_application = (NSString *)v10;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v12 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_application, CFSTR("application"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPSharePlayInviteMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPSharePlayInviteMetadata *v9;

  v4 = +[LPSharePlayInviteMetadata allocWithZone:](LPSharePlayInviteMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPSharePlayInviteMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharePlayInviteMetadata setTitle:](v4, "setTitle:", v5);

    -[LPSharePlayInviteMetadata applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharePlayInviteMetadata setApplicationBundleIdentifier:](v4, "setApplicationBundleIdentifier:", v6);

    -[LPSharePlayInviteMetadata application](self, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharePlayInviteMetadata setApplication:](v4, "setApplication:", v7);

    -[LPSharePlayInviteMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharePlayInviteMetadata setIcon:](v4, "setIcon:", v8);

    v9 = v4;
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
  v8.super_class = (Class)LPSharePlayInviteMetadata;
  if (-[LPSharePlayInviteMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_applicationBundleIdentifier)
        && objectsAreEqual_0(v6[4], self->_application))
      {
        v5 = objectsAreEqual_0(v6[5], self->_icon);
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
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_applicationBundleIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_application, "hash");
  return v4 ^ v5 ^ -[LPImage hash](self->_icon, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("applicationBundleIdentifier"), CFSTR("application"), CFSTR("icon"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
