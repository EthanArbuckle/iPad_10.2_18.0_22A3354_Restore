@implementation LPPlayButtonView

- (LPPlayButtonView)initWithHost:(id)a3
{

  return 0;
}

- (LPPlayButtonView)initWithHost:(id)a3 playbackInformation:(id)a4 style:(id)a5 properties:(id)a6
{
  id v11;
  id v12;
  id v13;
  LPPlayButtonView *v14;
  LPPlayButtonView *v15;
  LPPlayButtonView *v16;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LPPlayButtonView;
  v14 = -[LPComponentView initWithHost:](&v18, sel_initWithHost_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_style, a5);
    objc_storeStrong((id *)&v15->_properties, a6);
    objc_storeStrong((id *)&v15->_playbackInformation, a4);
    v16 = v15;
  }

  return v15;
}

- (void)buildSubviewsIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  if (!self->_hasBuilt)
  {
    -[LPPlayButtonView updateButton](self, "updateButton");
    objc_initWeak(&location, self);
    +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __41__LPPlayButtonView_buildSubviewsIfNeeded__block_invoke;
    v7 = &unk_1E44A84B8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "registerForStoreAvailablityChangesWithToken:handler:", self, &v4);

    if (-[LPPlayButtonPresentationProperties disabled](self->_properties, "disabled", v4, v5, v6, v7))
      -[LPPlayButtonControl setEnabled:](self->_button, "setEnabled:", 0);
    self->_hasBuilt = 1;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __41__LPPlayButtonView_buildSubviewsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateButton");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForStoreAvailablityChangesWithToken:", self);

  v4.receiver = self;
  v4.super_class = (Class)LPPlayButtonView;
  -[LPPlayButtonView dealloc](&v4, sel_dealloc);
}

- (BOOL)isLyricStyle
{
  LPPlayButtonView *v2;
  void *v3;

  v2 = self;
  -[LPComponentView host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "rendererStyleForComponentView:", v2) == 42;

  return (char)v2;
}

- (id)theme
{
  void *v3;
  void *v4;
  LPAudioPlayButtonTheme *v5;
  void *v6;
  void *v7;
  void *v8;
  LPAudioPlayButtonTheme *v9;
  LPAudioPlayButtonStyle *style;
  void *v12;
  _BOOL4 v13;
  _QWORD v14[5];

  -[LPPlayButtonPresentationProperties accentColor](self->_properties, "accentColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __25__LPPlayButtonView_theme__block_invoke;
    v14[3] = &unk_1E44A9A00;
    v14[4] = self;
    __25__LPPlayButtonView_theme__block_invoke((uint64_t)v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [LPAudioPlayButtonTheme alloc];
    -[LPPlayButtonPresentationProperties accentColor](self->_properties, "accentColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAudioPlayButtonStyle defaultTheme](self->_style, "defaultTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outerBorderColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v5, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v4, v6, v8, 0);

    return v9;
  }
  else
  {
    switch(-[LPInlineMediaPlaybackInformation type](self->_playbackInformation, "type"))
    {
      case 0uLL:
        v13 = -[LPPlayButtonView isLyricStyle](self, "isLyricStyle");
        style = self->_style;
        if (!v13)
          goto LABEL_5;
        -[LPAudioPlayButtonStyle lyricExcerptTheme](style, "lyricExcerptTheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
      case 2uLL:
      case 5uLL:
        style = self->_style;
LABEL_5:
        -[LPAudioPlayButtonStyle appleMusicTheme](style, "appleMusicTheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3uLL:
      case 4uLL:
        -[LPAudioPlayButtonStyle podcastsTheme](self->_style, "podcastsTheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 6uLL:
        -[LPAudioPlayButtonStyle audioBookTheme](self->_style, "audioBookTheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        -[LPAudioPlayButtonStyle defaultTheme](self->_style, "defaultTheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
    return v12;
  }
}

id __25__LPPlayButtonView_theme__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "accentColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "deprecatedLuminosityLevel");

  if (v2)
  {
    if (v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)installPlaceholderButton
{
  LPPlayButtonControl *button;
  LPPlaceholderPlayButtonControl *v4;
  LPAudioPlayButtonStyle *style;
  void *v6;
  LPPlayButtonControl *v7;
  LPPlayButtonControl *v8;

  button = self->_button;
  if (button)
    -[LPPlayButtonControl removeFromSuperview](button, "removeFromSuperview");
  v4 = [LPPlaceholderPlayButtonControl alloc];
  style = self->_style;
  -[LPPlayButtonView theme](self, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LPPlaceholderPlayButtonControl initWithStyle:theme:](v4, "initWithStyle:theme:", style, v6);
  v8 = self->_button;
  self->_button = v7;

  -[LPPlayButtonView addSubview:](self, "addSubview:", self->_button);
}

- (void)installiTunesButton
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
  {
    v3 = *a2;
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A0C41000, log, OS_LOG_TYPE_DEFAULT, "Trying to install an iTunes button with no store identifier or persistent identifier or preview url %@; this viola"
      "tes the invariant",
      (uint8_t *)&v4,
      0xCu);
  }
  abort();
}

- (void)installDisablediTunesButton
{
  if (-[LPPlayButtonView isLyricStyle](self, "isLyricStyle"))
  {
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
  }
  else
  {
    -[LPPlayButtonView installiTunesButton](self, "installiTunesButton");
    -[LPPlayButtonControl setEnabled:](self->_button, "setEnabled:", 0);
    -[LPPlayButtonView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }
}

- (void)installPreviewButton
{
  LPPlayButtonControl *button;
  LPAudio *v4;
  void *v5;
  LPAudioProperties *v6;
  LPStreamingAudioPlayButtonControl *v7;
  LPAudioPlayButtonStyle *style;
  void *v9;
  void *v10;
  void *v11;
  LPPlayButtonControl *v12;
  LPPlayButtonControl *v13;
  LPAudio *v14;

  if (-[LPPlayButtonView isLyricStyle](self, "isLyricStyle"))
  {
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
  }
  else
  {
    button = self->_button;
    if (button)
      -[LPPlayButtonControl removeFromSuperview](button, "removeFromSuperview");
    v4 = [LPAudio alloc];
    -[LPInlineMediaPlaybackInformation previewURL](self->_playbackInformation, "previewURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(LPAudioProperties);
    v14 = -[LPAudio initWithStreamingURL:properties:](v4, "initWithStreamingURL:properties:", v5, v6);

    v7 = [LPStreamingAudioPlayButtonControl alloc];
    style = self->_style;
    -[LPPlayButtonView theme](self, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPComponentView host](self, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentView:playerForAudio:", self, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[LPStreamingAudioPlayButtonControl initWithAudio:style:theme:player:](v7, "initWithAudio:style:theme:player:", v14, style, v9, v11);
    v13 = self->_button;
    self->_button = v12;

    -[LPPlayButtonControl installRecognizersOnView:](self->_button, "installRecognizersOnView:", self);
    -[LPPlayButtonView addSubview:](self, "addSubview:", self->_button);

  }
}

- (void)updateButtonForSongOrAlbum
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPInlineMediaPlaybackInformation storefrontIdentifier](self->_playbackInformation, "storefrontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "userStateForMediaStorefrontIdentifier:", v4);

  if (v5 == 4)
  {
LABEL_9:
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
    return;
  }
  if (!v5)
  {
    -[LPPlayButtonView installDisablediTunesButton](self, "installDisablediTunesButton");
    return;
  }
  if (-[LPInlineMediaPlaybackInformation type](self->_playbackInformation, "type") == 5)
    goto LABEL_5;
  v6 = -[LPInlineMediaPlaybackInformation availability](self->_playbackInformation, "availability");
  if (v6 < 2)
  {
    if (v5 == 1)
    {
LABEL_5:
      -[LPPlayButtonView installiTunesButton](self, "installiTunesButton");
      return;
    }
  }
  else if (v6 != 2)
  {
    if (v6 != 3)
      return;
    goto LABEL_9;
  }
  -[LPPlayButtonView installPreviewButton](self, "installPreviewButton");
}

- (void)updateButtonForRadio
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPInlineMediaPlaybackInformation storefrontIdentifier](self->_playbackInformation, "storefrontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "userStateForMediaStorefrontIdentifier:", v4);

  if ((unint64_t)(v5 - 2) >= 3)
  {
    if (v5)
    {
      if (v5 == 1)
        -[LPPlayButtonView installiTunesButton](self, "installiTunesButton");
    }
    else
    {
      -[LPPlayButtonView installDisablediTunesButton](self, "installDisablediTunesButton");
    }
  }
  else
  {
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
  }
}

- (void)updateButtonForAudioBook
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.iBooks"), 1, 0);
  if (v3
    && (v4 = v3,
        objc_msgSend(v3, "applicationState"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isInstalled"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[LPPlayButtonView installiTunesButton](self, "installiTunesButton");
  }
  else
  {
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
  }
}

- (void)updateButtonForPodcast
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (-[LPInlineMediaPlaybackInformation isAvailableForAnonymousDownload](self->_playbackInformation, "isAvailableForAnonymousDownload")&& (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.iBooks"), 1, 0)) != 0&& (v4 = v3, objc_msgSend(v3, "applicationState"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isInstalled"), v5, v4, (v6 & 1) != 0))
  {
    -[LPPlayButtonView installiTunesButton](self, "installiTunesButton");
  }
  else
  {
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
  }
}

- (void)installAudioButton
{
  LPPlayButtonControl *button;
  LPStreamingAudioPlayButtonControl *v4;
  void *v5;
  LPAudioPlayButtonStyle *style;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPPlayButtonControl *v11;
  LPPlayButtonControl *v12;

  button = self->_button;
  if (button)
    -[LPPlayButtonControl removeFromSuperview](button, "removeFromSuperview");
  v4 = [LPStreamingAudioPlayButtonControl alloc];
  -[LPInlineMediaPlaybackInformation audio](self->_playbackInformation, "audio");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  -[LPPlayButtonView theme](self, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPComponentView host](self, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPInlineMediaPlaybackInformation audio](self->_playbackInformation, "audio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentView:playerForAudio:", self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LPStreamingAudioPlayButtonControl initWithAudio:style:theme:player:](v4, "initWithAudio:style:theme:player:", v5, style, v7, v10);
  v12 = self->_button;
  self->_button = v11;

  -[LPPlayButtonControl installRecognizersOnView:](self->_button, "installRecognizersOnView:", self);
  -[LPPlayButtonView addSubview:](self, "addSubview:", self->_button);
  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
}

- (void)updateButtonForAudioFile
{
  void *v3;

  -[LPInlineMediaPlaybackInformation audio](self->_playbackInformation, "audio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[LPPlayButtonView installAudioButton](self, "installAudioButton");
  else
    -[LPPlayButtonView installPlaceholderButton](self, "installPlaceholderButton");
}

- (void)updateButton
{
  -[LPPlayButtonView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  switch(-[LPInlineMediaPlaybackInformation type](self->_playbackInformation, "type"))
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      -[LPPlayButtonView updateButtonForSongOrAlbum](self, "updateButtonForSongOrAlbum");
      break;
    case 2uLL:
      -[LPPlayButtonView updateButtonForRadio](self, "updateButtonForRadio");
      break;
    case 3uLL:
    case 4uLL:
      -[LPPlayButtonView updateButtonForPodcast](self, "updateButtonForPodcast");
      break;
    case 6uLL:
      -[LPPlayButtonView updateButtonForAudioBook](self, "updateButtonForAudioBook");
      break;
    case 7uLL:
      -[LPPlayButtonView updateButtonForAudioFile](self, "updateButtonForAudioFile");
      break;
    default:
      return;
  }
}

- (void)layoutComponentView
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[LPPlayButtonView buildSubviewsIfNeeded](self, "buildSubviewsIfNeeded");
  -[LPPlayButtonView bounds](self, "bounds");
  -[LPPlayButtonControl setFrame:](self->_button, "setFrame:", v3 + self->_contentInset.left, v4 + self->_contentInset.top, v5 - (self->_contentInset.left + self->_contentInset.right), v6 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (id)playable
{
  return -[LPPlayButtonControl playable](self->_button, "playable");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_playbackInformation, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
