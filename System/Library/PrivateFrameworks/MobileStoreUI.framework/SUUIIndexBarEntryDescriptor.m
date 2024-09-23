@implementation SUUIIndexBarEntryDescriptor

- (unint64_t)hash
{
  int64_t entryDescriptorType;
  unint64_t v4;
  uint64_t v5;

  entryDescriptorType = self->_entryDescriptorType;
  v4 = -[SUUIArtwork hash](self->_artwork, "hash") ^ entryDescriptorType;
  v5 = -[NSAttributedString hash](self->_attributedString, "hash");
  return v4 ^ v5 ^ -[UIImage hash](self->_image, "hash") ^ (unint64_t)(self->_size.width * 1000.0) ^ (unint64_t)(self->_size.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  SUUIIndexBarEntryDescriptor *v4;
  BOOL v5;
  UIImage *image;
  NSAttributedString *attributedString;
  SUUIArtwork *artwork;
  char v9;

  v4 = (SUUIIndexBarEntryDescriptor *)a3;
  if (v4 == self)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v4->_entryDescriptorType != self->_entryDescriptorType
    || (v4->_size.width == self->_size.width ? (v5 = v4->_size.height == self->_size.height) : (v5 = 0),
        !v5
     || (image = v4->_image, image != self->_image) && !-[UIImage isEqual:](image, "isEqual:")
     || (attributedString = v4->_attributedString, attributedString != self->_attributedString)
     && !-[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:")))
  {
    v9 = 0;
    goto LABEL_17;
  }
  artwork = v4->_artwork;
  if (artwork == self->_artwork)
  {
LABEL_16:
    v9 = 1;
    goto LABEL_17;
  }
  v9 = -[SUUIArtwork isEqual:](artwork, "isEqual:");
LABEL_17:

  return v9;
}

+ (id)entryDescriptorWithArtwork:(id)a3
{
  id v3;
  SUUIIndexBarEntryDescriptor *v4;

  v3 = a3;
  v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  -[SUUIIndexBarEntryDescriptor setEntryDescriptorType:](v4, "setEntryDescriptorType:", 2);
  -[SUUIIndexBarEntryDescriptor setArtwork:](v4, "setArtwork:", v3);

  return v4;
}

+ (id)entryDescriptorWithAttributedString:(id)a3
{
  id v3;
  SUUIIndexBarEntryDescriptor *v4;

  v3 = a3;
  v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  -[SUUIIndexBarEntryDescriptor setEntryDescriptorType:](v4, "setEntryDescriptorType:", 1);
  -[SUUIIndexBarEntryDescriptor setAttributedString:](v4, "setAttributedString:", v3);

  return v4;
}

+ (id)entryDescriptorWithImage:(id)a3
{
  id v3;
  SUUIIndexBarEntryDescriptor *v4;

  v3 = a3;
  v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  -[SUUIIndexBarEntryDescriptor setEntryDescriptorType:](v4, "setEntryDescriptorType:", 3);
  -[SUUIIndexBarEntryDescriptor setImage:](v4, "setImage:", v3);

  return v4;
}

+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3
{
  double height;
  double width;
  SUUIIndexBarEntryDescriptor *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  -[SUUIIndexBarEntryDescriptor setEntryDescriptorType:](v5, "setEntryDescriptorType:", 0);
  -[SUUIIndexBarEntryDescriptor setSize:](v5, "setSize:", width, height);
  return v5;
}

- (void)setArtwork:(id)a3
{
  SUUIArtwork *v5;
  SUUIArtwork *artwork;
  BOOL v7;
  CGFloat v8;
  CGFloat v9;
  SUUIArtwork *v10;

  v5 = (SUUIArtwork *)a3;
  artwork = self->_artwork;
  if (artwork != v5)
  {
    v10 = v5;
    v7 = -[SUUIArtwork isEqual:](artwork, "isEqual:", v5);
    v5 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_artwork, a3);
      -[SUUIArtwork size](self->_artwork, "size");
      v5 = v10;
      self->_size.width = v8;
      self->_size.height = v9;
    }
  }

}

- (void)setAttributedString:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedString;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  CGFloat v9;
  CGFloat v10;
  NSAttributedString *v11;

  v4 = (NSAttributedString *)a3;
  attributedString = self->_attributedString;
  if (attributedString != v4)
  {
    v11 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v11, "copy");
      v8 = self->_attributedString;
      self->_attributedString = v7;

      -[NSAttributedString size](self->_attributedString, "size");
      v4 = v11;
      self->_size.width = v9;
      self->_size.height = v10;
    }
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *image;
  char v7;
  CGFloat v8;
  CGFloat v9;
  UIImage *v10;

  v5 = (UIImage *)a3;
  image = self->_image;
  if (image != v5)
  {
    v10 = v5;
    v7 = -[UIImage isEqual:](image, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      -[UIImage size](self->_image, "size");
      v5 = v10;
      self->_size.width = v8;
      self->_size.height = v9;
    }
  }

}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryDescriptorType
{
  return self->_entryDescriptorType;
}

- (void)setEntryDescriptorType:(int64_t)a3
{
  self->_entryDescriptorType = a3;
}

- (SUUIArtwork)artwork
{
  return self->_artwork;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
