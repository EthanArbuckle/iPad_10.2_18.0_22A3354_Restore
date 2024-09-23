@implementation CKSyndicationOnboardingLinkBalloonView

- (CKSyndicationOnboardingLinkBalloonView)initWithFrame:(CGRect)a3 withURL:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKSyndicationOnboardingLinkBalloonView *v10;
  CKSyndicationOnboardingLinkBalloonView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKSyndicationOnboardingLinkBalloonView;
  v10 = -[CKTranscriptPluginBalloonView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CKSyndicationOnboardingLinkBalloonView setPluginViewToURL:](v10, "setPluginViewToURL:", v9);
    -[CKTranscriptPluginBalloonView setIsSyndicationOnboarding:](v11, "setIsSyndicationOnboarding:", 1);
  }

  return v11;
}

- (void)setPluginViewToURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CC11A8];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  objc_msgSend(v10, "setOriginalURL:", v5);
  objc_msgSend(v10, "setURL:", v5);
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", CFSTR("https://tv")))
  {
    +[CKSyndicationOnboardingLinkBalloonView tvSpecialization](CKSyndicationOnboardingLinkBalloonView, "tvSpecialization");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("https://podcasts")))
      +[CKSyndicationOnboardingLinkBalloonView podcastSpecialization](CKSyndicationOnboardingLinkBalloonView, "podcastSpecialization");
    else
      +[CKSyndicationOnboardingLinkBalloonView musicSpecialization](CKSyndicationOnboardingLinkBalloonView, "musicSpecialization");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v10, "setSpecialization:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", v10);
  -[CKTranscriptPluginBalloonView setPluginView:](self, "setPluginView:", v9);

}

+ (id)tvSpecialization
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0CC1138]);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_TV_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_TV_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightTV"));
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v8, CFSTR("image/png"));
  objc_msgSend(v2, "setArtwork:", v9);

  return v2;
}

+ (id)podcastSpecialization
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0CC1260]);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PODCAST_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEpisodeName:", v4);

  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PODCAST_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPodcastName:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightPodcast"));
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v8, CFSTR("image/png"));
  objc_msgSend(v2, "setArtwork:", v9);

  return v2;
}

+ (id)musicSpecialization
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0CC1270]);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_MUSIC_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_MUSIC_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArtist:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightMusic"));
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v8, CFSTR("image/png"));
  objc_msgSend(v2, "setArtwork:", v9);

  return v2;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
}

@end
