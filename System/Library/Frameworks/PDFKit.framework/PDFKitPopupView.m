@implementation PDFKitPopupView

- (PDFKitPopupView)initWithParentAnnotation:(id)a3 owningPageView:(id)a4 owningPDFView:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDFKitPopupView *v11;
  PDFKitPopupViewPrivate *v12;
  PDFKitPopupViewPrivate *v13;
  PDFKitPopupViewPrivate *v14;
  NSUndoManager *popupTextViewUndoManager;
  uint64_t v16;
  PDFKitPopupViewPrivate *v17;
  NSString *contents;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PDFKitPopupView;
  v11 = -[PDFKitPopupView init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(PDFKitPopupViewPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    objc_storeWeak((id *)&v11->_private->parentAnnotation, v8);
    objc_storeWeak((id *)&v11->_private->pageView, v9);
    objc_storeWeak((id *)&v11->_private->view, v10);
    v14 = v11->_private;
    popupTextViewUndoManager = v14->popupTextViewUndoManager;
    v14->popupTextViewUndoManager = 0;

    objc_msgSend(v8, "contents");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v11->_private;
    contents = v17->contents;
    v17->contents = (NSString *)v16;

    v11->_private->deviceIsiPhone = PDFKitDeviceIsiPhone();
    v11->_private->deviceIsiPad = PDFKitDeviceIsiPad();
    -[PDFKitPopupView _setupPopupView](v11, "_setupPopupView");
    -[PDFKitPopupView _presentPopupView](v11, "_presentPopupView");
  }

  return v11;
}

- (void)_setupPopupView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UITextView *v13;
  PDFKitPopupViewPrivate *v14;
  UITextView *popupTextView;
  PDFKitPopupViewPrivate *v16;
  void *v17;
  UITextView *v18;
  void *v19;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  objc_msgSend(WeakRetained, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isMarkupAnnotationSubtype"))
  {
    +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(WeakRetained, "markupStyle");
    v6 = v4;
  }
  else
  {
    objc_msgSend(WeakRetained, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_6;
    objc_msgSend(WeakRetained, "popup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
    +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    v5 = 0;
  }
  objc_msgSend(v6, "objectAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v7);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[PDFAnnotationDrawing createLigtherColor:withIntensity:](PDFAnnotationDrawing, "createLigtherColor:withIntensity:", objc_msgSend(objc_retainAutorelease(v7), "CGColor"), 0.05);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PDFAnnotation PDFTextBorderColors](PDFAnnotation, "PDFTextBorderColors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
  v14 = self->_private;
  popupTextView = v14->popupTextView;
  v14->popupTextView = v13;

  -[UITextView setDelegate:](self->_private->popupTextView, "setDelegate:", self);
  if (v3)
    -[UITextView setText:](self->_private->popupTextView, "setText:", v3);
  v16 = self->_private;
  if (v16->deviceIsiPhone)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFKitPopupView setBackgroundColor:](self, "setBackgroundColor:", v17);

    -[PDFKitPopupView addSubview:](self, "addSubview:", self->_private->popupTextView);
  }
  else if (v16->deviceIsiPad)
  {
    -[UITextView setBackgroundColor:](v16->popupTextView, "setBackgroundColor:", v7);
    -[UITextView setTextContainerInset:](self->_private->popupTextView, "setTextContainerInset:", 14.0, 14.0, 14.0, 14.0);
    v18 = self->_private->popupTextView;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v18, "setTextColor:", v19);

  }
}

- (void)_presentPopupView_iOS
{
  PDFKitPopupView *v2;
  PDFKitPopupViewPrivate *v3;
  UIViewController *v4;
  void *v5;
  void *v6;
  PDFKitPopupViewPrivate *v7;
  UIViewController *popupController;
  UIViewController *v9;
  void *v10;
  id WeakRetained;
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
  UIViewController *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  PDFKitPopupViewPrivate *v38;
  UIViewController *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  PDFKitPopupView *v86;
  void *v87;
  void *v88;
  _QWORD v89[8];
  _QWORD v90[6];

  v2 = self;
  v90[4] = *MEMORY[0x24BDAC8D0];
  v3 = self->_private;
  if (v3->deviceIsiPad)
  {
    v4 = (UIViewController *)objc_alloc_init(MEMORY[0x24BDF6F98]);
    PDFSizeMake(-[UIViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 7), 300.0, 180.0);
    -[UIViewController setPreferredContentSize:](v4, "setPreferredContentSize:");
    -[UITextView backgroundColor](v2->_private->popupTextView, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = v2->_private;
    popupController = v7->popupController;
    v7->popupController = v4;
    v9 = v4;

    -[UIViewController popoverPresentationController](v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v2);
    WeakRetained = objc_loadWeakRetained((id *)&v2->_private->view);
    objc_msgSend(v10, "setSourceView:", WeakRetained);

    -[PDFKitPopupView _popoverControllerSourceRect](v2, "_popoverControllerSourceRect");
    v87 = v10;
    objc_msgSend(v10, "setSourceRect:");
    objc_msgSend(v10, "setPermittedArrowDirections:", 15);
    -[UIViewController view](v9, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v2->_private->popupTextView);

    -[UIViewController view](v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v2->_private->popupTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v69 = (void *)MEMORY[0x24BDD1628];
    -[UITextView leadingAnchor](v2->_private->popupTextView, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "safeAreaLayoutGuide");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v79, 0.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v77;
    -[UITextView trailingAnchor](v2->_private->popupTextView, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "safeAreaLayoutGuide");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v67, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v65;
    -[UITextView topAnchor](v2->_private->popupTextView, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "safeAreaLayoutGuide");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v57, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v14;
    -[UITextView bottomAnchor](v2->_private->popupTextView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v90[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v20);

    v21 = v87;
    v22 = v9;
  }
  else
  {
    if (!v3->deviceIsiPhone)
      goto LABEL_6;
    v23 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v2);

    -[PDFKitPopupView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v2->_private->popupTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v54 = (void *)MEMORY[0x24BDD1628];
    -[PDFKitPopupView leadingAnchor](v2, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v80);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v78;
    -[PDFKitPopupView trailingAnchor](v2, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v72);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v70;
    -[PDFKitPopupView topAnchor](v2, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v64);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v62;
    -[PDFKitPopupView bottomAnchor](v2, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v55;
    -[UITextView leadingAnchor](v2->_private->popupTextView, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "safeAreaLayoutGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 8.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v89[4] = v49;
    -[UITextView trailingAnchor](v2->_private->popupTextView, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "safeAreaLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45, 8.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v89[5] = v44;
    -[UITextView topAnchor](v2->_private->popupTextView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v23;
    objc_msgSend(v23, "view");
    v86 = v2;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "safeAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v26, 8.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v89[6] = v27;
    -[UITextView bottomAnchor](v86->_private->popupTextView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31, 8.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v89[7] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activateConstraints:", v33);

    v2 = v86;
    v34 = objc_alloc(MEMORY[0x24BDF6860]);
    PDFKitLocalizedString(CFSTR("Done"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (UIViewController *)objc_msgSend(v34, "initWithTitle:style:target:action:", v35, 0, v86, sel_doneButton_);

    objc_msgSend(v88, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setRightBarButtonItem:", v22);

    v21 = v88;
    v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v88);
    v38 = v86->_private;
    v39 = v38->popupController;
    v38->popupController = (UIViewController *)v37;

    -[UIViewController setModalPresentationStyle:](v86->_private->popupController, "setModalPresentationStyle:", 1);
    v9 = v86->_private->popupController;
  }
  -[PDFKitPopupView _presentViewController:](v2, "_presentViewController:", v9);

LABEL_6:
  -[UITextView text](v2->_private->popupTextView, "text");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (!v41)
    -[UITextView becomeFirstResponder](v2->_private->popupTextView, "becomeFirstResponder");
}

- (void)_presentViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (CGRect)_popoverControllerSourceRect
{
  id WeakRetained;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double MinX;
  double v22;
  double MaxX;
  double MinY;
  double v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double height;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;
  CGRect v44;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v4 = objc_loadWeakRetained((id *)&self->_private->pageView);
  v5 = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  objc_msgSend(v5, "noteBounds");
  objc_msgSend(v4, "convertRectToPageView:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(WeakRetained, "visibleRectForPageView:", v4);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v43.size.height = v20;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  v43.origin.x = v15;
  v43.origin.y = v17;
  v43.size.width = v19;
  height = v43.size.height;
  v44 = PDFRectIntersection(v40, v43);
  v41.origin.x = v7;
  v41.origin.y = v9;
  v41.size.width = v11;
  v41.size.height = v13;
  if (PDFRectEqualToRect(v41, v44))
    goto LABEL_12;
  MinX = PDFRectGetMinX(v7, v9, v11);
  if (MinX < PDFRectGetMinX(v15, v17, v19))
  {
    v22 = PDFRectGetMinX(v15, v17, v19);
LABEL_6:
    v7 = v22;
    goto LABEL_7;
  }
  MaxX = PDFRectGetMaxX(v7, v9, v11);
  if (MaxX > PDFRectGetMaxX(v15, v17, v19))
  {
    v22 = PDFRectGetMaxX(v15, v17, v19);
    goto LABEL_6;
  }
LABEL_7:
  MinY = PDFRectGetMinY(v7, v9, v11, v13);
  if (MinY < PDFRectGetMinY(v15, v17, v19, height))
  {
    v25 = PDFRectGetMinY(v15, v17, v19, height);
LABEL_11:
    v9 = v25;
    goto LABEL_12;
  }
  MaxY = PDFRectGetMaxY(v7, v9, v11, v13);
  if (MaxY > PDFRectGetMaxY(v15, v17, v19, height))
  {
    v25 = PDFRectGetMaxY(v15, v17, v19, height);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "convertRect:toView:", WeakRetained, v7, v9, v11, v13);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "findFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&self->_private->savedFirstResponder, v4);

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id WeakRetained;
  id v5;

  -[PDFKitPopupView _removeControlForAnnotation](self, "_removeControlForAnnotation", a3);
  WeakRetained = objc_loadWeakRetained(&self->_private->savedFirstResponder);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "becomeFirstResponder");
    WeakRetained = v5;
  }

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v14;

  -[PDFKitPopupView _popoverControllerSourceRect](self, "_popoverControllerSourceRect", a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  if (!PDFRectEqualToRect(*a4, v14))
  {
    a4->origin.x = v7;
    a4->origin.y = v9;
    a4->size.width = v11;
    a4->size.height = v13;
  }
}

- (BOOL)becomeFirstResponder
{
  -[UITextView becomeFirstResponder](self->_private->popupTextView, "becomeFirstResponder");
  return 1;
}

- (void)removeFromSuperview
{
  PDFKitPopupViewPrivate *v3;
  objc_super v4;

  -[PDFKitPopupView _updateParentContents](self, "_updateParentContents");
  v3 = self->_private;
  if (v3->deviceIsiPhone)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](v3->popupController, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PDFKitPopupView;
    -[PDFKitPopupView removeFromSuperview](&v4, sel_removeFromSuperview);
  }
}

- (void)_removeControlForAnnotation
{
  id v3;
  id WeakRetained;

  -[PDFKitPopupView _updateParentContents](self, "_updateParentContents");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v3 = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  objc_msgSend(WeakRetained, "removeControlForAnnotation:", v3);

}

- (void)_updateParentContents
{
  PDFKitPopupViewPrivate *v3;
  NSString *contents;
  id WeakRetained;

  if (!-[NSString length](self->_private->contents, "length"))
  {
    v3 = self->_private;
    contents = v3->contents;
    v3->contents = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  objc_msgSend(WeakRetained, "setContents:withUndo:", self->_private->contents, 1);

}

- (void)textViewDidChange:(id)a3
{
  uint64_t v4;
  PDFKitPopupViewPrivate *v5;
  NSString *contents;

  -[UITextView text](self->_private->popupTextView, "text", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = self->_private;
  contents = v5->contents;
  v5->contents = (NSString *)v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
