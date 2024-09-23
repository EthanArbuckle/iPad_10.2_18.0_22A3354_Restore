@implementation FAMugshotMarqueeView

- (FAMugshotMarqueeView)initWithCoder:(id)a3
{
  -[FAMugshotMarqueeView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (FAMugshotMarqueeView)initWithFrame:(CGRect)a3
{
  -[FAMugshotMarqueeView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (FAMugshotMarqueeView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4
{
  return -[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:](self, "initWithMemberFilter:profilePictureStore:", 0, a4);
}

- (FAMugshotMarqueeView)initWithMemberFilter:(id)a3 profilePictureStore:(id)a4
{
  id v6;
  id v7;
  FAMugshotMarqueeView *v8;
  uint64_t v9;
  NSMutableDictionary *memberPhotoMap;
  void *v11;
  id membersFilter;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FAMugshotMarqueeView;
  v8 = -[FAMugshotMarqueeView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    v9 = objc_opt_new();
    memberPhotoMap = v8->_memberPhotoMap;
    v8->_memberPhotoMap = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_pictureStore, a4);
    v11 = _Block_copy(v6);
    membersFilter = v8->_membersFilter;
    v8->_membersFilter = v11;

    -[FAProfilePictureStore familyCircle](v8->_pictureStore, "familyCircle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _FALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:].cold.1(v14);

    }
    -[FAMugshotMarqueeView _configureStackView](v8, "_configureStackView");
    -[FAMugshotMarqueeView _configureMarquee](v8, "_configureMarquee");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__profilePictureStoreDidReloadImages_, FAProfilePictureStoreDidReloadImagesNotification, v7);

  }
  return v8;
}

- (double)shadowRadius
{
  return 3.0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 68.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1144750080;
  LODWORD(v4) = 1144750080;
  -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_marquee, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8), v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FAMugshotMarqueeView;
  -[FAMugshotMarqueeView dealloc](&v4, sel_dealloc);
}

- (void)_profilePictureStoreDidReloadImages:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FAMugshotMarqueeView__profilePictureStoreDidReloadImages___block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__FAMugshotMarqueeView__profilePictureStoreDidReloadImages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureMarquee");
}

- (void)_configureMarquee
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int (**membersFilter)(id, void *);
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIStackView arrangedSubviews](self->_marquee, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  -[FAProfilePictureStore profilePicturesWithDiameter:](self->_pictureStore, "profilePicturesWithDiameter:", 68.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAProfilePictureStore familyCircle](self->_pictureStore, "familyCircle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "members");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 1)
  {
    v12 = v10 + 1;
    *(_QWORD *)&v11 = 138412290;
    v24 = v11;
    do
    {
      -[FAProfilePictureStore familyCircle](self->_pictureStore, "familyCircle", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "members");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", (v12 - 2));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      membersFilter = (unsigned int (**)(id, void *))self->_membersFilter;
      if (!membersFilter || membersFilter[2](membersFilter, v15))
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FAMugshotMarqueeView _configureImageWithData:](self, "_configureImageWithData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[FAMugshotMarqueeView _configureImageViewWithImage:](self, "_configureImageViewWithImage:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSObject heightAnchor](v19, "heightAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "constraintEqualToConstant:", 68.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setActive:", 1);

          -[NSObject widthAnchor](v19, "widthAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToConstant:", 68.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setActive:", 1);

          -[UIStackView insertArrangedSubview:atIndex:](self->_marquee, "insertArrangedSubview:atIndex:", v19, 0);
        }
        else
        {
          _FALogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = v15;
            _os_log_error_impl(&dword_20DE41000, v19, OS_LOG_TYPE_ERROR, "No member image for %@", buf, 0xCu);
          }
        }

      }
      --v12;
    }
    while (v12 > 1);
  }
  -[FAMugshotMarqueeView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_configureStackView
{
  id v3;
  UIStackView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIStackView *marquee;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD978]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v4, "setAxis:", 0);
  -[UIStackView setDistribution:](v4, "setDistribution:", 4);
  -[FAMugshotMarqueeView addSubview:](self, "addSubview:", v4);
  -[UIStackView setSpacing:](v4, "setSpacing:", -24.0);
  -[UIStackView centerYAnchor](v4, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAMugshotMarqueeView centerYAnchor](self, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  -[UIStackView centerXAnchor](v4, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAMugshotMarqueeView centerXAnchor](self, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  -[UIStackView heightAnchor](v4, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAMugshotMarqueeView heightAnchor](self, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v12);
  marquee = self->_marquee;
  self->_marquee = v4;

}

- (id)_configureImageWithData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", a3);
}

- (id)_configureImageViewWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  v3 = (objc_class *)MEMORY[0x24BEBD668];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(v5, "setContentMode:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 34.0);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 2.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  objc_msgSend(v5, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "CGColor");
  objc_msgSend(v5, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowColor:", v13);

  objc_msgSend(v5, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0.25;
  objc_msgSend(v15, "setShadowOpacity:", v16);

  objc_msgSend(v5, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowRadius:", 3.0);

  v18 = *MEMORY[0x24BDBF148];
  v19 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v5, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowOffset:", v18, v19);

  objc_msgSend(v5, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMasksToBounds:", 0);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marquee, 0);
  objc_storeStrong(&self->_membersFilter, 0);
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_memberPhotoMap, 0);
}

+ (id)imageWithMemberFilter:(id)a3 profilePictureStore:(id)a4
{
  id v5;
  id v6;
  FAMugshotMarqueeView *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double MidX;
  id v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = a4;
  v6 = a3;
  v7 = -[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:]([FAMugshotMarqueeView alloc], "initWithMemberFilter:profilePictureStore:", v6, v5);

  -[FAMugshotMarqueeView sizeToFit](v7, "sizeToFit");
  -[FAMugshotMarqueeView frame](v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[FAMugshotMarqueeView shadowRadius](v7, "shadowRadius");
  v17 = -v16;
  -[FAMugshotMarqueeView shadowRadius](v7, "shadowRadius");
  v19 = -v18;
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  v30 = CGRectInset(v29, v17, v19);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  objc_msgSend(v20, "addSubview:", v7);
  objc_msgSend(v20, "bounds");
  MidX = CGRectGetMidX(v31);
  objc_msgSend(v20, "bounds");
  -[FAMugshotMarqueeView setCenter:](v7, "setCenter:", MidX, CGRectGetMidY(v32));
  v22 = objc_alloc(MEMORY[0x24BEBD618]);
  objc_msgSend(v20, "bounds");
  v23 = (void *)objc_msgSend(v22, "initWithBounds:");
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __76__FAMugshotMarqueeView_Snapshot__imageWithMemberFilter_profilePictureStore___block_invoke;
  v27[3] = &unk_24C88BC40;
  v28 = v20;
  v24 = v20;
  objc_msgSend(v23, "imageWithActions:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __76__FAMugshotMarqueeView_Snapshot__imageWithMemberFilter_profilePictureStore___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

- (void)initWithMemberFilter:(os_log_t)log profilePictureStore:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:]";
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "%s has no circle", (uint8_t *)&v1, 0xCu);
}

@end
