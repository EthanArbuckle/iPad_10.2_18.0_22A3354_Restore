@implementation CPUIMessageCellConfiguration

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11
{
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = 1;
  LOBYTE(v12) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:unread:showsPin:showsStar:showsMute:trailingText:trailingImage:enabled:", a3, a4, a5, a6, a7, a8, v12, a10, a11, v13);
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11 enabled:(BOOL)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v24;

  v24 = a8;
  v12 = a7;
  v13 = a6;
  v17 = a11;
  v18 = a10;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(v22, "setDetailText:", v20);
  objc_msgSend(v22, "setImage:", v19);

  objc_msgSend(v22, "setUnread:", v13);
  objc_msgSend(v22, "setTrailingText:", v18);

  objc_msgSend(v22, "setTrailingImage:", v17);
  objc_msgSend(v22, "setShowsPin:", v12);
  objc_msgSend(v22, "setShowsStar:", v24);
  objc_msgSend(v22, "setShowsMute:", a9);
  objc_msgSend(v22, "setEnabled:", a12);
  return v22;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)trailingImage
{
  return self->_trailingImage;
}

- (void)setTrailingImage:(id)a3
{
  objc_storeStrong((id *)&self->_trailingImage, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void)setUnread:(BOOL)a3
{
  self->_unread = a3;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (void)setTrailingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)showsPin
{
  return self->_showsPin;
}

- (void)setShowsPin:(BOOL)a3
{
  self->_showsPin = a3;
}

- (BOOL)showsStar
{
  return self->_showsStar;
}

- (void)setShowsStar:(BOOL)a3
{
  self->_showsStar = a3;
}

- (BOOL)showsMute
{
  return self->_showsMute;
}

- (void)setShowsMute:(BOOL)a3
{
  self->_showsMute = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
