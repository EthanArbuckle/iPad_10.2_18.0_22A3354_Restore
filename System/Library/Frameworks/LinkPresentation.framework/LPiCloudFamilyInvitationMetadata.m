@implementation LPiCloudFamilyInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiCloudFamilyInvitationMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *action;
  uint64_t v12;
  NSString *kind;
  uint64_t v14;
  LPImage *image;
  uint64_t v16;
  LPImage *icon;
  LPiCloudFamilyInvitationMetadata *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiCloudFamilyInvitationMetadata;
  v5 = -[LPiCloudFamilyInvitationMetadata init](&v20, sel_init);
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

    decodeStringForKey(v4, (uint64_t)CFSTR("action"));
    v10 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("kind"));
    v12 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v14 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (LPImage *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v16 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiCloudFamilyInvitationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPiCloudFamilyInvitationMetadata *v11;

  v4 = +[LPiCloudFamilyInvitationMetadata allocWithZone:](LPiCloudFamilyInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiCloudFamilyInvitationMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setTitle:](v4, "setTitle:", v5);

    -[LPiCloudFamilyInvitationMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[LPiCloudFamilyInvitationMetadata action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setAction:](v4, "setAction:", v7);

    -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setKind:](v4, "setKind:", v8);

    -[LPiCloudFamilyInvitationMetadata image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setImage:](v4, "setImage:", v9);

    -[LPiCloudFamilyInvitationMetadata icon](self, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudFamilyInvitationMetadata setIcon:](v4, "setIcon:", v10);

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
  v8.super_class = (Class)LPiCloudFamilyInvitationMetadata;
  if (-[LPiCloudFamilyInvitationMetadata isEqual:](&v8, sel_isEqual_, v4))
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
        && objectsAreEqual_0(v6[3], self->_subtitle)
        && objectsAreEqual_0(v6[4], self->_action)
        && objectsAreEqual_0(v6[5], self->_kind)
        && objectsAreEqual_0(v6[6], self->_image))
      {
        v5 = objectsAreEqual_0(v6[7], self->_icon);
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
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_action, "hash");
  return v4 ^ v5 ^ -[LPImage hash](self->_image, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("image"));
  v3[2](v3, CFSTR("icon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("action"), CFSTR("kind"), CFSTR("image"), CFSTR("icon"), 0);
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

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
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
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  if (sizeClassAllowsMedia(objc_msgSend(v4, "effectiveSizeClass")))
  {
    -[LPiCloudFamilyInvitationMetadata image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      -[LPiCloudFamilyInvitationMetadata icon](self, "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v8);
  }
  else
  {
    -[LPiCloudFamilyInvitationMetadata icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      -[LPiCloudFamilyInvitationMetadata image](self, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "_populateProperties:withPrimaryIcon:", v5, v8);
  }
  if (!v7)

  v9 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v9 - 1) < 3)
  {
    -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(v4, "effectiveSizeClass");

      if (v11 == 2)
      {
        -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "captionBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "top");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "leading");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v12);

        LPLocalizedString(CFSTR("Invitation"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "captionBar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bottom");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "leading");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v16);
LABEL_23:

        goto LABEL_24;
      }
    }
    objc_msgSend(v4, "preferredContentSizeCategory");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (v20
      && UIContentSizeCategoryCompareToCategory(v20, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending)
    {
      -[LPiCloudFamilyInvitationMetadata title](self, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "top");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leading");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v21);
    }
    else
    {
      -[LPiCloudFamilyInvitationMetadata subtitle](self, "subtitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "top");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leading");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v21);
    }

    -[LPiCloudFamilyInvitationMetadata action](self, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottom");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leading");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v17);
LABEL_22:

    goto LABEL_23;
  }
  if (!v9)
  {
    -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[LPiCloudFamilyInvitationMetadata title](self, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "top");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leading");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v16);
      goto LABEL_23;
    }
    -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(CFSTR("Invitation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    joinedByEmDash(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "top");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leading");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v18);

    goto LABEL_22;
  }
LABEL_24:

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LPiCloudFamilyInvitationMetadata kind](self, "kind", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPiCloudFamilyInvitationMetadata kind](self, "kind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(CFSTR("Invitation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    joinedByEmDash(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LPiCloudFamilyInvitationMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  -[LPiCloudFamilyInvitationMetadata image](self, "image", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LPiCloudFamilyInvitationMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v4);

  -[LPiCloudFamilyInvitationMetadata image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v5);

  -[LPiCloudFamilyInvitationMetadata icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:", v6);

  -[LPiCloudFamilyInvitationMetadata action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSummary:", v7);

}

@end
