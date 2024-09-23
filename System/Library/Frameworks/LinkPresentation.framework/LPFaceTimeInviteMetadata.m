@implementation LPFaceTimeInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPFaceTimeInviteMetadata)initWithCoder:(id)a3
{
  id v4;
  LPFaceTimeInviteMetadata *v5;
  uint64_t v6;
  NSString *title;
  LPFaceTimeInviteMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPFaceTimeInviteMetadata;
  v5 = -[LPFaceTimeInviteMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPFaceTimeInviteMetadata *v4;
  void *v5;
  LPFaceTimeInviteMetadata *v6;

  v4 = +[LPFaceTimeInviteMetadata allocWithZone:](LPFaceTimeInviteMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPFaceTimeInviteMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFaceTimeInviteMetadata setTitle:](v4, "setTitle:", v5);

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
  v7.super_class = (Class)LPFaceTimeInviteMetadata;
  if (-[LPFaceTimeInviteMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objectsAreEqual_0(v4[2], self->_title);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  LPImagePresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  LPImagePresentationProperties *v14;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  v7 = objc_alloc_init(LPImagePresentationProperties);
  if (objc_msgSend(v4, "effectiveSizeClass") == 2 || objc_msgSend(v4, "effectiveSizeClass") == 12)
  {
    -[LPFaceTimeInviteMetadata title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      LPLocalizedString(CFSTR("FaceTime Link"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "captionBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "top");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v9);

    if (!v8)
    +[LPResources linkIcon](LPResources, "linkIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[LPResources faceTimeIcon](LPResources, "faceTimeIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(LPImagePresentationProperties);

    -[LPImagePresentationProperties setFilter:](v14, "setFilter:", 1);
    -[LPImagePresentationProperties setScalingMode:](v14, "setScalingMode:", 1);
    -[LPFaceTimeInviteMetadata title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      LPLocalizedString(CFSTR("FaceTime"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "captionBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "top");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leading");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v16);

    if (!v15)
    -[LPFaceTimeInviteMetadata title](self, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      LPLocalizedString(CFSTR("FaceTime Link"));
    else
      LPLocalizedString(CFSTR("Link"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottom");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leading");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v21);

    if (objc_msgSend(v4, "effectiveSizeClass") != 1 && (objc_msgSend(v4, "hasOverriddenBackgroundColor") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImagePresentationProperties setMaskColor:](v14, "setMaskColor:", v25);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "top");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leading");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setColor:", v26);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "colorWithAlphaComponent:", 0.6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottom");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "leading");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setColor:", v31);

    }
    v7 = v14;
  }
  objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:", v5, v13, v7);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return objc_msgSend(a3, "_lp_isFaceTimeInviteURL");
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[LPFaceTimeInviteMetadata title](self, "title", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("FaceTime Link: %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFaceTimeInviteMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LPLocalizedString(CFSTR("FaceTime Link"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPResources faceTimeIcon](LPResources, "faceTimeIcon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LPFaceTimeInviteMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    LPLocalizedString(CFSTR("FaceTime Link"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setTitle:", v5);
  if (!v4)

}

@end
