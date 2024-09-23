@implementation CNMeCardSharingContactAvatarProvider

- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3
{
  id v4;
  void *v5;
  CNAvatarImageRenderer *v6;
  CNMeCardSharingContactAvatarProvider *v7;

  v4 = a3;
  +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v5);
  v7 = -[CNMeCardSharingContactAvatarProvider initWithContact:renderer:](self, "initWithContact:renderer:", v4, v6);

  return v7;
}

- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3 renderer:(id)a4
{
  id v7;
  id v8;
  CNMeCardSharingContactAvatarProvider *v9;
  CNMeCardSharingContactAvatarProvider *v10;
  CNMeCardSharingContactAvatarProvider *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingContactAvatarProvider;
  v9 = -[CNMeCardSharingContactAvatarProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
    v11 = v10;
  }

  return v10;
}

- (NSData)imageData
{
  return -[CNContact imageData](self->_contact, "imageData");
}

- (CGRect)cropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CNContact cropRect](self->_contact, "cropRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSData)thumbnailImageData
{
  return -[CNContact thumbnailImageData](self->_contact, "thumbnailImageData");
}

- (CNWallpaper)wallpaper
{
  return (CNWallpaper *)-[CNContact wallpaper](self->_contact, "wallpaper");
}

- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4
{
  double height;
  double width;
  id v7;
  CNContact *contact;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  CNAvatarImageRenderer *renderer;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  height = a3.height;
  width = a3.width;
  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  contact = self->_contact;
  if (!contact)
    goto LABEL_7;
  -[CNContact imageData](contact, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[CNContact givenName](self->_contact, "givenName");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[CNContact familyName](self->_contact, "familyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_4;
    }
LABEL_7:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_8;
  }

LABEL_4:
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, width, height, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  renderer = self->_renderer;
  v19[0] = self->_contact;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer avatarImageForContacts:scope:](renderer, "avatarImageForContacts:scope:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v15, 0);
LABEL_8:

}

- (void)generatePosterImageWithWindowScene:(id)a3 imageHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D13818];
  -[CNContact wallpaper](self->_contact, "wallpaper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterArchiveData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if ((v7 & 1) != 0)
  {
    +[CNIncomingCallSnapshotViewController incomingCallPlaceholderSnapshotForContact:windowScene:completionBlock:](CNIncomingCallSnapshotViewController, "incomingCallPlaceholderSnapshotForContact:windowScene:completionBlock:", self->_contact, v12, v6);
  }
  else
  {
    -[CNContact wallpaper](self->_contact, "wallpaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "posterArchiveData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNIncomingCallSnapshotViewController incomingCallSnapshotForPosterArchiveData:contact:includingCallButtons:windowScene:completionBlock:](CNIncomingCallSnapshotViewController, "incomingCallSnapshotForPosterArchiveData:contact:includingCallButtons:windowScene:completionBlock:", v11, self->_contact, 1, v12, v6);

  }
}

- (void)generatePosterAnimationControllerWithWindowScene:(id)a3 imageHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[CNMeCardSharingContactAvatarProvider contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__CNMeCardSharingContactAvatarProvider_generatePosterAnimationControllerWithWindowScene_imageHandler___block_invoke;
  v11[3] = &unk_1E2049DB0;
  v12 = v6;
  v10 = v6;
  +[CNPosterOnboardingSettingsAnimationViewController controllerFor:isRTL:windowScene:shouldDefaultToCleanState:completion:](_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController, "controllerFor:isRTL:windowScene:shouldDefaultToCleanState:completion:", v8, v9, v7, 1, v11);

}

- (CNContact)contact
{
  return self->_contact;
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

uint64_t __102__CNMeCardSharingContactAvatarProvider_generatePosterAnimationControllerWithWindowScene_imageHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
