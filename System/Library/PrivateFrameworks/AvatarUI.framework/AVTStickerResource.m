@implementation AVTStickerResource

- (AVTStickerResource)initWithImage:(id)a3 URL:(id)a4 clippingRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  AVTStickerResource *v14;
  AVTStickerResource *v15;
  AVTUINSURL *v16;
  void *v17;
  uint64_t v18;
  AVTUINSURL *internalURL;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AVTStickerResource;
  v14 = -[AVTStickerResource init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    if (v13)
    {
      v16 = [AVTUINSURL alloc];
      objc_msgSend(v13, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[AVTUINSURL initFileURLWithPath:](v16, "initFileURLWithPath:", v17);
      internalURL = v15->_internalURL;
      v15->_internalURL = (AVTUINSURL *)v18;

    }
    else
    {
      v17 = v15->_internalURL;
      v15->_internalURL = 0;
    }

    v15->_clippingRect.origin.x = x;
    v15->_clippingRect.origin.y = y;
    v15->_clippingRect.size.width = width;
    v15->_clippingRect.size.height = height;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTStickerResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  AVTStickerResource *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("clippingRect"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = -[AVTStickerResource initWithImage:URL:clippingRect:](self, "initWithImage:URL:clippingRect:", v5, v6, v8, v10, v12, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVTStickerResource image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("image"));

  -[AVTStickerResource URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("url"));

  -[AVTStickerResource clippingRect](self, "clippingRect");
  objc_msgSend(v6, "encodeCGRect:forKey:", CFSTR("clippingRect"));

}

- (void)setURL:(id)a3
{
  AVTUINSURL *v4;
  void *v5;
  AVTUINSURL *v6;
  AVTUINSURL *internalURL;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = [AVTUINSURL alloc];
    objc_msgSend(v8, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AVTUINSURL *)-[AVTUINSURL initFileURLWithPath:](v4, "initFileURLWithPath:", v5);
    internalURL = self->_internalURL;
    self->_internalURL = v6;

  }
  else
  {
    v5 = self->_internalURL;
    self->_internalURL = 0;
  }

}

- (UIImage)image
{
  return self->_image;
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

- (AVTUINSURL)internalURL
{
  return self->_internalURL;
}

- (void)setInternalURL:(id)a3
{
  objc_storeStrong((id *)&self->_internalURL, a3);
}

- (BOOL)isPrereleaseSticker
{
  return self->_prereleaseSticker;
}

- (void)setPrereleaseSticker:(BOOL)a3
{
  self->_prereleaseSticker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
