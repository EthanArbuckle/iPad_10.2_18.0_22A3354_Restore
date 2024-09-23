@implementation WKDatePickerPopoverController

- (WKDatePickerPopoverController)initWithDatePicker:(id)a3 delegate:(id)a4
{
  WKDatePickerPopoverController *v6;
  WKDatePickerPopoverView *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKDatePickerPopoverController;
  v6 = -[WKDatePickerPopoverController init](&v10, sel_init);
  if (v6)
  {
    v7 = -[WKDatePickerPopoverView initWithDatePicker:]([WKDatePickerPopoverView alloc], "initWithDatePicker:", a3);
    m_ptr = v6->_contentView.m_ptr;
    v6->_contentView.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_storeWeak((id *)&v6->_delegate, a4);
    -[WKDatePickerPopoverController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 7);
    objc_msgSend((id)-[WKDatePickerPopoverController popoverPresentationController](v6, "popoverPresentationController"), "setDelegate:", v6);
  }
  return v6;
}

- (void)resetDatePicker
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "datePickerPopoverControllerDidReset:", self);
}

- (void)assertAccessoryViewCanBeHitTestedForTesting
{
  void *v3;
  uint64_t v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v11;
  CGRect v12;
  CGRect v13;

  v3 = (void *)objc_msgSend(self->_contentView.m_ptr, "accessoryView");
  v4 = -[WKDatePickerPopoverController viewIfLoaded](self, "viewIfLoaded");
  if (!v3)
  {
    __break(0xC471u);
    JUMPOUT(0x1972AE6DCLL);
  }
  v5 = (void *)v4;
  if (!v4)
    goto LABEL_9;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v3);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v11 = (void *)objc_msgSend(v5, "hitTest:withEvent:", 0, MidX, CGRectGetMidY(v13));
  if (!v11)
  {
LABEL_9:
    __break(0xC471u);
    JUMPOUT(0x1972AE6A4);
  }
  while (v11 != v3)
  {
    v11 = (void *)objc_msgSend(v11, "superview");
    if (!v11)
      goto LABEL_9;
  }
}

- (void)dismissDatePickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CFTypeRef v6;
  _QWORD v7[4];
  CFTypeRef cf;

  v3 = a3;
  v5 = (void *)-[WKDatePickerPopoverController presentingViewController](self, "presentingViewController");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __59__WKDatePickerPopoverController_dismissDatePickerAnimated___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c72_ZTSKZ59__WKDatePickerPopoverController_dismissDatePickerAnimated__E3__0_e5_v8__0l;
  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v7);
  if (self)
    CFRelease(self);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
}

uint64_t __59__WKDatePickerPopoverController_dismissDatePickerAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchPopoverControllerDidDismissIfNeeded");
}

- (void)dismissDatePicker
{
  -[WKDatePickerPopoverController dismissDatePickerAnimated:](self, "dismissDatePickerAnimated:", 1);
}

- (void)viewDidLoad
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *m_ptr;
  void *v12;
  WTF::StringImpl *v13;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)WKDatePickerPopoverController;
  -[WKDatePickerPopoverController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  WebCore::localizedString((WebCore *)CFSTR("Reset Button Date/Time Context Menu"), v4);
  if (v13)
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  v7 = (const void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_resetDatePicker);
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v6);
    else
      *(_DWORD *)v13 -= 2;
  }
  v8 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissDatePicker, 0);
  objc_msgSend(self->_contentView.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16[0] = v7;
  v16[1] = objc_msgSend(MEMORY[0x1E0CEA380], "flexibleSpaceItem");
  v16[2] = v8;
  objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "accessoryView"), "setItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3));
  objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "addSubview:", self->_contentView.m_ptr);
  v9 = (void *)objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "widthAnchor"));
  v10 = v9;
  if (v9)
    CFRetain(v9);
  m_ptr = self->_untransformedContentWidthConstraint.m_ptr;
  self->_untransformedContentWidthConstraint.m_ptr = v10;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v10 = self->_untransformedContentWidthConstraint.m_ptr;
  }
  v12 = (void *)MEMORY[0x1E0CB3718];
  v15[0] = v10;
  v15[1] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "leadingAnchor"));
  v15[2] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "trailingAnchor"));
  v15[3] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "topAnchor"));
  v15[4] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "bottomAnchor"), "constraintGreaterThanOrEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "layoutMarginsGuide"), "bottomAnchor"));
  objc_msgSend(v12, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5));
  objc_msgSend(self->_contentView.m_ptr, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  -[WKDatePickerPopoverController setPreferredContentSize:](self, "setPreferredContentSize:");
  if (v8)
    CFRelease(v8);
  if (v7)
    CFRelease(v7);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKDatePickerPopoverController;
  -[WKDatePickerPopoverController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  if ((-[WKDatePickerPopoverController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
    -[WKDatePickerPopoverController _scaleDownToFitHeightIfNeeded](self, "_scaleDownToFitHeightIfNeeded");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKDatePickerPopoverController;
  -[WKDatePickerPopoverController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if ((-[WKDatePickerPopoverController isBeingPresented](self, "isBeingPresented") & 1) == 0
    && (-[WKDatePickerPopoverController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[WKDatePickerPopoverController dismissDatePickerAnimated:](self, "dismissDatePickerAnimated:", 0);
  }
}

- (void)_scaleDownToFitHeightIfNeeded
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Height;
  double Width;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  CGFloat v27;
  void *m_ptr;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CGRect rect;
  void *v34;
  double v35;
  double v36;
  CGFloat x;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(self->_contentView.m_ptr, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  if (!CGRectIsEmpty(v43))
  {
    v44.origin.x = v12;
    v44.origin.y = v14;
    v44.size.width = v16;
    v44.size.height = v18;
    if (!CGRectIsEmpty(v44))
    {
      v45.origin.x = v12;
      v45.origin.y = v14;
      v45.size.width = v16;
      v45.size.height = v18;
      rect.origin.x = v12;
      Height = CGRectGetHeight(v45);
      v46.origin.x = v4;
      v46.origin.y = v6;
      v46.size.width = v8;
      v46.size.height = v10;
      if (Height > CGRectGetHeight(v46))
      {
        v47.origin.x = v4;
        v47.origin.y = v6;
        v47.size.width = v8;
        v47.size.height = v10;
        Width = CGRectGetWidth(v47);
        v48.origin.x = rect.origin.x;
        v48.origin.y = v14;
        v48.size.width = v16;
        v48.size.height = v18;
        v21 = Width / CGRectGetWidth(v48);
        v49.origin.x = v4;
        v49.origin.y = v6;
        v49.size.width = v8;
        v49.size.height = v10;
        v22 = CGRectGetHeight(v49);
        v50.origin.x = rect.origin.x;
        v50.origin.y = v14;
        v50.size.width = v16;
        v50.size.height = v18;
        v23 = v22 / CGRectGetHeight(v50);
        v24 = v23 >= v21 ? v21 : v23;
        if (v24 > 2.22044605e-16 && (*(_QWORD *)&v24 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v51.origin.x = rect.origin.x;
          v51.origin.y = v14;
          v51.size.width = v16;
          v51.size.height = v18;
          v26 = v24 * CGRectGetWidth(v51);
          v52.origin.x = rect.origin.x;
          v52.origin.y = v14;
          v52.size.width = v16;
          v52.size.height = v18;
          v27 = CGRectGetHeight(v52);
          m_ptr = self->_contentView.m_ptr;
          v29 = v24 * v27;
          *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
          *(_QWORD *)&rect.size.width = 3221225472;
          *(_QWORD *)&rect.size.height = __62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke;
          v34 = &__block_descriptor_88_e30__CGAffineTransform_dddddd_8__0l;
          v35 = v26;
          v36 = v24 * v27;
          x = rect.origin.x;
          v38 = v14;
          v39 = v16;
          v40 = v18;
          v41 = v24;
          __62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke((uint64_t)&rect.origin.y, &v42);
          objc_msgSend(m_ptr, "setTransform:", &v42);
          -[WKDatePickerPopoverController setPreferredContentSize:](self, "setPreferredContentSize:", v26, v29);
          objc_msgSend(self->_untransformedContentWidthConstraint.m_ptr, "setActive:", 0);
          objc_msgSend(self->_transformedContentWidthConstraint.m_ptr, "setActive:", 0);
          v30 = (void *)objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "widthAnchor"), "constraintEqualToAnchor:multiplier:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "widthAnchor"), 1.0 / v24);
          v31 = v30;
          if (v30)
            CFRetain(v30);
          v32 = self->_transformedContentWidthConstraint.m_ptr;
          self->_transformedContentWidthConstraint.m_ptr = v31;
          if (v32)
          {
            CFRelease(v32);
            v31 = self->_transformedContentWidthConstraint.m_ptr;
          }
          objc_msgSend(v31, "setActive:", 1, *(_QWORD *)&rect.origin.x);
        }
      }
    }
  }
}

CGAffineTransform *__62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat Height;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  v4 = *(double *)(a1 + 32);
  v5 = (v4 - CGRectGetWidth(*(CGRect *)(a1 + 48))) * 0.5;
  v6 = *(double *)(a1 + 40);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeTranslation(&v10, v5, (v6 - Height) * 0.5);
  v9 = v10;
  return CGAffineTransformScale(a2, &v9, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 80));
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKDatePickerPopoverController;
  -[WKDatePickerPopoverController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[WKDatePickerPopoverController _dispatchPopoverControllerDidDismissIfNeeded](self, "_dispatchPopoverControllerDidDismissIfNeeded");
}

- (void)presentInView:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double Width;
  double Height;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double MaxX;
  double v50;
  double MinX;
  double v52;
  double MinY;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v8 = (void *)objc_msgSend(a3, "_wk_viewControllerForFullScreenPresentation");
  v9 = v8;
  if (v8)
    CFRetain(v8);
  while (1)
  {
    v11 = v9;
    if (!objc_msgSend(v9, "isBeingDismissed"))
      break;
    v10 = (void *)objc_msgSend(v9, "presentingViewController");
    v9 = v10;
    if (v10)
      CFRetain(v10);
    if (v11)
      CFRelease(v11);
  }
  if (v9)
  {
    self->_canSendPopoverControllerDidDismiss = 1;
    objc_msgSend(a3, "convertRect:toCoordinateSpace:", objc_msgSend(a3, "window"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend((id)objc_msgSend(a3, "window"), "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v55.origin.x = v13;
    v55.origin.y = v15;
    v55.size.width = v17;
    v55.size.height = v19;
    MinY = CGRectGetMinY(v55);
    v56.origin.x = v21;
    v56.origin.y = v23;
    v56.size.width = v25;
    v56.size.height = v27;
    v52 = CGRectGetMinY(v56);
    v57.origin.x = v13;
    v57.origin.y = v15;
    v57.size.width = v17;
    v57.size.height = v19;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = v21;
    v58.origin.y = v23;
    v58.size.width = v25;
    v58.size.height = v27;
    v50 = CGRectGetMinX(v58);
    v59.origin.x = v21;
    v59.origin.y = v23;
    v59.size.width = v25;
    v59.size.height = v27;
    MaxX = CGRectGetMaxX(v59);
    v60.origin.x = v13;
    v60.origin.y = v15;
    v60.size.width = v17;
    v60.size.height = v19;
    v28 = CGRectGetMaxX(v60);
    objc_msgSend(self->_contentView.m_ptr, "estimatedMaximumPopoverSize");
    v30 = v29;
    v32 = v31;
    v48 = v28;
    v33 = (void *)-[WKDatePickerPopoverController popoverPresentationController](self, "popoverPresentationController");
    v61.origin.x = v21;
    v61.origin.y = v23;
    v61.size.width = v25;
    v61.size.height = v27;
    Width = CGRectGetWidth(v61);
    v62.origin.x = v21;
    v62.origin.y = v23;
    v62.size.width = v25;
    v62.size.height = v27;
    Height = CGRectGetHeight(v62);
    v63.origin.x = v21;
    v63.origin.y = v23;
    v63.size.width = v25;
    v63.size.height = v27;
    v36 = CGRectGetHeight(v63);
    v37 = 2;
    if (v32 >= MinY - v52 || v30 >= Width)
      v37 = 0;
    if (v30 < MinX - v50 && v32 < Height)
      v38 = v37 | 8;
    else
      v38 = v37;
    if (v30 < MaxX - v48 && v32 < v36)
      v39 = v38 | 4;
    else
      v39 = v38;
    objc_msgSend(v33, "setPermittedArrowDirections:", v39);
    objc_msgSend(v33, "setSourceView:", a3);
    if (!v39)
    {
      objc_msgSend((id)objc_msgSend(a3, "window"), "bounds");
      objc_msgSend(a3, "convertRect:fromCoordinateSpace:", objc_msgSend(a3, "window"), v40, v41, v42, v43);
      a4.origin.x = v44;
      a4.origin.y = v45;
      a4.size.width = v46;
      a4.size.height = v47;
    }
    objc_msgSend(v33, "setSourceRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    objc_msgSend(v11, "presentViewController:animated:completion:", self, 1, a5);
    CFRelease(v11);
  }
  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)_dispatchPopoverControllerDidDismissIfNeeded
{
  _BOOL4 canSendPopoverControllerDidDismiss;

  canSendPopoverControllerDidDismiss = self->_canSendPopoverControllerDidDismiss;
  self->_canSendPopoverControllerDidDismiss = 0;
  if (canSendPopoverControllerDidDismiss)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "datePickerPopoverControllerDidDismiss:", self);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_transformedContentWidthConstraint.m_ptr;
  self->_transformedContentWidthConstraint.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_untransformedContentWidthConstraint.m_ptr;
  self->_untransformedContentWidthConstraint.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 121) = 0;
  *((_QWORD *)self + 122) = 0;
  *((_QWORD *)self + 123) = 0;
  return self;
}

@end
