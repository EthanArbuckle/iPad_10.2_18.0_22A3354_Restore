@implementation ICImageAndMovieThumbnailView

- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3 showMovieDuration:(BOOL)a4
{
  ICImageAndMovieThumbnailView *v5;
  ICImageAndMovieThumbnailView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICImageAndMovieThumbnailView;
  v5 = -[ICImageAndMovieThumbnailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_showMovieDuration = a4;
    -[ICImageAndMovieThumbnailView commonInit](v5, "commonInit");
  }
  return v6;
}

- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3
{
  return -[ICImageAndMovieThumbnailView initWithFrame:showMovieDuration:](self, "initWithFrame:showMovieDuration:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICImageAndMovieThumbnailView)initWithCoder:(id)a3
{
  ICImageAndMovieThumbnailView *v3;
  ICImageAndMovieThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICImageAndMovieThumbnailView;
  v3 = -[ICImageAndMovieThumbnailView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_showMovieDuration = 0;
    -[ICImageAndMovieThumbnailView commonInit](v3, "commonInit");
  }
  return v4;
}

- (void)commonInit
{
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ICImageAndMovieThumbnailView setHairlineLayers:](self, "setHairlineLayers:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ICImageAndMovieThumbnailView setHairlineColors:](self, "setHairlineColors:", v4);

  -[ICImageAndMovieThumbnailView setMininumScaleFactor:](self, "setMininumScaleFactor:", 1.0);
  -[ICImageAndMovieThumbnailView setForceSquareImageAspectRatio:](self, "setForceSquareImageAspectRatio:", 0);
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[ICImageAndMovieThumbnailView frame](self, "frame");
  v7 = v6;
  -[ICImageAndMovieThumbnailView frame](self, "frame");
  v8 = (void *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  -[ICImageAndMovieThumbnailView setImageView:](self, "setImageView:", v8);

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentMode:", 2);

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView addSubview:](self, "addSubview:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 5, 0, self, 5, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView setImageViewLeftLayoutConstraint:](self, "setImageViewLeftLayoutConstraint:", v15);

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 6, 0, v17, 6, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView setImageViewRightLayoutConstraint:](self, "setImageViewRightLayoutConstraint:", v18);

  v19 = (void *)MEMORY[0x1E0CB3718];
  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 0, self, 3, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView setImageViewTopLayoutConstraint:](self, "setImageViewTopLayoutConstraint:", v21);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v23, 4, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView setImageViewBottomLayoutConstraint:](self, "setImageViewBottomLayoutConstraint:", v24);

  -[ICImageAndMovieThumbnailView imageViewLeftLayoutConstraint](self, "imageViewLeftLayoutConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v25;
  -[ICImageAndMovieThumbnailView imageViewRightLayoutConstraint](self, "imageViewRightLayoutConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v26;
  -[ICImageAndMovieThumbnailView imageViewTopLayoutConstraint](self, "imageViewTopLayoutConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v27;
  -[ICImageAndMovieThumbnailView imageViewBottomLayoutConstraint](self, "imageViewBottomLayoutConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  if (-[ICImageAndMovieThumbnailView showAsMovie](self, "showAsMovie"))
    -[ICImageAndMovieThumbnailView setupMovieFooter](self, "setupMovieFooter");

}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICImageAndMovieThumbnailView;
  -[ICImageAndMovieThumbnailView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (-[ICImageAndMovieThumbnailView usesSeparateLayersForHairlines](self, "usesSeparateLayersForHairlines"))
    -[ICImageAndMovieThumbnailView updateHairlineFrames](self, "updateHairlineFrames");
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImageScaling:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (self->_imageScaling != a3)
  {
    self->_imageScaling = a3;
    switch(a3)
    {
      case 2uLL:
        -[ICImageAndMovieThumbnailView imageView](self, "imageView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 1;
        goto LABEL_9;
      case 1uLL:
        -[ICImageAndMovieThumbnailView imageView](self, "imageView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 2;
        goto LABEL_9;
      case 0uLL:
        -[ICImageAndMovieThumbnailView imageView](self, "imageView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 4;
LABEL_9:
        objc_msgSend(v3, "setContentMode:", v4);

        break;
    }
  }
}

- (double)imageInset
{
  void *v2;
  double v3;
  double v4;

  -[ICImageAndMovieThumbnailView imageViewLeftLayoutConstraint](self, "imageViewLeftLayoutConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setImageInset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICImageAndMovieThumbnailView imageViewLeftLayoutConstraint](self, "imageViewLeftLayoutConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", a3);

  -[ICImageAndMovieThumbnailView imageViewRightLayoutConstraint](self, "imageViewRightLayoutConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", a3);

  -[ICImageAndMovieThumbnailView imageViewTopLayoutConstraint](self, "imageViewTopLayoutConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", a3);

  -[ICImageAndMovieThumbnailView imageViewBottomLayoutConstraint](self, "imageViewBottomLayoutConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", a3);

}

- (void)setupMovieFooter
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ICLabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[ICImageAndMovieThumbnailView setMovieFooter:](self, "setMovieFooter:", v8);

  v9 = -[ICImageAndMovieThumbnailView showAsMovie](self, "showAsMovie") ^ 1;
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  if (-[ICImageAndMovieThumbnailView showMovieDuration](self, "showMovieDuration"))
  {
    v11 = -[ICLabel initWithFrame:]([ICLabel alloc], "initWithFrame:", v4, v5, v6, v7);
    -[ICImageAndMovieThumbnailView setMovieDurationLabel:](self, "setMovieDurationLabel:", v11);

    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setString:", CFSTR("0"));

    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    if (-[UIView ic_isRTL](self, "ic_isRTL"))
      v16 = 0;
    else
      v16 = 2;
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", v16);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_fontWithSingleLineA");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_thumb_video_gradient"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v22);

  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v21);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[ICImageAndMovieThumbnailView showMovieDuration](self, "showMovieDuration"))
  {
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v27) = 1144750080;
  objc_msgSend(v24, "setContentHuggingPriority:forAxis:", 0, v27);
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v24);

  if (-[ICImageAndMovieThumbnailView showMovieDuration](self, "showMovieDuration"))
  {
    -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

  }
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView addSubview:](self, "addSubview:", v31);

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_thumb_video_camera_icon"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v32);

  v33 = (void *)objc_opt_new();
  v34 = (void *)MEMORY[0x1E0CB3718];
  v74 = CFSTR("movieFooter");
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[movieFooter]|"), 0, 0, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v37);

  v38 = (void *)MEMORY[0x1E0CB3718];
  v72 = CFSTR("movieFooter");
  -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[movieFooter(18)]|"), 0, 0, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v41);

  v42 = (void *)MEMORY[0x1E0CB3718];
  v70 = CFSTR("movieFooterBackground");
  v71 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[movieFooterBackground]|"), 0, 0, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v44);

  v45 = (void *)MEMORY[0x1E0CB3718];
  v68 = CFSTR("movieFooterBackground");
  v69 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[movieFooterBackground]|"), 0, 0, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v47);

  v48 = -[ICImageAndMovieThumbnailView showMovieDuration](self, "showMovieDuration");
  v49 = (void *)MEMORY[0x1E0CB3718];
  if (v48)
  {
    v66[0] = CFSTR("cameraIcon");
    v66[1] = CFSTR("movieDurationLabel");
    v67[0] = v24;
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-6-[cameraIcon]-1-[movieDurationLabel]-6-|"), 0, 0, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v52);

    v53 = (void *)MEMORY[0x1E0CB3718];
    v64 = CFSTR("movieDurationLabel");
    -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v54;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[movieDurationLabel]-1-|"), 0, 0, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v56);

  }
  else
  {
    v62 = CFSTR("cameraIcon");
    v63 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-6-[cameraIcon]"), 0, 0, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v55);
  }

  v57 = (void *)MEMORY[0x1E0CB3718];
  v60 = CFSTR("cameraIcon");
  v61 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[cameraIcon]|"), 0, 0, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v59);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
}

- (void)setShowAsMovie:(BOOL)a3
{
  void *v4;

  if (self->_showAsMovie != a3)
  {
    self->_showAsMovie = a3;
    if (a3)
    {
      -[ICImageAndMovieThumbnailView setupMovieFooter](self, "setupMovieFooter");
    }
    else
    {
      -[ICImageAndMovieThumbnailView movieFooter](self, "movieFooter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      -[ICImageAndMovieThumbnailView setMovieFooter:](self, "setMovieFooter:", 0);
    }
  }
}

- (void)setMovieDuration:(id *)a3
{
  __int128 v5;
  NSObject *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  CMTime time1;

  if (-[ICImageAndMovieThumbnailView showMovieDuration](self, "showMovieDuration"))
  {
    time1 = (CMTime)self->_movieDuration;
    v7 = *a3;
    if (CMTimeCompare(&time1, (CMTime *)&v7))
    {
      v5 = *(_OWORD *)&a3->var0;
      self->_movieDuration.epoch = a3->var3;
      *(_OWORD *)&self->_movieDuration.value = v5;
      -[ICImageAndMovieThumbnailView updateDurationLabel](self, "updateDurationLabel");
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICImageAndMovieThumbnailView setMovieDuration:].cold.1(v6);

  }
}

- (void)setCornerRadius:(double)a3
{
  void *v4;
  id v5;

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[ICImageAndMovieThumbnailView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (void)setBorderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_borderColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_borderColor, a3);
    -[ICImageAndMovieThumbnailView updateHairline](self, "updateHairline");
    v5 = v6;
  }

}

- (void)setHairlineColor:(id)a3 forEdges:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v21 = a3;
  -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.hairlineColors", "-[ICImageAndMovieThumbnailView setHairlineColor:forEdges:]", 1, 0, CFSTR("hairlineColors not initialized"));
  -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICImageAndMovieThumbnailView setHairlineColors:](self, "setHairlineColors:", v8);

  }
  v9 = 0;
  v10 = 0;
  do
  {
    while (1)
    {
      v11 = ICRectEdgeAtIndex();
      if ((v11 & a4) == 0)
        break;
      v12 = v11;
      -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v21);

      if (v16)
        break;
      v17 = (void *)objc_msgSend(v21, "copy");
      -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

      v10 = 1;
      if (v9++ == 3)
        goto LABEL_14;
    }
    ++v9;
  }
  while (v9 != 4);
  if ((v10 & 1) == 0)
    goto LABEL_15;
LABEL_14:
  -[ICImageAndMovieThumbnailView updateHairline](self, "updateHairline");
LABEL_15:

}

- (void)setHairlineEdges:(unint64_t)a3
{
  if (self->_hairlineEdges != a3)
  {
    self->_hairlineEdges = a3;
    -[ICImageAndMovieThumbnailView updateHairline](self, "updateHairline");
  }
}

- (void)setEdgesToRemoveStartPoint:(unint64_t)a3
{
  if (self->_edgesToRemoveStartPoint != a3)
  {
    self->_edgesToRemoveStartPoint = a3;
    -[ICImageAndMovieThumbnailView updateHairline](self, "updateHairline");
  }
}

- (void)setEdgesToRemoveEndPoint:(unint64_t)a3
{
  if (self->_edgesToRemoveEndPoint != a3)
  {
    self->_edgesToRemoveEndPoint = a3;
    -[ICImageAndMovieThumbnailView updateHairline](self, "updateHairline");
  }
}

- (void)updateDurationLabel
{
  void *v3;
  ICMediaTime *v4;
  ICMediaTime *v5;
  void *v6;
  void *v7;
  _BYTE v8[24];

  +[ICMediaTimeFormatter timecodeFormatter](ICMediaTimeFormatter, "timecodeFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ICMediaTime alloc];
  -[ICImageAndMovieThumbnailView movieDuration](self, "movieDuration");
  v5 = -[ICMediaTime initWithCMTime:](v4, "initWithCMTime:", v8);
  objc_msgSend(v3, "stringForObjectValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAndMovieThumbnailView movieDurationLabel](self, "movieDurationLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", v6);

}

- (BOOL)usesSeparateLayersForHairlines
{
  void *v3;
  BOOL v4;

  if (!-[ICImageAndMovieThumbnailView hairlineEdges](self, "hairlineEdges"))
    return 0;
  if (-[ICImageAndMovieThumbnailView hairlineEdges](self, "hairlineEdges") != 15)
    return 1;
  -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)usesSeparateLayerForHairlineEdge:(unint64_t)a3
{
  _BOOL4 v5;

  v5 = -[ICImageAndMovieThumbnailView usesSeparateLayersForHairlines](self, "usesSeparateLayersForHairlines");
  if (v5)
    LOBYTE(v5) = (-[ICImageAndMovieThumbnailView hairlineEdges](self, "hairlineEdges") & a3) != 0;
  return v5;
}

- (id)hairlineLayerForEdge:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[ICImageAndMovieThumbnailView usesSeparateLayerForHairlineEdge:](self, "usesSeparateLayerForHairlineEdge:"))
  {
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "layer", "-[ICImageAndMovieThumbnailView hairlineLayerForEdge:]", 1, 0, CFSTR("No layer found for edge %lu"), a3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateHairline
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[ICImageAndMovieThumbnailView borderColor](self, "borderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICImageAndMovieThumbnailView borderColor](self, "borderColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[ICImageAndMovieThumbnailView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", v5);

LABEL_3:
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    v8 = v7;
    -[ICImageAndMovieThumbnailView layer](self, "layer");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBorderWidth:", v8);

    return;
  }
  if (-[ICImageAndMovieThumbnailView hairlineEdges](self, "hairlineEdges")
    && (-[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10))
  {
    if (!-[ICImageAndMovieThumbnailView usesSeparateLayersForHairlines](self, "usesSeparateLayersForHairlines"))
    {
      -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allValues");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v49 = objc_msgSend(v48, "CGColor");
      -[ICImageAndMovieThumbnailView layer](self, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setBorderColor:", v49);

      goto LABEL_3;
    }
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.hairlineLayers", "-[ICImageAndMovieThumbnailView updateHairline]", 1, 0, CFSTR("hairlineLayers not initialized"));
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[ICImageAndMovieThumbnailView setHairlineLayers:](self, "setHairlineLayers:", v13);

    }
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 <= 3)
    {
      do
      {
        -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "count");

        v17 = ICRectEdgeAtIndex();
        v18 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        objc_msgSend(v18, "setZPosition:", 1.0);
        -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

        -[ICImageAndMovieThumbnailView layer](self, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSublayer:", v18);

        -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      while (v23 < 4);
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_opt_class();
          -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ICCheckedDynamicCast();
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICImageAndMovieThumbnailView hairlineColors](self, "hairlineColors");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v29);
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v32, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

          objc_msgSend(v32, "setHidden:", -[ICImageAndMovieThumbnailView usesSeparateLayerForHairlineEdge:](self, "usesSeparateLayerForHairlineEdge:", objc_msgSend(v29, "unsignedIntegerValue")) ^ 1);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v26);
    }

    -[ICImageAndMovieThumbnailView updateHairlineFrames](self, "updateHairlineFrames");
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v53 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_opt_class();
          -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          ICCheckedDynamicCast();
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "removeFromSuperlayer");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v37);
    }

    -[ICImageAndMovieThumbnailView hairlineLayers](self, "hairlineLayers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "removeAllObjects");

  }
  -[ICImageAndMovieThumbnailView layer](self, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBorderColor:", 0);

  -[ICImageAndMovieThumbnailView layer](self, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBorderWidth:", 0.0);

}

- (double)backingScale
{
  double v2;
  double v3;
  double result;

  -[UIView ic_backingScaleFactor](self, "ic_backingScaleFactor");
  v3 = v2;
  if (v2 <= 0.0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "scale > 0.0", "-[ICImageAndMovieThumbnailView backingScale]", 1, 0, CFSTR("Invalid scale %f"), *(_QWORD *)&v2);
  result = 1.0;
  if (v3 > 0.0)
    return v3;
  return result;
}

- (double)hairlineWidthInPoint
{
  double result;

  if (-[ICImageAndMovieThumbnailView hairlineWidthUnitIsInPoint](self, "hairlineWidthUnitIsInPoint"))
    return 1.0;
  -[ICImageAndMovieThumbnailView pixelWidth](self, "pixelWidth");
  return result;
}

- (void)setHairlineWidthUnitIsInPoint:(BOOL)a3
{
  if (self->_hairlineWidthUnitIsInPoint != a3)
  {
    self->_hairlineWidthUnitIsInPoint = a3;
    -[ICImageAndMovieThumbnailView updateHairlineFrames](self, "updateHairlineFrames");
  }
}

- (double)pixelWidth
{
  double v2;

  -[ICImageAndMovieThumbnailView backingScale](self, "backingScale");
  return 1.0 / v2;
}

- (CGRect)frameByApplyingVerticalReductionTo:(CGRect)a3 edge:(unint64_t)a4
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((-[ICImageAndMovieThumbnailView edgesToRemoveStartPoint](self, "edgesToRemoveStartPoint") & a4) != 0)
    height = height + -1.0;
  v10 = -[ICImageAndMovieThumbnailView edgesToRemoveEndPoint](self, "edgesToRemoveEndPoint");
  v11 = y + 1.0;
  v12 = height + -1.0;
  if ((v10 & a4) == 0)
  {
    v12 = height;
    v11 = y;
  }
  v13 = fmax(v12, 1.0);
  v14 = x;
  v15 = width;
  result.size.height = v13;
  result.size.width = v15;
  result.origin.y = v11;
  result.origin.x = v14;
  return result;
}

- (CGRect)frameByApplyingHorizontalReductionTo:(CGRect)a3 edge:(unint64_t)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[ICImageAndMovieThumbnailView edgesToRemoveStartPoint](self, "edgesToRemoveStartPoint");
  if ((v10 & a4) != 0)
    v11 = width + -1.0;
  else
    v11 = width;
  if ((v10 & a4) != 0)
    v12 = x + 1.0;
  else
    v12 = x;
  v13 = -[ICImageAndMovieThumbnailView edgesToRemoveEndPoint](self, "edgesToRemoveEndPoint", x + 1.0);
  v14 = v11 + -1.0;
  if ((v13 & a4) == 0)
    v14 = v11;
  v15 = fmax(v14, 1.0);
  v16 = v12;
  v17 = y;
  v18 = height;
  result.size.height = v18;
  result.size.width = v15;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateHairlineFrames
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double MaxX;
  double v17;
  void *v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;

  -[ICImageAndMovieThumbnailView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[ICImageAndMovieThumbnailView hairlineLayerForEdge:](self, "hairlineLayerForEdge:", 2);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    -[ICImageAndMovieThumbnailView frameByApplyingVerticalReductionTo:edge:](self, "frameByApplyingVerticalReductionTo:edge:", 2, v5, v7, v12, v11);
    objc_msgSend(v27, "setFrame:");
  }
  -[ICImageAndMovieThumbnailView hairlineLayerForEdge:](self, "hairlineLayerForEdge:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    v15 = v14;
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    MaxX = CGRectGetMaxX(v28);
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    -[ICImageAndMovieThumbnailView frameByApplyingVerticalReductionTo:edge:](self, "frameByApplyingVerticalReductionTo:edge:", 8, MaxX - v17, v7, v15, v11);
    objc_msgSend(v13, "setFrame:");
  }
  -[ICImageAndMovieThumbnailView hairlineLayerForEdge:](self, "hairlineLayerForEdge:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    v20 = v19;
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    MaxY = CGRectGetMaxY(v29);
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    v23 = MaxY - v22;
    objc_msgSend(v18, "setFrame:", v5, v23, v9, v20);
    -[ICImageAndMovieThumbnailView frameByApplyingHorizontalReductionTo:edge:](self, "frameByApplyingHorizontalReductionTo:edge:", 1, v5, v23, v9, v20);
    objc_msgSend(v18, "setFrame:");
  }
  -[ICImageAndMovieThumbnailView hairlineLayerForEdge:](self, "hairlineLayerForEdge:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICImageAndMovieThumbnailView hairlineWidthInPoint](self, "hairlineWidthInPoint");
    v26 = v25;
    objc_msgSend(v24, "setFrame:", v5, v7, v9, v25);
    -[ICImageAndMovieThumbnailView frameByApplyingHorizontalReductionTo:edge:](self, "frameByApplyingHorizontalReductionTo:edge:", 4, v5, v7, v9, v26);
    objc_msgSend(v24, "setFrame:");
  }

}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (BOOL)showAsMovie
{
  return self->_showAsMovie;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 544);
  return self;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (BOOL)hairlineWidthUnitIsInPoint
{
  return self->_hairlineWidthUnitIsInPoint;
}

- (unint64_t)hairlineEdges
{
  return self->_hairlineEdges;
}

- (unint64_t)edgesToRemoveStartPoint
{
  return self->_edgesToRemoveStartPoint;
}

- (unint64_t)edgesToRemoveEndPoint
{
  return self->_edgesToRemoveEndPoint;
}

- (double)mininumScaleFactor
{
  return self->_mininumScaleFactor;
}

- (void)setMininumScaleFactor:(double)a3
{
  self->_mininumScaleFactor = a3;
}

- (BOOL)forceSquareImageAspectRatio
{
  return self->_forceSquareImageAspectRatio;
}

- (void)setForceSquareImageAspectRatio:(BOOL)a3
{
  self->_forceSquareImageAspectRatio = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSLayoutConstraint)imageViewLeftLayoutConstraint
{
  return self->_imageViewLeftLayoutConstraint;
}

- (void)setImageViewLeftLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLeftLayoutConstraint, a3);
}

- (NSLayoutConstraint)imageViewRightLayoutConstraint
{
  return self->_imageViewRightLayoutConstraint;
}

- (void)setImageViewRightLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewRightLayoutConstraint, a3);
}

- (NSLayoutConstraint)imageViewBottomLayoutConstraint
{
  return self->_imageViewBottomLayoutConstraint;
}

- (void)setImageViewBottomLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewBottomLayoutConstraint, a3);
}

- (NSLayoutConstraint)imageViewTopLayoutConstraint
{
  return self->_imageViewTopLayoutConstraint;
}

- (void)setImageViewTopLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewTopLayoutConstraint, a3);
}

- (UIView)movieFooter
{
  return self->_movieFooter;
}

- (void)setMovieFooter:(id)a3
{
  objc_storeStrong((id *)&self->_movieFooter, a3);
}

- (ICLabel)movieDurationLabel
{
  return self->_movieDurationLabel;
}

- (void)setMovieDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_movieDurationLabel, a3);
}

- (NSMutableDictionary)hairlineLayers
{
  return self->_hairlineLayers;
}

- (void)setHairlineLayers:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineLayers, a3);
}

- (NSMutableDictionary)hairlineColors
{
  return self->_hairlineColors;
}

- (void)setHairlineColors:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineColors, a3);
}

- (BOOL)showMovieDuration
{
  return self->_showMovieDuration;
}

- (void)setShowMovieDuration:(BOOL)a3
{
  self->_showMovieDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColors, 0);
  objc_storeStrong((id *)&self->_hairlineLayers, 0);
  objc_storeStrong((id *)&self->_movieDurationLabel, 0);
  objc_storeStrong((id *)&self->_movieFooter, 0);
  objc_storeStrong((id *)&self->_imageViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewRightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeftLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)setMovieDuration:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Movie duration set on thumbnail view when it is hidden", v1, 2u);
}

@end
