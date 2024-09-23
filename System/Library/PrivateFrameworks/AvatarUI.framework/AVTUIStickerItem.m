@implementation AVTUIStickerItem

- (AVTUIStickerItem)initWithIdentifier:(id)a3 localizedName:(id)a4 resourceProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTUIStickerItem *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *localizedName;
  uint64_t v16;
  id resourceProvider;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTUIStickerItem;
  v11 = -[AVTUIStickerItem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    resourceProvider = v11->_resourceProvider;
    v11->_resourceProvider = (id)v16;

  }
  return v11;
}

- (void)clearCachedItems
{
  -[AVTUIStickerItem setCachedMSSticker:](self, "setCachedMSSticker:", 0);
  -[AVTUIStickerItem setCachedImage:](self, "setCachedImage:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTUIStickerItem;
  -[AVTUIStickerItem description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTUIStickerItem localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@"), v5);

  if (-[AVTUIStickerItem hasBeenRendered](self, "hasBeenRendered"))
    objc_msgSend(v4, "appendString:", CFSTR(" hasBeenRendered"));
  -[AVTUIStickerItem cachedMSSticker](self, "cachedMSSticker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "appendString:", CFSTR(" has cached MSSticker"));
  -[AVTUIStickerItem cachedImage](self, "cachedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "appendString:", CFSTR(" and cached image"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v8;
}

- (void)discardContent
{
  void (**discardableContentHandler)(id, AVTUIStickerItem *);

  -[AVTUIStickerItem clearCachedItems](self, "clearCachedItems");
  discardableContentHandler = (void (**)(id, AVTUIStickerItem *))self->discardableContentHandler;
  if (discardableContentHandler)
    discardableContentHandler[2](discardableContentHandler, self);
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (MSSticker)cachedMSSticker
{
  return self->_cachedMSSticker;
}

- (void)setCachedMSSticker:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMSSticker, a3);
}

- (BOOL)hasBeenRendered
{
  return self->_hasBeenRendered;
}

- (void)setHasBeenRendered:(BOOL)a3
{
  self->_hasBeenRendered = a3;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImage, a3);
}

- (id)resourceProvider
{
  return self->_resourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_cachedMSSticker, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end
