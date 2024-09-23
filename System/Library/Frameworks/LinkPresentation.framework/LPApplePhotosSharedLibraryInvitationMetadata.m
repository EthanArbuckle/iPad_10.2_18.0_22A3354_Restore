@implementation LPApplePhotosSharedLibraryInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  LPApplePhotosSharedLibraryInvitationMetadata *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  NSString *originatorDisplayName;
  LPApplePhotosSharedLibraryInvitationMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPApplePhotosSharedLibraryInvitationMetadata;
  v5 = -[LPApplePhotosSharedLibraryInvitationMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("originatorDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatorDisplayName = v5->_originatorDisplayName;
    v5->_originatorDisplayName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_originatorDisplayName, CFSTR("originatorDisplayName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPApplePhotosSharedLibraryInvitationMetadata *v4;
  void *v5;
  void *v6;
  LPApplePhotosSharedLibraryInvitationMetadata *v7;

  v4 = +[LPApplePhotosSharedLibraryInvitationMetadata allocWithZone:](LPApplePhotosSharedLibraryInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPApplePhotosSharedLibraryInvitationMetadata message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosSharedLibraryInvitationMetadata setMessage:](v4, "setMessage:", v5);

    -[LPApplePhotosSharedLibraryInvitationMetadata originatorDisplayName](self, "originatorDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosSharedLibraryInvitationMetadata setOriginatorDisplayName:](v4, "setOriginatorDisplayName:", v6);

    v7 = v4;
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
  v8.super_class = (Class)LPApplePhotosSharedLibraryInvitationMetadata;
  if (-[LPApplePhotosSharedLibraryInvitationMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_message) & 1) != 0)
        v5 = objectsAreEqual_0(v6[3], self->_originatorDisplayName);
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_message, "hash");
  return -[NSString hash](self->_originatorDisplayName, "hash") ^ v3;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("message"), CFSTR("originatorDisplayName"), 0);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)originatorDisplayName
{
  return self->_originatorDisplayName;
}

- (void)setOriginatorDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorDisplayName, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (id)sharedLibraryInvitationMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LPApplePhotosSharedLibraryInvitationMetadata originatorDisplayName](self, "originatorDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("%@ wants you to join a Shared Library in Photos"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosSharedLibraryInvitationMetadata originatorDisplayName](self, "originatorDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LPApplePhotosSharedLibraryInvitationMetadata message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  LPWebLinkPresentationProperties *v11;
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
  LPImagePresentationProperties *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    LPLocalizedString(CFSTR("Shared Library Invitation"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("InvitationIcon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(LPWebLinkPresentationProperties);
  -[LPWebLinkPresentationProperties setStyle:](v11, "setStyle:", 50);
  v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
  -[LPWebLinkPresentationProperties setCaptionBar:](v11, "setCaptionBar:", v12);

  -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "top");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leading");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v9);

  -[LPApplePhotosSharedLibraryInvitationMetadata sharedLibraryInvitationMessage](self, "sharedLibraryInvitationMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottom");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v16);

  -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottom");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leading");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMaximumNumberOfLines:", &unk_1E44EEB88);

  if (objc_msgSend(v4, "effectiveSizeClass") == 1
    || objc_msgSend(v4, "effectiveSizeClass") == 2
    || objc_msgSend(v4, "effectiveSizeClass") == 12)
  {
    -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLeadingIcon:", v10);

    v24 = objc_alloc_init(LPImagePresentationProperties);
    -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLeadingIconProperties:", v24);

    -[LPWebLinkPresentationProperties captionBar](v11, "captionBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingIconProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFilter:", 5);

  }
  else
  {
    -[LPWebLinkPresentationProperties setImage:](v11, "setImage:", v10);
  }

  return v11;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isApplePhotosSharedLibraryInvitationURL:](LPPresentationSpecializations, "isApplePhotosSharedLibraryInvitationURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[LPApplePhotosSharedLibraryInvitationMetadata sharedLibraryInvitationMessage](self, "sharedLibraryInvitationMessage", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    LPLocalizedString(CFSTR("Photos: Shared Library Invitation"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

@end
