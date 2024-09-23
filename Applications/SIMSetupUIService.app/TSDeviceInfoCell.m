@implementation TSDeviceInfoCell

- (TSDeviceInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSDeviceInfoCell *v4;
  TSDeviceInfoCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDeviceInfoCell;
  v4 = -[TSDeviceInfoCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell contentView](v5, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](v5, "imageView"));
    objc_msgSend(v8, "addSubview:", v9);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDeviceInfoCell;
  -[TSDeviceInfoCell layoutSubviews](&v8, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](self, "imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell contentView](self, "contentView"));
  objc_msgSend(v4, "bounds");
  v6 = v5 * 0.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](self, "imageView"));
  objc_msgSend(v7, "center");
  objc_msgSend(v3, "setCenter:", v6);

}

@end
