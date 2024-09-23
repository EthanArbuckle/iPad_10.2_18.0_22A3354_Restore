@implementation CKInlineStickerBalloonView

- (void)addFilter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "balloonFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKInlineStickerBalloonView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CKInlineStickerBalloonView layer](self, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "filters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "balloonFilters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    }
    else
    {
      objc_msgSend(v12, "balloonFilters");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInlineStickerBalloonView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v10);

    if (v9)
    {

      v10 = v3;
    }

  }
  objc_msgSend(v12, "contentAlpha");
  -[CKInlineStickerBalloonView setAlpha:](self, "setAlpha:");

}

- (void)clearFilters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKInlineStickerBalloonView;
  -[CKImageBalloonView clearFilters](&v4, sel_clearFilters);
  -[CKInlineStickerBalloonView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[CKInlineStickerBalloonView setAlpha:](self, "setAlpha:", 1.0);
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKInlineStickerBalloonView;
  -[CKImageBalloonView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKInlineStickerBalloonView;
  -[CKImageBalloonView prepareForReuse](&v2, sel_prepareForReuse);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKInlineStickerBalloonView;
  v4 = a3;
  -[CKImageBalloonView configureForMessagePart:](&v9, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "mediaObject", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transfer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D37F10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    -[CKBalloonImageView setStickerAccessibilityDescription:](self, "setStickerAccessibilityDescription:", v8);

}

@end
