@implementation CPSAppAttributionBanner

+ (ISImageDescriptor)preferredImageDescriptor
{
  id v2;
  void *v3;
  double v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = (void *)objc_msgSend(v2, "initWithSize:scale:", 48.0, 48.0, v4);

  objc_msgSend(v5, "setShape:", 1);
  return (ISImageDescriptor *)v5;
}

- (CPSAppAttributionBanner)init
{
  void *v3;
  CPSAppAttributionBanner *v4;
  CPSAppAttributionBanner *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v7.receiver = self;
  v7.super_class = (Class)CPSAppAttributionBanner;
  v4 = -[CPSAppAttributionBanner initWithFrame:](&v7, sel_initWithFrame_);

  if (v4)
  {
    -[CPSAppAttributionBanner commonInit](v4, "commonInit");
    v5 = v4;
  }

  return v4;
}

- (CPSAppAttributionBanner)initWithFrame:(CGRect)a3
{
  CPSAppAttributionBanner *v3;
  CPSAppAttributionBanner *v4;
  CPSAppAttributionBanner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppAttributionBanner;
  v3 = -[CPSAppAttributionBanner initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPSAppAttributionBanner commonInit](v3, "commonInit");
    v5 = v4;
  }

  return v4;
}

- (CPSAppAttributionBanner)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSAppAttributionBanner initWithCoder:] is not available."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)commonInit
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0512000, log, OS_LOG_TYPE_ERROR, "Could not load CPSAppAttributionBanner nib!", v1, 2u);
}

- (void)_handleTap:(id)a3
{
  void (**tapAction)(void);

  tapAction = (void (**)(void))self->_tapAction;
  if (tapAction)
    tapAction[2]();
}

- (UIImage)icon
{
  return -[UIImageView image](self->_iconView, "image");
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_iconView, "setImage:", a3);
}

- (NSString)title
{
  return (NSString *)-[CPSLabelWithPlaceholder text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  id v4;

  -[CPSLabelWithPlaceholder setText:](self->_titleLabel, "setText:", a3);
  -[CPSLabelWithPlaceholder text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSLabelWithPlaceholder setPlaceholderWidth:](self->_subtitleLabel, "setPlaceholderWidth:", fmax(fmin((double)(unint64_t)(5 * objc_msgSend(v4, "length")), 200.0), 50.0));

}

- (NSString)subtitle
{
  return (NSString *)-[CPSLabelWithPlaceholder text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[CPSLabelWithPlaceholder setText:](self->_subtitleLabel, "setText:", a3);
}

- (NSString)supertitle
{
  return -[UILabel text](self->_supertitleLabel, "text");
}

- (void)setSupertitle:(id)a3
{
  -[UILabel setText:](self->_supertitleLabel, "setText:", a3);
}

- (void)setShowsAppStoreButton:(BOOL)a3
{
  -[CPSAppStoreButton setHidden:](self->_appStoreButton, "setHidden:", !a3);
}

- (BOOL)showsAppStoreButton
{
  return -[CPSAppStoreButton isHidden](self->_appStoreButton, "isHidden") ^ 1;
}

- (id)tapAction
{
  return self->_tapAction;
}

- (void)setTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_supertitleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
