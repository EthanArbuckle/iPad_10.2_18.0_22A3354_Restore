@implementation FMRule

+ (id)imageWithColor:(id)a3 leading:(BOOL)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Must be subclassed"));
  return 0;
}

- (FMRule)initWithFrame:(CGRect)a3
{
  FMRule *v3;
  FMRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMRule;
  v3 = -[FMRule initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FMRule commonSetup](v3, "commonSetup");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRule;
  -[FMRule awakeFromNib](&v3, sel_awakeFromNib);
  -[FMRule commonSetup](self, "commonSetup");
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRule;
  -[FMRule prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[FMRule commonSetup](self, "commonSetup");
}

- (void)commonSetup
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[FMRule bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[FMRule setImageView:](self, "setImageView:", v4);

  -[FMRule imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMRule addSubview:](self, "addSubview:", v5);

  v6 = (void *)objc_opt_class();
  -[FMRule color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithColor:leading:", v7, -[FMRule leading](self, "leading"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[FMRule imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

}

- (void)setColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_color, a3);
  v4 = (void *)objc_opt_class();
  -[FMRule color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithColor:leading:", v5, -[FMRule leading](self, "leading"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FMRule imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

}

- (void)setLeading:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_leading = a3;
  v4 = (void *)objc_opt_class();
  -[FMRule color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithColor:leading:", v5, -[FMRule leading](self, "leading"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FMRule imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

}

- (BOOL)leading
{
  return self->_leading;
}

- (UIColor)color
{
  return self->_color;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
