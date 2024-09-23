@implementation QuickLookContentEditorBannerConfiguration

+ (id)configurationWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 primaryAction:(id)a6 dismissAction:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setImage:", v15);

  objc_msgSend(v16, "setTitle:", v14);
  objc_msgSend(v16, "setSubtitle:", v13);

  objc_msgSend(v16, "setPrimaryAction:", v12);
  objc_msgSend(v16, "setDismissAction:", v11);

  return v16;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (void)setPrimaryAction:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAction, a3);
}

- (UIAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
