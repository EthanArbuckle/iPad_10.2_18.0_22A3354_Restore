@implementation GEOStorefrontPresentationInfo

- (GEOStorefrontPresentationInfo)init
{
  GEOStorefrontPresentationInfo *result;

  result = (GEOStorefrontPresentationInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontPresentationInfo)initWithStorefrontPresentation:(id)a3
{
  id v4;
  void *v5;
  GEOStorefrontView *v6;
  void *v7;
  GEOStorefrontView *v8;
  GEOStorefrontView *closeUpView;
  GEOStorefrontView *v10;
  void *v11;
  GEOStorefrontView *v12;
  GEOStorefrontView *standOffView;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL *overlayImageURL;
  GEOStorefrontPresentationInfo *v18;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if ((objc_msgSend(v4, "hasCloseUpView") & 1) == 0)
    goto LABEL_10;
  v20.receiver = self;
  v20.super_class = (Class)GEOStorefrontPresentationInfo;
  self = -[GEOStorefrontPresentationInfo init](&v20, sel_init);
  if (!self)
    goto LABEL_10;
  v6 = [GEOStorefrontView alloc];
  objc_msgSend(v5, "closeUpView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GEOStorefrontView initWithStorefrontView:](v6, "initWithStorefrontView:", v7);
  closeUpView = self->_closeUpView;
  self->_closeUpView = v8;

  if (!self->_closeUpView)
    goto LABEL_10;
  if (objc_msgSend(v5, "hasStandOffView"))
  {
    v10 = [GEOStorefrontView alloc];
    objc_msgSend(v5, "standOffView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOStorefrontView initWithStorefrontView:](v10, "initWithStorefrontView:", v11);
    standOffView = self->_standOffView;
    self->_standOffView = v12;

    if (!self->_standOffView)
      goto LABEL_10;
  }
  if (!objc_msgSend(v5, "hasOverlayImageUrl"))
    goto LABEL_9;
  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "overlayImageUrl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v15);
  v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
  overlayImageURL = self->_overlayImageURL;
  self->_overlayImageURL = v16;

  if (self->_overlayImageURL)
  {
LABEL_9:
    self = self;
    v18 = self;
  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return v18;
}

- (GEOStorefrontView)closeUpView
{
  return self->_closeUpView;
}

- (GEOStorefrontView)standOffView
{
  return self->_standOffView;
}

- (NSURL)overlayImageURL
{
  return self->_overlayImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageURL, 0);
  objc_storeStrong((id *)&self->_standOffView, 0);
  objc_storeStrong((id *)&self->_closeUpView, 0);
}

@end
