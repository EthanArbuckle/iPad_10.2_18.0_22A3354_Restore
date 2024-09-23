@implementation NTKGreenfieldB640CollectionViewCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  _OWORD v42[4];
  uint64_t v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)NTKGreenfieldB640CollectionViewCell;
  -[NTKGreenfieldB640CollectionViewCell layoutSubviews](&v44, sel_layoutSubviews);
  v43 = 0;
  memset(v42, 0, sizeof(v42));
  -[UIImageView frame](self->_watchBandImageView, "frame", _LayoutConstants_50((uint64_t)v42).n128_f64[0]);
  -[UIImageView image](self->_watchBandImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[UIImageView image](self->_watchBandImageView, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = (v10 - v5) * 0.5;

  -[UIImageView setFrame:](self->_watchBandImageView, "setFrame:", v11, 0.0, v5, v8);
  -[UIView frame](self->_faceView, "frame");
  -[UIView frame](self->_faceView, "frame");
  v13 = (v5 - v12) * 0.5;
  -[UIView frame](self->_faceView, "frame");
  v15 = (v8 - v14) * 0.5;
  -[UIView frame](self->_faceView, "frame");
  v17 = v16;
  -[UIView frame](self->_faceView, "frame");
  -[UIView setFrame:](self->_faceView, "setFrame:", v13, v15, v17);
  v18 = v8 + *(double *)v42 + 0.0;
  -[UILabel frame](self->_faceNameLabel, "frame");
  -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;

  -[UILabel sizeThatFits:](self->_faceNameLabel, "sizeThatFits:", v21, 1.79769313e308);
  v23 = v22;
  -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = (v25 - v21) * 0.5;

  -[UILabel setFrame:](self->_faceNameLabel, "setFrame:", v26, v18, v21, v23);
  -[UIImageView frame](self->_selectedCheckImageView, "frame");
  -[UIImageView image](self->_selectedCheckImageView, "image");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "size");
  v29 = v28;

  -[UIImageView image](self->_selectedCheckImageView, "image");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v31;

  -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v34;
  -[UIImageView image](self->_selectedCheckImageView, "image");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "size");
  v38 = (v35 - v37) * 0.5;

  -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = v40 - v32 - *((double *)v42 + 1);

  -[UIImageView setFrame:](self->_selectedCheckImageView, "setFrame:", v38, v41, v29, v32);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKGreenfieldB640CollectionViewCell;
  -[NTKGreenfieldB640CollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIView removeFromSuperview](self->_faceView, "removeFromSuperview");
}

- (void)_populateWithDecodedRecipe:(id)a3 bandImage:(id)a4 shouldPresentFaceName:(BOOL)a5 shouldPresentCheckmark:(BOOL)a6 isSelected:(BOOL)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  double v13;
  UIImageView *v14;
  UIImageView *watchBandImageView;
  void *v16;
  void *v17;
  void *v18;
  NTKFaceViewController *v19;
  id v20;
  NTKFaceViewController *v21;
  UIView *v22;
  UIView *faceView;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  UIView *v30;
  UILabel *v31;
  UILabel *faceNameLabel;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v38 = a7;
  v8 = a5;
  v11 = a3;
  v12 = a4;
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  *(_QWORD *)&v13 = _LayoutConstants_50((uint64_t)&v48).n128_u64[0];
  if (!self->_watchBandImageView)
  {
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    watchBandImageView = self->_watchBandImageView;
    self->_watchBandImageView = v14;

    BPSBackgroundColor();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_watchBandImageView, "setBackgroundColor:", v16);

    -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_watchBandImageView);

    -[UIImageView setImage:](self->_watchBandImageView, "setImage:", v12);
    -[UIImageView setContentMode:](self->_watchBandImageView, "setContentMode:", 1);
  }
  objc_msgSend(v11, "watchFace", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [NTKFaceViewController alloc];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __132__NTKGreenfieldB640CollectionViewCell__populateWithDecodedRecipe_bandImage_shouldPresentFaceName_shouldPresentCheckmark_isSelected___block_invoke;
  v41[3] = &unk_1E6BD9CF8;
  v20 = v18;
  v44 = v49;
  v45 = v50;
  v46 = v51;
  v42 = v20;
  v47 = v52;
  v43 = v48;
  v21 = -[NTKFaceViewController initWithFace:configuration:](v19, "initWithFace:configuration:", v20, v41);
  -[NTKFaceViewController faceView](v21, "faceView");
  v22 = (UIView *)objc_claimAutoreleasedReturnValue();
  faceView = self->_faceView;
  self->_faceView = v22;

  -[UIImageView addSubview:](self->_watchBandImageView, "addSubview:", self->_faceView);
  -[UIImageView image](self->_watchBandImageView, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  v25 = *((double *)&v49 + 1);
  v27 = v26 / *((double *)&v49 + 1);
  -[UIImageView image](self->_watchBandImageView, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "size");
  CGAffineTransformMakeScale(&v40, v27, v29 / v25);
  v30 = self->_faceView;
  v39 = v40;
  -[UIView setTransform:](v30, "setTransform:", &v39);

  if (v8)
  {
    if (!self->_faceNameLabel)
    {
      v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      faceNameLabel = self->_faceNameLabel;
      self->_faceNameLabel = v31;

      -[UILabel setTextAlignment:](self->_faceNameLabel, "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_faceNameLabel, "setTextColor:", v33);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_faceNameLabel, "setFont:", v34);

      -[UILabel setNumberOfLines:](self->_faceNameLabel, "setNumberOfLines:", 0);
      -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addSubview:", self->_faceNameLabel);

    }
    objc_msgSend(v11, "watchFace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "faceSharingName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_faceNameLabel, "setText:", v37);

  }
  self->_shouldPresentCheckmark = a6;
  -[NTKGreenfieldB640CollectionViewCell updateSeletedState:](self, "updateSeletedState:", v38);

}

void __132__NTKGreenfieldB640CollectionViewCell__populateWithDecodedRecipe_bandImage_shouldPresentFaceName_shouldPresentCheckmark_isSelected___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setDataMode:", 3);
  objc_msgSend(v7, "setShouldShowSnapshot:", 1);
  objc_msgSend(v7, "setShowsCanonicalContent:", 1);
  objc_msgSend(v7, "freeze");
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLuxo"))
  {
    objc_msgSend(v3, "screenCornerRadius");
    v5 = v4;
  }
  else
  {
    v5 = *(double *)(a1 + 72);
  }
  objc_msgSend(v7, "faceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

}

- (void)updateSeletedState:(BOOL)a3
{
  UIImageView *v5;
  UIImageView *selectedCheckImageView;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  if (self->_shouldPresentCheckmark)
  {
    if (!self->_selectedCheckImageView)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      selectedCheckImageView = self->_selectedCheckImageView;
      self->_selectedCheckImageView = v5;

      -[NTKGreenfieldB640CollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_selectedCheckImageView);

      -[UIImageView setContentMode:](self->_selectedCheckImageView, "setContentMode:", 0);
    }
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    _LayoutConstants_50((uint64_t)&v12);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6, *(double *)&v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("checkmark.circle.fill");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 2, *(double *)&v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("circle");
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_selectedCheckImageView, "setImage:", v11);

    -[UIImageView setTintColor:](self->_selectedCheckImageView, "setTintColor:", v9);
  }
}

+ (id)reuseIdentifier
{
  return CFSTR("NTKGreenfieldB640CollectionViewCellReuseIdentifier");
}

+ (CGSize)cellSizeForWatchBandImage:(id)a3 watchFaceName:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  CGSize result;

  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size", _LayoutConstants_50((uint64_t)&v22).n128_f64[0]);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 2, *(double *)&v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v15);

  objc_msgSend(v13, "setNumberOfLines:", 0);
  objc_msgSend(v13, "setText:", v5);

  objc_msgSend(v6, "size");
  objc_msgSend(v13, "sizeThatFits:");
  v17 = *((double *)&v22 + 1) + v12 + *((double *)&v22 + 1) + v16 + v8 + *(double *)&v22;
  objc_msgSend(v6, "size");
  v19 = v18;

  v20 = v19;
  v21 = v17;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCheckImageView, 0);
  objc_storeStrong((id *)&self->_faceNameLabel, 0);
  objc_storeStrong((id *)&self->_watchBandImageView, 0);
  objc_storeStrong((id *)&self->_snapshotFaceViewForErrorState, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
}

@end
