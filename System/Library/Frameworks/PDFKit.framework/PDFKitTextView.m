@implementation PDFKitTextView

- (PDFKitTextView)initWithAnnotation:(id)a3 pdfPageView:(id)a4 pdfView:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDFKitTextView *v11;
  PDFKitTextViewPrivate *v12;
  PDFKitTextViewPrivate *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id v24;
  PDFTextWidgetTextView *v25;
  PDFKitTextViewPrivate *v26;
  PDFTextWidgetTextView *textView;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PDFKitTextView;
  v11 = -[PDFKitTextView init](&v32, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(PDFKitTextViewPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    objc_storeWeak((id *)&v11->_private->annotation, v8);
    objc_storeWeak((id *)&v11->_private->pdfPageView, v9);
    objc_storeWeak((id *)&v11->_private->pdfView, v10);
    objc_msgSend(v8, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6770]), "initWithSize:", v18, v20);
    objc_msgSend(v22, "setLineFragmentPadding:", 0.0);
    v23 = objc_alloc_init(MEMORY[0x24BDF6740]);
    objc_msgSend(v23, "addTextContainer:", v22);
    v24 = objc_alloc_init(MEMORY[0x24BDF6778]);
    objc_msgSend(v24, "addLayoutManager:", v23);
    v25 = -[PDFTextWidgetTextView initWithFrame:textContainer:]([PDFTextWidgetTextView alloc], "initWithFrame:textContainer:", v22, v15, v17, v19, v21);
    v26 = v11->_private;
    textView = v26->textView;
    v26->textView = v25;

    -[PDFTextWidgetTextView setDelegate:](v11->_private->textView, "setDelegate:", v11);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v11, sel__keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v11, sel__keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v11, sel__didChangeZoomFactor_, CFSTR("PDFTextSelectionMenuWillChangeZoomFactor"), 0);

    -[PDFKitTextView _setup](v11, "_setup");
  }

  return v11;
}

- (id)textView
{
  return self->_private->textView;
}

- (id)layer
{
  return (id)-[PDFTextWidgetTextView layer](self->_private->textView, "layer");
}

- (id)annotation
{
  return objc_loadWeakRetained((id *)&self->_private->annotation);
}

- (void)setFrame:(CGRect)a3
{
  -[UIView setFrame:](self->_private->topLevelView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)removeFromSuperview
{
  -[UIView removeFromSuperview](self->_private->topLevelView, "removeFromSuperview");
}

- (BOOL)becomeFirstResponder
{
  int v3;
  id WeakRetained;
  id v5;
  void *v6;
  BOOL v7;

  v3 = -[PDFTextWidgetTextView becomeFirstResponder](self->_private->textView, "becomeFirstResponder");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    v5 = objc_loadWeakRetained((id *)&self->_private->annotation);
    v6 = v5;
    if (WeakRetained)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (!v7)
      objc_msgSend(WeakRetained, "interactWithAnnotation:", v5);

  }
  return v3;
}

- (void)insertTextSuggestion:(id)a3 completionHandler:(id)a4
{
  PDFPageView **p_pdfPageView;
  id v6;
  id v7;
  id WeakRetained;

  p_pdfPageView = &self->_private->pdfPageView;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pdfPageView);
  objc_msgSend(WeakRetained, "populateFormFieldsWithAutoFillSuggestion:completionHandler:", v7, v6);

}

- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3
{
  uint64_t v3;
  id WeakRetained;

  if (a3)
    v3 = 2;
  else
    v3 = 3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  objc_msgSend(WeakRetained, "setAutofillEntryType:", v3);

}

- (void)_commitTextFromTextView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  _BOOL8 v39;
  id v40;
  CGRect v41;
  CGRect v42;

  v40 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained && objc_msgSend(v5, "isEqualToString:", CFSTR("/Tx")))
  {
    objc_msgSend(v40, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v40, "endOfDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "positionFromPosition:offset:", v8, -1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "endOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "textRangeFromPosition:toPosition:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "firstRectForRange:", v11);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v40, "textInputView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "convertRect:fromView:", v20, v13, v15, v17, v19);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      objc_msgSend(v40, "bounds");
      v42.origin.x = v29;
      v42.origin.y = v30;
      v42.size.width = v31;
      v42.size.height = v32;
      v41.origin.x = v22;
      v41.origin.y = v24;
      v41.size.width = v26;
      v41.size.height = v28;
      if (!CGRectIntersectsRect(v41, v42))
      {
        objc_msgSend(WeakRetained, "widgetStringValue");
        v33 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v33;
      }

    }
    v34 = objc_msgSend(v40, "selectedRange");
    v36 = v35;
    v37 = objc_loadWeakRetained((id *)&self->_private->pdfPageView);
    objc_msgSend(v37, "setStringValue:onTextWidgetAnnotation:withTextView:", v7, WeakRetained, v40);

    if (v34 != objc_msgSend(v40, "selectedRange"))
      objc_msgSend(v40, "setSelectedRange:", v34 - 1, v36);
    objc_msgSend(v40, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "length") != 0;

    objc_msgSend(WeakRetained, "setAutofillEntryType:", v39);
  }

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  PDFAnnotation **p_annotation;
  id v7;
  id WeakRetained;
  char v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  p_annotation = &self->_private->annotation;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_annotation);
  v9 = objc_msgSend(WeakRetained, "isMultiline");

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v10);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 1;
  else
    v12 = v9;

  if (!v12)
    -[PDFKitTextView _textWidgetDone](self, "_textWidgetDone");
  return v12;
}

- (void)textViewDidChange:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v8, "markedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isEmpty") ^ 1;
    if (!WeakRetained)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
    if (!WeakRetained)
      goto LABEL_7;
  }
  if (((objc_msgSend(WeakRetained, "formFillingUpdatesAnnotationOnEveryTextChange") ^ 1 | v7) & 1) == 0)
    -[PDFKitTextView _commitTextFromTextView:](self, "_commitTextFromTextView:", v8);
LABEL_7:

}

- (void)_textWidgetDone
{
  PDFKitTextViewPrivate *v3;
  id WeakRetained;
  id v5;
  id v6;

  v3 = self->_private;
  if (v3->textView)
  {
    -[PDFKitTextView _commitTextFromTextView:](self, "_commitTextFromTextView:");
    v3 = self->_private;
  }
  WeakRetained = objc_loadWeakRetained((id *)&v3->pdfPageView);
  objc_msgSend(WeakRetained, "endEditing:", 1);

  v6 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v5 = objc_loadWeakRetained((id *)&self->_private->annotation);
  objc_msgSend(v6, "removeControlForAnnotation:", v5);

}

- (void)_adjustScrollViewForKeyboardNotification:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id WeakRetained;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;

  v65 = a3;
  v4 = -[PDFTextWidgetTextView isFirstResponder](self->_private->textView, "isFirstResponder");
  v5 = v65;
  if (v4)
  {
    objc_msgSend(v65, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BDF7A18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v65, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x24BDF7A20]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v64 = v24;

    objc_msgSend(v65, "userInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKey:", *MEMORY[0x24BDF79C0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v28 = v27;

    objc_msgSend(v65, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKey:", *MEMORY[0x24BDF79B8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    v33 = objc_loadWeakRetained((id *)&self->_private->annotation);
    v34 = v33;
    if (v33)
    {
      v63 = v15;
      v35 = v28;
      objc_msgSend(v33, "bounds");
      v37 = v36;
      v61 = v21;
      v62 = v19;
      v38 = v9;
      v40 = v39;
      v41 = v11;
      v43 = v42;
      v60 = v23;
      v44 = v13;
      v46 = v45;
      objc_msgSend(v34, "page");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "convertRect:fromPage:", v47, v37, v40, v43, v46);
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;

      objc_msgSend(WeakRetained, "convertRect:toView:", 0, v49, v51, v53, v55);
      -[PDFKitTextView adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:withAnimationDuration:curve:](self, "adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:withAnimationDuration:curve:", v31, v38, v41, v44, v63, v62, v61, v60, v64, v56, v57, v58, v59, *(_QWORD *)&v35);
    }

    v5 = v65;
  }

}

- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 withAnimationDuration:(CGFloat)a6 curve:(CGFloat)a7
{
  id WeakRetained;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double x;
  double y;
  CGFloat width;
  double height;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  dispatch_time_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double rect2a;
  double v71;
  CGRect rect;
  void *v73;
  id v74;
  double v75;
  double v76;
  double v77;
  double v78;
  _QWORD v79[4];
  id v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 8) + 24));
  objc_msgSend(WeakRetained, "documentScrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  objc_msgSend(v27, "convertRect:toView:", 0);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v89.origin.x = v29;
  v89.origin.y = v31;
  v89.size.width = v33;
  v89.size.height = v35;
  v71 = -(a7 - CGRectGetMaxY(v89));
  rect.origin.x = *(CGFloat *)MEMORY[0x24BDBF070];
  v68 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v67 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v66 = *(double *)(MEMORY[0x24BDBF070] + 24);
  objc_msgSend(v26, "bounds");
  objc_msgSend(v26, "convertRect:toView:", 0);
  x = v90.origin.x;
  y = v90.origin.y;
  width = v90.size.width;
  height = v90.size.height;
  v95.origin.x = a6;
  v95.origin.y = a7;
  v95.size.width = a8;
  v95.size.height = a9;
  if (CGRectIntersectsRect(v90, v95))
  {
    v91.origin.x = x;
    v91.origin.y = y;
    v91.size.width = width;
    v91.size.height = height;
    v96.origin.x = a6;
    v96.origin.y = a7;
    v96.size.width = a8;
    v96.size.height = a9;
    v92 = CGRectIntersection(v91, v96);
    v65 = height - (CGRectGetHeight(v92) + 0.0);
    objc_msgSend(v26, "convertRect:fromView:", 0, a12, a13, a14, a15);
    rect2a = v40;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v93.origin.x = x + 0.0;
    v93.size.height = v65;
    v93.origin.y = y + 0.0;
    v93.size.width = width;
    v97.origin.x = a12;
    v97.origin.y = a13;
    v97.size.width = a14;
    v97.size.height = a15;
    v47 = CGRectContainsRect(v93, v97);
    v48 = v66;
    v49 = v67;
    if (!v47)
    {
      v48 = v46;
      v49 = v44;
    }
    v50 = v68;
    if (!v47)
      v50 = v42;
    v51 = rect.origin.x;
    if (!v47)
      v51 = rect2a;
    rect.origin.x = v51;
  }
  else
  {
    v48 = v66;
    v49 = v67;
    v50 = v68;
  }
  objc_msgSend(v26, "contentInset");
  v53 = v52;
  objc_msgSend(v26, "_contentScrollInset");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  if (v53 >= v71)
    v60 = 0.0;
  else
    v60 = v71 - v53;
  v94.origin.x = rect.origin.x;
  v94.origin.y = v50;
  v94.size.width = v49;
  v94.size.height = v48;
  if (CGRectIsNull(v94))
  {
    if (v60 <= 0.0)
    {
      objc_msgSend(v26, "_setContentScrollInset:", v55, v57, v60, v59);
      goto LABEL_22;
    }
    v61 = dispatch_time(0, (uint64_t)(a16 * 1000000000.0));
    *(_QWORD *)&rect.origin.y = MEMORY[0x24BDAC760];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke_2;
    v73 = &unk_24C25D488;
    v74 = v26;
    v75 = v55;
    v76 = v57;
    v77 = v60;
    v78 = v59;
    dispatch_after(v61, MEMORY[0x24BDAC9B8], &rect.origin.y);
    v62 = v74;
  }
  else
  {
    if ((unint64_t)(a11 - 1) >= 3)
      v63 = 4;
    else
      v63 = ((a11 - 1) << 16) + 65540;
    v64 = (void *)MEMORY[0x24BDF6F90];
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke;
    v79[3] = &unk_24C25D460;
    v80 = v26;
    v81 = v55;
    v82 = v57;
    v83 = v60;
    v84 = v59;
    v85 = rect.origin.x;
    v86 = v50;
    v87 = v49;
    v88 = v48;
    objc_msgSend(v64, "animateWithDuration:delay:options:animations:completion:", v63, v79, 0, a16, 0.0);
    v62 = v80;
  }

LABEL_22:
}

uint64_t __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __124__PDFKitTextView_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_withAnimationDuration_curve___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)textView:(id)a3 doCommandBySelector:(SEL)a4
{
  return 0;
}

- (BOOL)handleTab
{
  id WeakRetained;
  id v4;
  void *v5;
  BOOL v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  v4 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v5 = v4;
  if (v4)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "PDFKitHandleTabInTextWidget:", WeakRetained);

  return v7;
}

- (BOOL)handleBackTab
{
  id WeakRetained;
  id v4;
  void *v5;
  BOOL v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  v4 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v5 = v4;
  if (v4)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "PDFKitHandleBackTabInTextWidget:", WeakRetained);

  return v7;
}

- (void)_setString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      -[PDFTextWidgetTextView setText:](self->_private->textView, "setText:", v7);
      v5 = v7;
    }
  }

}

- (void)_setFont:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  objc_msgSend(WeakRetained, "scaledFontForTextWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pointSize");
    if (v6 > 0.0)
      -[PDFTextWidgetTextView setFont:](self->_private->textView, "setFont:", v5);
  }

}

- (void)_setFontColor:(id)a3
{
  -[PDFTextWidgetTextView setTextColor:](self->_private->textView, "setTextColor:", a3);
}

- (void)_setAlignment:(int64_t)a3
{
  -[PDFTextWidgetTextView setTextAlignment:](self->_private->textView, "setTextAlignment:", a3);
}

- (void)_setup
{
  id WeakRetained;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  char v12;
  PDFKitTextViewPrivate *v13;
  PDFTextWidgetTextView *textView;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  PDFTextWidgetTextView *v24;
  double v25;
  double v26;
  double v27;
  __CFString *v28;
  __CFString *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  PDFTextWidgetTextView *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  PDFTextWidgetTextView *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[3];
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfPageView);
  v4 = objc_loadWeakRetained((id *)&self->_private->annotation);
  if (!v4)
    goto LABEL_31;
  v66 = self->_private->textView;
  objc_msgSend(v4, "widgetStringValue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontColor");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "alignment");
  objc_msgSend(v4, "backgroundColor");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "border");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/MK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borderColor");
  v68 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "shouldComb");
  v12 = objc_msgSend(v4, "isAppearanceStreamEmpty");
  -[PDFKitTextView _setString:](self, "_setString:", v5);
  v70 = (void *)v6;
  -[PDFKitTextView _setFont:](self, "_setFont:", v6);
  v64 = (void *)v7;
  -[PDFKitTextView _setFontColor:](self, "_setFontColor:", v7);
  -[PDFKitTextView _setAlignment:](self, "_setAlignment:", v8);
  v13 = self->_private;
  textView = v13->textView;
  if ((v12 & 1) != 0)
  {
    if (v9)
    {
      -[PDFTextWidgetTextView setBackgroundColor:](v13->textView, "setBackgroundColor:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFTextWidgetTextView setBackgroundColor:](textView, "setBackgroundColor:", v17);

    }
    if (!v69 || (objc_msgSend(v69, "lineWidth"), v18 <= 0.0))
    {
      v16 = -200.0;
      if (v11)
        goto LABEL_16;
      goto LABEL_18;
    }
    -[PDFTextWidgetTextView layer](self->_private->textView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v19, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v68), "CGColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    }
    -[PDFTextWidgetTextView layer](self->_private->textView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "lineWidth");
    objc_msgSend(v15, "setBorderWidth:");
    v16 = -200.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFTextWidgetTextView setBackgroundColor:](textView, "setBackgroundColor:", v15);
    v16 = 0.0;
  }

  if (v11)
  {
LABEL_16:
    -[PDFTextWidgetTextView setAllowsEditingTextAttributes:](self->_private->textView, "setAllowsEditingTextAttributes:", 1);
    -[PDFTextWidgetTextView textContainer](self->_private->textView, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineBreakMode:", 2);

    if (v5)
      -[PDFKitTextView _setAttributedString:](self, "_setAttributedString:", v5);
  }
LABEL_18:
  +[PDFAnnotationDrawing textInset](PDFAnnotationDrawing, "textInset");
  v23 = v22;
  v67 = WeakRetained;
  v65 = (void *)v5;
  v62 = v9;
  if ((objc_msgSend(v4, "isMultiline") & 1) != 0)
  {
    v24 = self->_private->textView;
    v25 = v23;
    v26 = v23;
    v27 = v23;
  }
  else
  {
    v28 = CFSTR("Wj");
    if (v5)
      v28 = (__CFString *)v5;
    v29 = v28;
    objc_msgSend(v4, "bounds", v9);
    v31 = v30;
    v33 = v32;
    v75 = *MEMORY[0x24BDF65F8];
    v76[0] = v70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString boundingRectWithSize:options:attributes:context:](v29, "boundingRectWithSize:options:attributes:context:", 1, v34, 0, v31, v33);
    v36 = v35;

    v25 = fmax((v33 - v36) * 0.5, 0.0);
    v24 = self->_private->textView;
    v26 = v23;
    v27 = v25;
  }
  -[PDFTextWidgetTextView setTextContainerInset:](v24, "setTextContainerInset:", v25, v26, v27, v23, v62);
  v37 = self->_private->textView;
  objc_msgSend(v4, "autoFillTextContentType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextWidgetTextView setTextContentType:](v37, "setTextContentType:", v38);

  v39 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.up"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithImage:style:target:action:", v40, 0, self, sel_handleBackTab);

  v42 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.down"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v42, "initWithImage:style:target:action:", v43, 0, self, sel_handleTab);

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v46 = objc_alloc(MEMORY[0x24BDF6868]);
  v74[0] = v41;
  v74[1] = v44;
  v74[2] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v46, "initWithBarButtonItems:representativeItem:", v47, 0);

  v73 = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextWidgetTextView inputAssistantItem](self->_private->textView, "inputAssistantItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLeadingBarButtonGroups:", v49);

  if (objc_msgSend(v4, "isMultiline"))
  {
    v51 = objc_alloc(MEMORY[0x24BDF6860]);
    PDFKitLocalizedString(CFSTR("Done"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithTitle:style:target:action:", v52, 2, self, sel__textWidgetDone);

    v54 = objc_alloc(MEMORY[0x24BDF6868]);
    v72 = v53;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v54, "initWithBarButtonItems:representativeItem:", v55, 0);

    v71 = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFTextWidgetTextView inputAssistantItem](self->_private->textView, "inputAssistantItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setTrailingBarButtonGroups:", v57);

  }
  else
  {
    if (!v70)
    {
      v59 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      objc_msgSend(v59, "systemFontOfSize:");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PDFTextWidgetTextView setScrollEnabled:](self->_private->textView, "setScrollEnabled:", 0);
    -[PDFTextWidgetTextView setReturnKeyType:](self->_private->textView, "setReturnKeyType:", 9);
  }

  -[PDFTextWidgetTextView layer](self->_private->textView, "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setZPosition:", v16);

  -[PDFTextWidgetTextView layer](self->_private->textView, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setDrawsAsynchronously:", 1);

  objc_msgSend(v4, "setControl:", self);
  WeakRetained = v67;
  if (v67)
  {
    -[PDFKitTextView _setupTopLevelView](self, "_setupTopLevelView");
    objc_msgSend(v67, "addSubview:", self->_private->topLevelView);
    -[PDFKitTextView _updateScaleFactor](self, "_updateScaleFactor");
    -[PDFKitTextView becomeFirstResponder](self, "becomeFirstResponder");
  }

LABEL_31:
}

- (void)_setupTopLevelView
{
  id v3;
  UIView *v4;
  PDFTextWidgetTextView *textView;
  double v6;
  double v7;
  PDFKitTextViewPrivate *v8;
  UIView *topLevelView;

  v3 = objc_alloc(MEMORY[0x24BDF6D50]);
  -[PDFTextWidgetTextView frame](self->_private->textView, "frame");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  -[UIView setScrollEnabled:](v4, "setScrollEnabled:", 0);
  -[UIView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
  -[UIView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
  -[UIView addSubview:](v4, "addSubview:", self->_private->textView);
  textView = self->_private->textView;
  -[PDFTextWidgetTextView frame](textView, "frame");
  v7 = v6;
  -[PDFTextWidgetTextView frame](self->_private->textView, "frame");
  -[PDFTextWidgetTextView setFrame:](textView, "setFrame:", 0.0, 0.0, v7);
  -[PDFTextWidgetTextView setAutoresizingMask:](self->_private->textView, "setAutoresizingMask:", 18);
  v8 = self->_private;
  topLevelView = v8->topLevelView;
  v8->topLevelView = v4;

}

- (void)_setAttributedString:(id)a3
{
  PDFAnnotation **p_annotation;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  p_annotation = &self->_private->annotation;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_annotation);
  objc_msgSend(WeakRetained, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/MaxLen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (!v7)
  {
    v10 = (void *)MEMORY[0x24BDF6A70];
    -[PDFTextWidgetTextView frame](self->_private->textView, "frame");
    objc_msgSend(v10, "systemFontOfSize:", v11 + -2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (double)v9;
  v26 = *MEMORY[0x24BDF65F8];
  v13 = v26;
  v27[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v14);
  v16 = v15;

  v17 = (double)(unint64_t)objc_msgSend(v5, "length");
  objc_msgSend(WeakRetained, "bounds");
  v19 = (v18 + -v16 / v17 * v12) / v12;
  v20 = objc_msgSend(v5, "length");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v5);

  v22 = *MEMORY[0x24BDF6608];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAttribute:value:range:", v22, v23, 0, v20);

  objc_msgSend(v21, "addAttribute:value:range:", *MEMORY[0x24BDF6610], &unk_24C27D838, 0, v20);
  objc_msgSend(v21, "addAttribute:value:range:", v13, v7, 0, v20);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  objc_msgSend(v25, "setLineBreakMode:", 2);
  objc_msgSend(v21, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v25, 0, v20);
  -[PDFTextWidgetTextView setAttributedText:](self->_private->textView, "setAttributedText:", v21);

}

- (void)_updateScaleFactor
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "scaleFactor");
  v5 = v4 * PDFScreenGetBackingScaleFactor();

  -[PDFKitTextView _applyScale:toView:](self, "_applyScale:toView:", self->_private->topLevelView, v5);
}

- (void)_applyScale:(double)a3 toView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "setContentScaleFactor:", a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v6, "subviews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[PDFKitTextView _applyScale:toView:](self, "_applyScale:toView:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), a3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
