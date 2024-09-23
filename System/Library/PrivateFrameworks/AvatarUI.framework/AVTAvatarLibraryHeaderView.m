@implementation AVTAvatarLibraryHeaderView

- (AVTAvatarLibraryHeaderView)initWithFrame:(CGRect)a3
{
  AVTAvatarLibraryHeaderView *v3;
  AVTAvatarLibraryHeaderView *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  uint64_t v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarLibraryHeaderView;
  v3 = -[AVTAvatarLibraryHeaderView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTAvatarLibraryHeaderView bounds](v3, "bounds");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v9 = CGRectGetWidth(v16) + -20.0;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 10.0, 0.0, v9, CGRectGetHeight(v17));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    -[UILabel setAutoresizingMask:](v4->_titleLabel, "setAutoresizingMask:", 18);
    v12 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[AVTAvatarLibraryHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("libraryHeader");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
