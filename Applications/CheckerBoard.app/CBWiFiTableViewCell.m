@implementation CBWiFiTableViewCell

- (CBWiFiTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CBWiFiTableViewCell *v4;
  CBWiFiTableViewCell *v5;
  UIStackView *v6;
  UIStackView *accessoryIcons;
  id v8;
  double y;
  double width;
  double height;
  UIImageView *v12;
  UIImageView *lockView;
  void *v14;
  UIView *v15;
  UIView *hiddenLockView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *rssiBarImages;
  UIImageView *v23;
  UIImageView *rssiBarsView;
  id v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CBWiFiTableViewCell;
  v4 = -[CBWiFiTableViewCell initWithStyle:reuseIdentifier:](&v27, "initWithStyle:reuseIdentifier:", 1, a4);
  v5 = v4;
  if (v4)
  {
    v4->_networkStateChanged = 1;
    v6 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", 0.0, 0.0, 42.0, 24.0);
    accessoryIcons = v5->_accessoryIcons;
    v5->_accessoryIcons = v6;

    -[UIStackView setAlignment:](v5->_accessoryIcons, "setAlignment:", 3);
    -[UIStackView setDistribution:](v5->_accessoryIcons, "setDistribution:", 0);
    -[UIStackView setSpacing:](v5->_accessoryIcons, "setSpacing:", 8.0);
    v5->_showLockIcon = 0;
    v8 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v12 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    lockView = v5->_lockView;
    v5->_lockView = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Lock")));
    -[UIImageView setImage:](v5->_lockView, "setImage:", v14);

    -[UIImageView setContentMode:](v5->_lockView, "setContentMode:", 6);
    v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 8.0, 11.0);
    hiddenLockView = v5->_hiddenLockView;
    v5->_hiddenLockView = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("WiFiBars0")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("WiFiBars1")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("WiFiBars2")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("WiFiBars3")));
    v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v18, v19, v20, 0));
    rssiBarImages = v5->_rssiBarImages;
    v5->_rssiBarImages = (NSArray *)v21;

    v23 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    rssiBarsView = v5->_rssiBarsView;
    v5->_rssiBarsView = v23;

    -[UIImageView setContentMode:](v5->_rssiBarsView, "setContentMode:", 6);
    v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 42.0, 24.0);
    objc_msgSend(v25, "addSubview:", v5->_accessoryIcons);
    -[CBWiFiTableViewCell setAccessoryView:](v5, "setAccessoryView:", v25);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  double v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CBWiFiTableViewCell;
  -[CBWiFiTableViewCell layoutSubviews](&v21, "layoutSubviews");
  if (-[CBWiFiTableViewCell networkStateChanged](self, "networkStateChanged"))
  {
    -[CBWiFiTableViewCell setNetworkStateChanged:](self, "setNetworkStateChanged:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
    v4 = objc_msgSend(v3, "isHidden");

    if ((v4 & 1) == 0)
    {
      v5 = -[CBWiFiTableViewCell networkScaledRSSIStrength](self, "networkScaledRSSIStrength");
      *(float *)&v6 = v6;
      v7 = WFSignalBarsFromScaledRSSI(v5, *(float *)&v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarImages](self, "rssiBarImages"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
      objc_msgSend(v10, "setImage:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
      objc_msgSend(v11, "sizeToFit");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
    objc_msgSend(v12, "removeFromSuperview");

    if (-[CBWiFiTableViewCell showLockIcon](self, "showLockIcon"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell hiddenLockView](self, "hiddenLockView"));
      objc_msgSend(v13, "removeFromSuperview");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell accessoryIcons](self, "accessoryIcons"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell lockView](self, "lockView"));
      objc_msgSend(v14, "addArrangedSubview:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell lockView](self, "lockView"));
      objc_msgSend(v16, "sizeToFit");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell lockView](self, "lockView"));
      objc_msgSend(v17, "removeFromSuperview");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell accessoryIcons](self, "accessoryIcons"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell hiddenLockView](self, "hiddenLockView"));
      objc_msgSend(v16, "addArrangedSubview:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell accessoryIcons](self, "accessoryIcons"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
    objc_msgSend(v19, "addArrangedSubview:", v20);

  }
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called by table view cell", buf, 2u);
  }

  -[UIImageView removeFromSuperview](self->_lockView, "removeFromSuperview");
  -[UIImageView removeFromSuperview](self->_rssiBarsView, "removeFromSuperview");
  v5.receiver = self;
  v5.super_class = (Class)CBWiFiTableViewCell;
  -[CBWiFiTableViewCell dealloc](&v5, "dealloc");
}

- (void)showPasswordLock:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CBWiFiTableViewCell showLockIcon](self, "showLockIcon") != a3)
  {
    -[CBWiFiTableViewCell setShowLockIcon:](self, "setShowLockIcon:", v3);
    -[CBWiFiTableViewCell setNetworkStateChanged:](self, "setNetworkStateChanged:", 1);
  }
}

- (void)hideRSSIStrength:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiTableViewCell rssiBarsView](self, "rssiBarsView"));
    objc_msgSend(v7, "setHidden:", v3);

    -[CBWiFiTableViewCell setNetworkStateChanged:](self, "setNetworkStateChanged:", 1);
  }
}

- (double)networkScaledRSSIStrength
{
  return self->_networkScaledRSSIStrength;
}

- (void)setNetworkScaledRSSIStrength:(double)a3
{
  self->_networkScaledRSSIStrength = a3;
}

- (BOOL)showLockIcon
{
  return self->_showLockIcon;
}

- (void)setShowLockIcon:(BOOL)a3
{
  self->_showLockIcon = a3;
}

- (UIImageView)lockView
{
  return self->_lockView;
}

- (void)setLockView:(id)a3
{
  objc_storeStrong((id *)&self->_lockView, a3);
}

- (UIImageView)rssiBarsView
{
  return self->_rssiBarsView;
}

- (void)setRssiBarsView:(id)a3
{
  objc_storeStrong((id *)&self->_rssiBarsView, a3);
}

- (UIStackView)accessoryIcons
{
  return self->_accessoryIcons;
}

- (void)setAccessoryIcons:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIcons, a3);
}

- (UIView)hiddenLockView
{
  return self->_hiddenLockView;
}

- (void)setHiddenLockView:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenLockView, a3);
}

- (NSArray)rssiBarImages
{
  return self->_rssiBarImages;
}

- (void)setRssiBarImages:(id)a3
{
  objc_storeStrong((id *)&self->_rssiBarImages, a3);
}

- (BOOL)networkStateChanged
{
  return self->_networkStateChanged;
}

- (void)setNetworkStateChanged:(BOOL)a3
{
  self->_networkStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiBarImages, 0);
  objc_storeStrong((id *)&self->_hiddenLockView, 0);
  objc_storeStrong((id *)&self->_accessoryIcons, 0);
  objc_storeStrong((id *)&self->_rssiBarsView, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
}

@end
