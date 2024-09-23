@implementation ICImageAttachmentView

- (void)setShowLoadingImage:(BOOL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
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
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = -[ICImageAttachmentView showLoadingImage](self, "showLoadingImage");
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[ICImageAttachmentView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeholderImageSystemName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "ICLoadingPlaceholderIconSize");
    objc_msgSend(v5, "ic_systemImageNamed:pointSize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
      objc_msgSend(v10, "setContentMode:", 4);
      objc_msgSend((id)objc_opt_class(), "ICLoadingPlaceholderIconColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v11);

      -[ICImageAttachmentView setLoadingImageView:](self, "setLoadingImageView:", v10);
      -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICImageAttachmentView addSubview:](self, "addSubview:", v13);

      v24 = CFSTR("loadingImage");
      -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[loadingImage]-|"), 0, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3718];
      -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 10, 0, self, 10, 1.0, 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v16, "arrayByAddingObject:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v21);

    }
  }
  else
  {
    -[ICImageAttachmentView setShouldShowLoadingImage:](self, "setShouldShowLoadingImage:");
    -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeFromSuperview");

      -[ICImageAttachmentView setLoadingImageView:](self, "setLoadingImageView:", 0);
    }
  }
}

- (UIImageView)loadingImageView
{
  return self->_loadingImageView;
}

- (void)imageDidLoad:(id)a3 shouldFade:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  __int128 v37;
  __int128 v38;

  v4 = a4;
  v6 = a3;
  -[ICImageAttachmentView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
  -[ICImageAttachmentView imageSize](self, "imageSize");
  if (v6)
  {
    -[ICImageAttachmentView setShouldTryToReloadImageIfLoadingFails:](self, "setShouldTryToReloadImageIfLoadingFails:", 0);
    if (-[ICImageAttachmentView shouldUpdateLayoutInImageDidLoad](self, "shouldUpdateLayoutInImageDidLoad"))
    {
      -[ICImageAttachmentView setShouldUpdateLayoutInImageDidLoad:](self, "setShouldUpdateLayoutInImageDidLoad:", 0);
      -[ICImageAttachmentView attachment](self, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "note");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICImageAttachmentView attachment](self, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "rangeForAttachment:", v11);
      v14 = v13;

      LODWORD(v9) = ICInternalSettingsIsTextKit2Enabled();
      -[ICAttachmentView textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if ((_DWORD)v9)
      {
        objc_msgSend(v15, "textLayoutManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ic_textRangeForRange:", v12, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICAttachmentView textView](self, "textView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textLayoutManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "invalidateLayoutForRange:", v18);

      }
      else
      {
        objc_msgSend(v15, "layoutManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "invalidateLayoutForCharacterRange:actualCharacterRange:", v12, v14, 0);

        -[ICAttachmentView textView](self, "textView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layoutManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "invalidateDisplayForCharacterRange:", v12, v14);
      }

    }
    -[ICImageAttachmentView setImage:](self, "setImage:", v6);
    v26 = objc_msgSend(v6, "ic_CGImage");
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContents:", v26);

    switch(objc_msgSend(v6, "imageOrientation"))
    {
      case 1:
        v38 = 0uLL;
        v28 = 0.0;
        v29 = -1.0;
        v30 = 0.0;
        v31 = -1.0;
        break;
      case 2:
        v38 = 0uLL;
        v30 = -1.0;
        v28 = 1.0;
        goto LABEL_17;
      case 3:
        v38 = 0uLL;
        v30 = 1.0;
        v28 = -1.0;
LABEL_17:
        v29 = 0.0;
        goto LABEL_23;
      case 4:
        v38 = 0uLL;
        v31 = -1.0;
        v28 = 0.0;
        v29 = 1.0;
        goto LABEL_20;
      case 5:
        v38 = 0uLL;
        v31 = 1.0;
        v28 = 0.0;
        v29 = -1.0;
LABEL_20:
        v30 = 0.0;
        break;
      case 6:
        v38 = 0uLL;
        v28 = 1.0;
        v29 = 0.0;
        v30 = 1.0;
        goto LABEL_23;
      case 7:
        v38 = 0uLL;
        v28 = -1.0;
        v29 = 0.0;
        v30 = -1.0;
LABEL_23:
        v31 = 0.0;
        break;
      default:
        v31 = *MEMORY[0x1E0C9BAA8];
        v30 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
        v28 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
        v29 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
        v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        break;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v37 = v38;
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v36 = v31;
    *(double *)&v36[1] = v30;
    *(double *)&v36[2] = v28;
    *(double *)&v36[3] = v29;
    objc_msgSend(v32, "setAffineTransform:", v36);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    goto LABEL_25;
  }
  v21 = v7;
  v22 = v8;
  if (-[ICImageAttachmentView shouldTryToReloadImageIfLoadingFails](self, "shouldTryToReloadImageIfLoadingFails"))
  {
    -[ICImageAttachmentView setShouldTryToReloadImageIfLoadingFails:](self, "setShouldTryToReloadImageIfLoadingFails:", 0);
    -[ICImageAttachmentView updateImageInViewIfNecessary](self, "updateImageInViewIfNecessary");
    goto LABEL_32;
  }
  if (v21 != 0.0 && v22 != 0.0)
  {
    -[ICImageAttachmentView setShouldTryToReloadImageIfLoadingFails:](self, "setShouldTryToReloadImageIfLoadingFails:", 0);
    -[ICImageAttachmentView setImage:](self, "setImage:", 0);
    v23 = objc_msgSend(0, "ic_CGImage");
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContents:", v23);

LABEL_25:
    -[ICImageAttachmentView imageContentsGravity](self, "imageContentsGravity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setContentsGravity:", v33);

    if (v6)
    {
      if (v4
        && (-[ICImageAttachmentView ic_backgroundColor](self, "ic_backgroundColor"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            v35))
      {
        -[ICImageAttachmentView animateImageArrival](self, "animateImageArrival");
      }
      else
      {
        -[ICImageAttachmentView setIc_backgroundColor:](self, "setIc_backgroundColor:", 0);
        -[ICImageAttachmentView setShowLoadingImage:](self, "setShowLoadingImage:", 0);
      }
    }
    else
    {
      -[ICImageAttachmentView setupImagePlaceholder](self, "setupImagePlaceholder");
    }
    -[ICImageAttachmentView updateImageSize](self, "updateImageSize");
  }
LABEL_32:

}

- (void)sharedInit:(BOOL)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICImageAttachmentView;
  -[ICAttachmentView sharedInit:](&v19, sel_sharedInit_, a3);
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[ICImageAttachmentView setImageLayer:](self, "setImageLayer:", v5);

    -[ICImageAttachmentView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 0);

    -[ICImageAttachmentView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v18);

    -[ICImageAttachmentView setClipsToBounds:](self, "setClipsToBounds:", 1);
  }
}

- (void)updateImageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char IsTextKit2Enabled;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v24;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  -[ICImageAttachmentView imageFrame](self, "imageFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v11);

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((IsTextKit2Enabled & 1) != 0)
  {
    objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    return;
  }
  objc_msgSend(v13, "frame");
  if (!TSDNearlyEqualSizes())
  {

    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
LABEL_10:
    if (-[ICAttachmentView finishedInit](self, "finishedInit"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__ICImageAttachmentView_updateImageSize__block_invoke;
      block[3] = &unk_1EA7DD2D8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    return;
  }
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v20 = *MEMORY[0x1E0C9D820];
  v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v17 == v20 && v19 == v21)
    goto LABEL_10;
}

- (CALayer)imageLayer
{
  return (CALayer *)objc_getProperty(self, a2, 536, 1);
}

- (void)setupBorderForLayer:(id)a3
{
  void *v4;
  id v5;
  CGColorSpace *DeviceGray;
  CGColor *v7;
  id v8;
  CGFloat components[3];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ICImageAttachmentView highlightColor](self, "highlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICImageAttachmentView highlightColor](self, "highlightColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v5, "CGColor"));

    objc_msgSend(v8, "setBorderWidth:", *MEMORY[0x1E0D64900]);
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)components = xmmword_1DD9E71B0;
    v7 = CGColorCreate(DeviceGray, components);
    objc_msgSend(v8, "setBorderColor:", v7);
    -[ICImageAttachmentView ic_hairlineWidth](self, "ic_hairlineWidth");
    objc_msgSend(v8, "setBorderWidth:");

    CGColorRelease(v7);
    CGColorSpaceRelease(DeviceGray);
  }
}

- (CGRect)imageFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[ICImageAttachmentView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (v8 != 0.0
    && v3 != 0.0
    && -[ICImageAttachmentView isThumbnailView](self, "isThumbnailView")
    && !-[ICAttachmentView forManualRendering](self, "forManualRendering"))
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
    {
      -[ICImageAttachmentView textAttachment](self, "textAttachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentView textContainer](self, "textContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachmentSizeForTextContainer:", v12);
      v14 = v13;
      v16 = v15;

    }
    else
    {
      -[ICImageAttachmentView attachmentContentSize](self, "attachmentContentSize");
      v14 = v17;
      v16 = v18;
    }
    v19 = (v9 - v14) * 0.5;
    if (v14 < v9)
    {
      v9 = v14;
      v5 = v19;
    }
    v20 = (v10 - v16) * 0.5;
    if (v16 < v10)
    {
      v10 = v16;
      v7 = v20;
    }
  }
  v21 = v5;
  v22 = v7;
  v23 = v9;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)refreshLoadingImage
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  _BOOL4 v7;

  if (!-[ICImageAttachmentView isThumbnailView](self, "isThumbnailView"))
  {
    -[ICImageAttachmentView attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeWidth");
    if (v4 <= 0.0)
    {
      v7 = 0;
    }
    else
    {
      -[ICImageAttachmentView attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sizeHeight");
      v7 = v6 > 0.0;

    }
    -[ICImageAttachmentView setShowLoadingImage:](self, "setShowLoadingImage:", -[ICImageAttachmentView shouldShowLoadingImage](self, "shouldShowLoadingImage") & v7);
  }
}

- (BOOL)shouldShowLoadingImage
{
  return self->_shouldShowLoadingImage;
}

- (void)updateImageInView:(BOOL)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
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
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  BOOL v40;
  _QWORD v41[5];
  _QWORD aBlock[4];
  id v43;
  BOOL v44;
  id location[2];

  -[ICImageAttachmentView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
  -[ICImageAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWidth");
  if (v6 == 0.0)
  {

    goto LABEL_5;
  }
  -[ICImageAttachmentView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeHeight");
  v9 = v8;

  if (v9 == 0.0)
LABEL_5:
    -[ICImageAttachmentView setShouldUpdateLayoutInImageDidLoad:](self, "setShouldUpdateLayoutInImageDidLoad:", 1);
  v10 = -[ICAttachmentView forManualRendering](self, "forManualRendering");
  -[ICImageAttachmentView attachment](self, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "image");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    -[ICImageAttachmentView imageDidLoad:shouldFade:](self, "imageDidLoad:shouldFade:", v37, 0);
    return;
  }
  objc_msgSend(v11, "intrinsicContentSize");
  v14 = v13;
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0D64D98], "defaultAttachmentThumbnailViewHeight");
  v18 = v17;
  -[ICImageAttachmentView textAttachment](self, "textAttachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "supportsMultiplePresentationSizes") & 1) == 0)
  {

LABEL_16:
    -[ICImageAttachmentView attachment](self, "attachment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = self;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_3;
    v39[3] = &unk_1EA7DF0B0;
    v39[4] = self;
    v40 = a3;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_5;
    v38[3] = &unk_1EA7DD2D8;
    objc_msgSend(v35, "loadImage:aboutToLoadHandler:forceFullSizeImage:", v39, v38, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICImageAttachmentView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", v36);

    return;
  }
  -[ICImageAttachmentView attachment](self, "attachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "preferredViewSize");

  if (v21 != 1 || v14 <= v18 || v16 <= v18)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0D64D98], "defaultAttachmentThumbnailViewHeight");
  v23 = v22;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke;
  aBlock[3] = &unk_1EA7DF060;
  objc_copyWeak(&v43, location);
  v44 = a3;
  v24 = _Block_copy(aBlock);
  v25 = objc_alloc_init(MEMORY[0x1E0D63CF0]);
  -[ICImageAttachmentView ic_backingScaleFactor](self, "ic_backingScaleFactor");
  v27 = v26;
  -[ICImageAttachmentView attachment](self, "attachment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 < 1.0)
    v27 = 1.0;
  -[ICImageAttachmentView ic_appearanceInfo](self, "ic_appearanceInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView attachment](self, "attachment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView attachment](self, "attachment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "attachmentModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "genericBrickThumbnailCreator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_2;
  v41[3] = &unk_1EA7DD2D8;
  v41[4] = self;
  objc_msgSend(v28, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v29, v25, v31, 0, v24, v34, v23, v23, v27, v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);
}

- (BOOL)isThumbnailView
{
  void *v2;
  BOOL v3;

  -[ICImageAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredViewSize") == 1;

  return v3;
}

uint64_t __44__ICImageAttachmentView_animateImageArrival__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
}

void __44__ICImageAttachmentView_animateImageArrival__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupImagePlaceholderIfNecessary");
}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_4(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = *(unsigned __int8 *)(a1 + 49) != 0;
  else
    v3 = 1;
  return objc_msgSend(v2, "imageDidLoad:shouldFade:", *(_QWORD *)(a1 + 40), v3);
}

void __43__ICImageAttachmentView_updateImageInView___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  _QWORD block[5];
  id v7;
  char v8;
  char v9;

  v5 = a2;
  if (a3 && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(*(id *)(a1 + 32), "imageDidLoad:shouldFade:", v5, *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_4;
    block[3] = &unk_1EA7DF088;
    block[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    v8 = a3;
    v9 = *(_BYTE *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)updateImageInViewIfNecessary
{
  void *v3;

  -[ICImageAttachmentView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ICImageAttachmentView setShouldTryToReloadImageIfLoadingFails:](self, "setShouldTryToReloadImageIfLoadingFails:", 1);
  else
    -[ICImageAttachmentView updateImageInView:](self, "updateImageInView:", 0);
}

- (BOOL)showLoadingImage
{
  void *v2;
  BOOL v3;

  -[ICImageAttachmentView loadingImageView](self, "loadingImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUpdateLayoutInImageDidLoad
{
  return self->_shouldUpdateLayoutInImageDidLoad;
}

- (void)setupImagePlaceholder
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "ICLoadingPlaceholderBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView setIc_backgroundColor:](self, "setIc_backgroundColor:", v3);

  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v4);

  -[ICImageAttachmentView setShouldShowLoadingImage:](self, "setShouldShowLoadingImage:", 1);
  -[ICImageAttachmentView refreshLoadingImage](self, "refreshLoadingImage");
}

- (void)setupImagePlaceholderIfNecessary
{
  void *v3;
  void *v4;

  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[ICImageAttachmentView setupImagePlaceholder](self, "setupImagePlaceholder");
}

- (void)setupEventHandling
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICImageAttachmentView;
  -[ICAttachmentView setupEventHandling](&v2, sel_setupEventHandling);
}

- (void)setShouldTryToReloadImageIfLoadingFails:(BOOL)a3
{
  self->_shouldTryToReloadImageIfLoadingFails = a3;
}

- (void)setShouldShowLoadingImage:(BOOL)a3
{
  self->_shouldShowLoadingImage = a3;
}

- (void)setLoadingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingImageView, a3);
}

- (void)setImageLoadingCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setImageLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (void)setImage:(id)a3
{
  objc_storeWeak((id *)&self->_image, a3);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICImageAttachmentView updateImageSize](self, "updateImageSize");
  -[ICImageAttachmentView refreshLoadingImage](self, "refreshLoadingImage");
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[ICImageAttachmentView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)imageLoadingCancelBlock
{
  return self->_imageLoadingCancelBlock;
}

- (id)imageContentsGravity
{
  return (id)*MEMORY[0x1E0CD2F98];
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[ICImageAttachmentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICImageAttachmentView window](self, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsScale:", v7);

  }
}

- (void)didChangeAttachment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView didChangeAttachment](&v3, sel_didChangeAttachment);
  -[ICImageAttachmentView updateImageInViewIfNecessary](self, "updateImageInViewIfNecessary");
}

- (void)animateImageArrival
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromValue:", &unk_1EA821F30);
  objc_msgSend(v3, "setToValue:", &unk_1EA821F40);
  objc_msgSend(v3, "setDuration:", 0.1);
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v3, CFSTR("opacity"));

  -[ICImageAttachmentView setShowLoadingImage:](self, "setShowLoadingImage:", 0);
  -[ICImageAttachmentView ic_backgroundColor](self, "ic_backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__ICImageAttachmentView_animateImageArrival__block_invoke;
    v7[3] = &unk_1EA7DD2D8;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__ICImageAttachmentView_animateImageArrival__block_invoke_2;
    v6[3] = &unk_1EA7DE700;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.1);
  }

}

+ (double)ICLoadingPlaceholderIconSize
{
  return 80.0;
}

+ (id)ICLoadingPlaceholderIconColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ICLoadingPlaceholderBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_systemGray5Color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)frameForContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[ICImageAttachmentView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[ICImageAttachmentView imageFrame](self, "imageFrame");
  v10 = v4 + v9;
  v12 = v6 + v11;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICImageAttachmentView;
  -[ICAttachmentView dealloc](&v4, sel_dealloc);
}

uint64_t __40__ICImageAttachmentView_updateImageSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeSize");
}

- (void)didChangeMedia
{
  objc_super v3;

  -[ICImageAttachmentView setShouldUpdateLayoutInImageDidLoad:](self, "setShouldUpdateLayoutInImageDidLoad:", 1);
  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView didChangeMedia](&v3, sel_didChangeMedia);
  -[ICImageAttachmentView updateImageInViewIfNecessary](self, "updateImageInViewIfNecessary");
}

- (void)didUpdatePreviewImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView didUpdatePreviewImages](&v3, sel_didUpdatePreviewImages);
  -[ICImageAttachmentView updateImageInViewIfNecessary](self, "updateImageInViewIfNecessary");
}

- (void)didScrollOutOfVisibleRange
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[ICImageAttachmentView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICImageAttachmentView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[ICImageAttachmentView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
  }
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", 0);

}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  -[ICImageAttachmentView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[ICImageAttachmentView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

      -[ICImageAttachmentView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)prepareForPrinting
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Unexpected nil image for attachment (%@)", (uint8_t *)&v5, 0xCu);

}

void __43__ICImageAttachmentView_updateImageInView___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "imageDidLoad:shouldFade:", v4, *(unsigned __int8 *)(a1 + 40));

}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupImagePlaceholderIfNecessary");
}

- (BOOL)isAttachmentEditable
{
  return 1;
}

- (void)setHighlightColor:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView setHighlightColor:](&v5, sel_setHighlightColor_, a3);
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v4);

}

- (UIImage)image
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_image);
}

- (void)setShouldUpdateLayoutInImageDidLoad:(BOOL)a3
{
  self->_shouldUpdateLayoutInImageDidLoad = a3;
}

- (BOOL)shouldTryToReloadImageIfLoadingFails
{
  return self->_shouldTryToReloadImageIfLoadingFails;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingImageView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong(&self->_imageLoadingCancelBlock, 0);
  objc_destroyWeak((id *)&self->_image);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (id)icaxHintString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to view full-screen"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("image attachment"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentView icaxAttachmentViewTypeDescription](self, "icaxAttachmentViewTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Image"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[ICImageAttachmentView accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
