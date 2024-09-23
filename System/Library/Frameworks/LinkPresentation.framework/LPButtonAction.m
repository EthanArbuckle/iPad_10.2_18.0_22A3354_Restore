@implementation LPButtonAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setTitle:", v8);
  objc_msgSend(v11, "setImage:", v9);
  objc_msgSend(v11, "setHandler:", v10);

  return v11;
}

- (NSString)visibleTitle
{
  NSString *visibleTitle;

  visibleTitle = self->_visibleTitle;
  if (!visibleTitle)
    visibleTitle = self->_title;
  return visibleTitle;
}

- (LPImage)visibleImage
{
  LPImage *visibleImage;

  visibleImage = self->_visibleImage;
  if (!visibleImage)
    visibleImage = self->_image;
  return visibleImage;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setVisibleTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setVisibleImage:(id)a3
{
  objc_storeStrong((id *)&self->_visibleImage, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHeader
{
  return self->_header;
}

- (void)setHeader:(BOOL)a3
{
  self->_header = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_visibleImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visibleTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
