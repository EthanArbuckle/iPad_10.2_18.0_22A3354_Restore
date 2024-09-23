@implementation SUUIBrickItem

- (SUUIBrickItem)initWithBannerRoomContext:(id)a3
{
  id v4;
  SUUIBrickItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *accessibilityLabel;
  void *v11;
  SUUIEditorialComponent *v12;
  SUUIEditorialComponent *editorial;
  void *v14;
  void *v15;
  SUUIArtwork *v16;
  SUUIArtwork *artwork;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIBrickItem;
  v5 = -[SUUIBrickItem init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("link"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIBrickItem _setLinkInfoWithLinkDictionary:context:](v5, "_setLinkInfoWithLinkDictionary:context:", v7, v4);
    if (!v5->_accessibilityLabel)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("imageAltText"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v8, "copy");
        accessibilityLabel = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v9;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("text"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SUUIEditorialComponent initWithBrickRoomText:]([SUUIEditorialComponent alloc], "initWithBrickRoomText:", v11);
      editorial = v5->_editorial;
      v5->_editorial = v12;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("imageUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v14);
      if (v15)
      {
        v16 = -[SUUIArtwork initWithURL:size:]([SUUIArtwork alloc], "initWithURL:size:", v15, SUUIBrickItemSize());
        artwork = v5->_artwork;
        v5->_artwork = v16;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_brickIdentifier = objc_msgSend(v18, "longLongValue");

  }
  return v5;
}

- (SUUIBrickItem)initWithComponentContext:(id)a3
{
  id v4;
  SUUIBrickItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *accessibilityLabel;
  void *v11;
  void *v12;
  SUUIEditorialComponent *v13;
  SUUIEditorialComponent *editorial;
  void *v15;
  double v16;
  id v17;
  SUUIArtwork *v18;
  SUUIArtwork *artwork;
  uint64_t v20;
  void *v21;
  void *v22;
  SUUICountdown *v23;
  SUUICountdown *countdown;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIBrickItem;
  v5 = -[SUUIBrickItem init](&v27, sel_init);
  if (!v5)
    goto LABEL_22;
  objc_msgSend(v4, "componentDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("link"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUUIBrickItem _setLinkInfoWithLinkDictionary:context:](v5, "_setLinkInfoWithLinkDictionary:context:", v7, v4);
  if (!v5->_accessibilityLabel)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("designLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "copy");
      accessibilityLabel = v5->_accessibilityLabel;
      v5->_accessibilityLabel = (NSString *)v9;

    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("editorial"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v12, "setComponentDictionary:", v11);
    v13 = -[SUUIEditorialComponent initWithCustomPageContext:]([SUUIEditorialComponent alloc], "initWithCustomPageContext:", v12);
    editorial = v5->_editorial;
    v5->_editorial = v13;

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEB27A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = SUUIBrickItemSize();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v15;
    v18 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v17);

    artwork = v5->_artwork;
    v5->_artwork = v18;
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SUUIArtworkList artworkForSize:artworkDictionaries:](SUUIArtworkList, "artworkForSize:artworkDictionaries:", (uint64_t)v16, v15);
    v20 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (SUUIArtwork *)v20;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v6, "objectForKey:", CFSTR("fcKind"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v21, "integerValue") == 290
    || objc_msgSend(v22, "isEqualToString:", CFSTR("counter")))
  {
    v23 = -[SUUICountdown initWithCountdownDictionary:]([SUUICountdown alloc], "initWithCountdownDictionary:", v6);
    countdown = v5->_countdown;
    v5->_countdown = v23;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_brickIdentifier = objc_msgSend(v25, "longLongValue");

LABEL_22:
  return v5;
}

- (void)_setLinkItem:(id)a3
{
  -[SUUILink _setItem:](self->_link, "_setItem:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIBrickItem;
  -[SUUIBrickItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: \"%@\", %@"), v4, self->_accessibilityLabel, self->_link);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4
{
  id v6;
  SUUILink *v7;
  SUUILink *link;
  NSString *v9;
  NSString *accessibilityLabel;
  void *v11;
  NSString *v12;
  NSString *v13;
  id v14;

  v6 = a3;
  v14 = (id)objc_msgSend(a4, "copy");
  objc_msgSend(v14, "setComponentDictionary:", v6);

  v7 = -[SUUILink initWithComponentContext:]([SUUILink alloc], "initWithComponentContext:", v14);
  link = self->_link;
  self->_link = v7;

  -[SUUILink title](self->_link, "title");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  accessibilityLabel = self->_accessibilityLabel;
  self->_accessibilityLabel = v9;

  if (!self->_accessibilityLabel)
  {
    -[SUUILink item](self->_link, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_accessibilityLabel;
    self->_accessibilityLabel = v12;

  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SUUIArtwork)artwork
{
  return self->_artwork;
}

- (int64_t)brickIdentifier
{
  return self->_brickIdentifier;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (SUUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SUUILink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
