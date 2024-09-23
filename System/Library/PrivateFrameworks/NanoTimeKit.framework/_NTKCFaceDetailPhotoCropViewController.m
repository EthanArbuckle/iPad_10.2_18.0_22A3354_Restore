@implementation _NTKCFaceDetailPhotoCropViewController

- (_NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _NTKCFaceDetailPhotoCropViewController *v16;
  _NTKCFaceDetailPhotoCropViewController *v17;
  void *v18;
  uint64_t v19;
  UIBarButtonItem *deleteButton;
  uint64_t v21;
  UIBarButtonItem *cancelButton;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id completionHandler;
  objc_super v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  v16 = -[_NTKCFaceDetailPhotoCropViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    -[_NTKCFaceDetailPhotoCropViewController setIndex:](v16, "setIndex:", a3);
    -[_NTKCFaceDetailPhotoCropViewController setEditor:](v17, "setEditor:", v12);
    -[_NTKCFaceDetailPhotoCropViewController setFace:](v17, "setFace:", v13);
    -[_NTKCFaceDetailPhotoCropViewController setTimeStyle:](v17, "setTimeStyle:", v14);
    -[_NTKCFaceDetailPhotoCropViewController navigationItem](v17, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidesBackButton:", 1);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 16, v17, sel__deletePressed);
    deleteButton = v17->_deleteButton;
    v17->_deleteButton = (UIBarButtonItem *)v19;

    -[UIBarButtonItem setEnabled:](v17->_deleteButton, "setEnabled:", -[NTKCompanionCustomPhotosEditor photosCount](v17->_editor, "photosCount") > 1);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v17, sel__cancelPressed);
    cancelButton = v17->_cancelButton;
    v17->_cancelButton = (UIBarButtonItem *)v21;

    v33[0] = v17->_cancelButton;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v33[1] = v23;
    v33[2] = v17->_deleteButton;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v33[3] = v24;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v17, sel__donePressed);
    v33[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCFaceDetailPhotoCropViewController setToolbarItems:](v17, "setToolbarItems:", v26);

    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CROP_TITLE"), (uint64_t)CFSTR("Move and Scale"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCFaceDetailPhotoCropViewController setTitle:](v17, "setTitle:", v28);

    v29 = _Block_copy(v15);
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = v29;

  }
  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CAShapeLayer *v5;
  CAShapeLayer *reverseMask;
  id v7;
  void *v8;
  void *v9;
  NTKCCenteringScrollView *v10;
  void *v11;
  NTKCCenteringScrollView *v12;
  NTKCCenteringScrollView *scrollView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NTKCompanionCustomPhotosEditor *editor;
  unint64_t index;
  id v24;
  CAShapeLayer *v25;
  CAShapeLayer *mask;
  id v27;
  void *v28;
  void *v29;
  UIView *v30;
  UIView *timeContainer;
  void *v32;
  void *v33;
  NTKDigitalTimeLabel *v34;
  NTKDigitalTimeLabel *time;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  _QWORD aBlock[5];
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  -[_NTKCFaceDetailPhotoCropViewController viewDidLoad](&v42, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  reverseMask = self->_reverseMask;
  self->_reverseMask = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_reverseMask, "setFillColor:", objc_msgSend(v7, "CGColor"));

  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_reverseMask);

  v10 = [NTKCCenteringScrollView alloc];
  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = -[NTKCCenteringScrollView initWithFrame:](v10, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v12;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCCenteringScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v14);

  -[NTKCCenteringScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 0.1);
  if (-[NTKCompanionCustomPhotosEditor canChangeOriginalCropOfPhotoAtIndex:](self->_editor, "canChangeOriginalCropOfPhotoAtIndex:", self->_index))
  {
    -[NTKCompanionCustomPhotosEditor minimumNormalizedCropSizeForPhotoAtIndex:](self->_editor, "minimumNormalizedCropSizeForPhotoAtIndex:", self->_index);
    v16 = 1.0 / v15;
    v18 = 1.0 / v17;
    if (v16 >= v18)
      v16 = v18;
    -[NTKCCenteringScrollView setMaximumZoomRatio:](self->_scrollView, "setMaximumZoomRatio:", v16);
  }
  else
  {
    -[NTKCCenteringScrollView setMaximumZoomRatio:](self->_scrollView, "setMaximumZoomRatio:", 1.0);
    -[NTKCCenteringScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
    -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 0);
  }
  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_scrollView);

  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6BCFF20;
  aBlock[4] = self;
  v21 = _Block_copy(aBlock);
  editor = self->_editor;
  index = self->_index;
  v39[0] = v20;
  v39[1] = 3221225472;
  v39[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_2;
  v39[3] = &unk_1E6BCFF70;
  v39[4] = self;
  v40 = v21;
  v24 = v21;
  -[NTKCompanionCustomPhotosEditor imageInPhotoLibraryForPhotoAtIndex:completion:](editor, "imageInPhotoLibraryForPhotoAtIndex:completion:", index, v39);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v25 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  mask = self->_mask;
  self->_mask = v25;

  -[CAShapeLayer setFillRule:](self->_mask, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_mask, "setFillColor:", objc_msgSend(v27, "CGColor"));

  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSublayer:", self->_mask);

  v30 = (UIView *)objc_opt_new();
  timeContainer = self->_timeContainer;
  self->_timeContainer = v30;

  -[UIView setUserInteractionEnabled:](self->_timeContainer, "setUserInteractionEnabled:", 0);
  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", self->_timeContainer);

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 0, v33);
  v34 = (NTKDigitalTimeLabel *)objc_claimAutoreleasedReturnValue();
  time = self->_time;
  self->_time = v34;

  -[NTKDigitalTimeLabel setUsesLegibility:](self->_time, "setUsesLegibility:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setTextColor:](self->_time, "setTextColor:", v36);

  +[NTKDate faceDate](NTKDate, "faceDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUITimeLabel timeFormatter](self->_time, "timeFormatter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setOverrideDate:", v37);

  -[NTKDigitalTimeLabel setStyle:](self->_time, "setStyle:", self->_timeStyle);
  -[UIView addSubview:](self->_timeContainer, "addSubview:", self->_time);

}

- (void)viewDidLayoutSubviews
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  UIView *timeContainer;
  __int128 v43;
  double v44;
  double v45;
  UIView *v46;
  CGFloat rect;
  double rect_8;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  _OWORD v55[3];
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v56.receiver = self;
  v56.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  -[_NTKCFaceDetailPhotoCropViewController viewDidLayoutSubviews](&v56, sel_viewDidLayoutSubviews);
  -[_NTKCFaceDetailPhotoCropViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_NTKCFaceDetailPhotoCropViewController face](self, "face");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenBounds");
  v49 = v15;
  v50 = v14;
  v51 = v17;
  v52 = v16;

  -[_NTKCFaceDetailPhotoCropViewController face](self, "face");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screenCornerRadius");
  rect_8 = v20;

  -[NTKCCenteringScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  -[NTKCCenteringScrollView setContentInset:](self->_scrollView, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  UIRectCenteredIntegralRectScale();
  rect = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[NTKCCenteringScrollView safeAreaInsets](self->_scrollView, "safeAreaInsets", 0);
  v29 = v28;
  -[NTKCCenteringScrollView safeAreaInsets](self->_scrollView, "safeAreaInsets");
  v31 = v29 - v30;
  v57.origin.x = rect;
  v57.origin.y = v23;
  v57.size.width = v25;
  v57.size.height = v27;
  v58 = CGRectOffset(v57, 0.0, v31);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  -[CAShapeLayer setFrame:](self->_mask, "setFrame:", v5, v7, v9, v11);
  v36 = (void *)MEMORY[0x1E0DC3508];
  -[CAShapeLayer bounds](self->_mask, "bounds");
  objc_msgSend(v36, "bezierPathWithRect:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, rect_8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "appendPath:", v38);

  v39 = objc_retainAutorelease(v37);
  -[CAShapeLayer setPath:](self->_mask, "setPath:", objc_msgSend(v39, "CGPath"));
  -[CAShapeLayer setFrame:](self->_reverseMask, "setFrame:", x, y, width, height);
  v40 = (void *)MEMORY[0x1E0DC3508];
  -[CAShapeLayer bounds](self->_reverseMask, "bounds");
  objc_msgSend(v40, "bezierPathWithRoundedRect:cornerRadius:");
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_reverseMask, "setPath:", objc_msgSend(v41, "CGPath"));

  timeContainer = self->_timeContainer;
  v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v55[0] = *MEMORY[0x1E0C9BAA8];
  v55[1] = v43;
  v55[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](timeContainer, "setTransform:", v55);
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->_timeContainer, "setFrame:", 0);
  v59.origin.x = v50;
  v59.origin.y = v49;
  v59.size.width = v52;
  v59.size.height = v51;
  v44 = 272.0 / CGRectGetWidth(v59);
  v60.origin.x = v50;
  v60.origin.y = v49;
  v60.size.width = v52;
  v60.size.height = v51;
  v45 = 340.0 / CGRectGetHeight(v60);
  if (v44 >= v45)
    v45 = v44;
  CGAffineTransformMakeScale(&v54, v45, v45);
  v46 = self->_timeContainer;
  v53 = v54;
  -[UIView setTransform:](v46, "setTransform:", &v53);
  -[NTKDigitalTimeLabel setFrameUsingCurrentStyle](self->_time, "setFrameUsingCurrentStyle");
  -[NTKCCenteringScrollView setMinimumDisplaySize:](self->_scrollView, "setMinimumDisplaySize:", width, height);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void (**completionHandler)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  -[_NTKCFaceDetailPhotoCropViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler)
    completionHandler[2]();
}

- (void)_cancelPressed
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  CGRect v26;
  CGRect v27;

  -[NTKCCenteringScrollView cropRect](self->_scrollView, "cropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKCompanionCustomPhotosEditor originalCropForPhotoAtIndex:](self->_editor, "originalCropForPhotoAtIndex:", self->_index);
  v27.origin.x = v11;
  v27.origin.y = v12;
  v27.size.width = v13;
  v27.size.height = v14;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  if (CGRectEqualToRect(v26, v27))
  {
    self->_cancelConfirmed = 1;
LABEL_4:
    self->_cancelConfirmed = 0;
    -[_NTKCFaceDetailPhotoCropViewController dismissWithSaving:](self, "dismissWithSaving:", 0);
    return;
  }
  if (self->_cancelConfirmed)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3448];
  NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CROP_CANCEL"), (uint64_t)CFSTR("Discard Changes"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56___NTKCFaceDetailPhotoCropViewController__cancelPressed__block_invoke;
  v25[3] = &unk_1E6BCE388;
  v25[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CANCEL_BUTTON"), (uint64_t)CFSTR("Cancel"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v23);

  -[_NTKCFaceDetailPhotoCropViewController parentViewController](self, "parentViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)_deletePressed
{
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  if (self->_deleteConfirmed)
  {
    self->_deleteConfirmed = 0;
    -[NTKCompanionCustomPhotosEditor deletePhotoAtIndex:](self->_editor, "deletePhotoAtIndex:", self->_index);
    -[_NTKCFaceDetailPhotoCropViewController dismissWithSaving:](self, "dismissWithSaving:", 0);
  }
  else
  {
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_DELETE_CONFIRMATION_SINGULAR"), (uint64_t)CFSTR("Delete Confirmation"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_DELETE_BUTTON_SINGULAR"), (uint64_t)CFSTR("Delete Photos"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56___NTKCFaceDetailPhotoCropViewController__deletePressed__block_invoke;
    v13[3] = &unk_1E6BCE388;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 2, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    v9 = (void *)MEMORY[0x1E0DC3448];
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CANCEL_BUTTON"), (uint64_t)CFSTR("Cancel"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v12);

    -[_NTKCFaceDetailPhotoCropViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
}

- (void)_donePressed
{
  -[_NTKCFaceDetailPhotoCropViewController dismissWithSaving:](self, "dismissWithSaving:", 1);
}

- (void)dismissWithSaving:(BOOL)a3
{
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  double photoScale;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  if (a3)
  {
    -[NTKCCenteringScrollView cropRect](self->_scrollView, "cropRect");
    if (!CGRectIsEmpty(v14))
    {
      -[NTKCCenteringScrollView cropRect](self->_scrollView, "cropRect");
      x = v4;
      y = v6;
      width = v8;
      height = v10;
      photoScale = self->_photoScale;
      if (photoScale != 0.0)
      {
        CGAffineTransformMakeScale(&v13, photoScale, self->_photoScale);
        v15.origin.x = x;
        v15.origin.y = y;
        v15.size.width = width;
        v15.size.height = height;
        v16 = CGRectApplyAffineTransform(v15, &v13);
        x = v16.origin.x;
        y = v16.origin.y;
        width = v16.size.width;
        height = v16.size.height;
      }
      -[NTKCompanionCustomPhotosEditor setOriginalCrop:forPhotoAtIndex:](self->_editor, "setOriginalCrop:forPhotoAtIndex:", self->_index, x, y, width, height);
    }
  }
  -[_NTKCFaceDetailPhotoCropViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (NTKDigitalTimeLabelStyle)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_timeStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStyle, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_timeContainer, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_reverseMask, 0);
}

@end
