@implementation MFMailComposeRecipientTextView

- (MFMailComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  MFMailComposeRecipientTextView *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMailComposeRecipientTextView;
  v3 = -[CNComposeRecipientTextView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__textInputDidChange_, *MEMORY[0x1E0DC5528], 0);

    -[MFMailComposeRecipientTextView inputAssistantItem](v3, "inputAssistantItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setShowsBarButtonItemsInline:", 0);

    v6 = objc_alloc_init(MEMORY[0x1E0CD1210]);
    objc_msgSend(v6, "setDelegate:", v3);
    objc_msgSend(v6, "setElementSource:", v3);
    -[MFMailComposeRecipientTextView addInteraction:](v3, "addInteraction:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[MFMailComposeRecipientTextView addInteraction:](v3, "addInteraction:", v7);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeRecipientTextView;
  -[CNComposeRecipientTextView dealloc](&v4, sel_dealloc);
}

- (id)nextResponder
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[MFMailComposeRecipientTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "nextResponderForRecipientView:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMailComposeRecipientTextView;
    -[MFMailComposeRecipientTextView nextResponder](&v7, sel_nextResponder);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)setDisplayMetrics:(id)a3
{
  MFComposeDisplayMetrics *v5;

  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMailComposeRecipientTextView _displayMetricsDidChange](self, "_displayMetricsDidChange");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
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
  void *v16;
  id v17;

  -[MFMailComposeRecipientTextView traitCollection](self, "traitCollection", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeRecipientTextView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeRecipientTextView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeRecipientTextView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)layoutMarginsDidChange
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
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeRecipientTextView;
  -[MFMailComposeRecipientTextView layoutMarginsDidChange](&v17, sel_layoutMarginsDidChange);
  -[MFMailComposeRecipientTextView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeRecipientTextView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeRecipientTextView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeRecipientTextView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)_displayMetricsDidChange
{
  id v3;
  id v4;

  -[MFMailComposeRecipientTextView displayMetrics](self, "displayMetrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerViewSeparatorInset");
  -[MFMailComposeRecipientTextView setSeparatorDirectionalEdgeInsets:](self, "setSeparatorDirectionalEdgeInsets:");

  -[MFMailComposeRecipientTextView displayMetrics](self, "displayMetrics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingButtonMidlineOffset");
  -[CNComposeRecipientTextView setTrailingButtonMidlineInsetFromLayoutMargin:](self, "setTrailingButtonMidlineInsetFromLayoutMargin:");

}

- (void)_textInputDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  id v7;
  id v8;

  -[CNComposeRecipientTextView textView](self, "textView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    v6 = -[UIResponder mf_textAlignmentForActiveInputLanguage](self, "mf_textAlignmentForActiveInputLanguage");
    -[CNComposeRecipientTextView textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", v6);

  }
}

- (void)addRecipient:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeRecipientTextView;
  -[CNComposeRecipientTextView addRecipient:](&v6, sel_addRecipient_, v4);
  -[MFMailComposeRecipientTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "composeRecipientView:didFinishAddingRecipient:", self, v4);

}

- (void)appendText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNComposeRecipientTextView becomeFirstResponder](self, "becomeFirstResponder");
  -[CNComposeRecipientTextView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertText:", v5);

}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  if (-[CNComposeRecipientTextView isFirstResponder](self, "isFirstResponder"))
    v7 = 0;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  -[MFMailComposeRecipientTextView label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9, v7);

}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a6;
  -[CNComposeRecipientTextView becomeFirstResponder](self, "becomeFirstResponder");
  -[CNComposeRecipientTextView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  if (-[CNComposeRecipientTextView usingActiveAppearance](self, "usingActiveAppearance"))
  {
    -[CNComposeRecipientTextView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    -[MFMailComposeRecipientTextView convertPoint:toView:](self, "convertPoint:toView:", v7);
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "glyphIndexForPoint:inTextContainer:", v13, v9, v11);

  }
  else
  {
    v14 = 0;
  }
  -[MFMailComposeRecipientTextView pointerRectForLineContainingGlyphIndex:](self, "pointerRectForLineContainingGlyphIndex:", v14);
  objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0DC3B30];
  -[MFMailComposeRecipientTextView beamHeight](self, "beamHeight", a3, a4);
  objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithShape:constrainedAxes:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)pointerRectForLineContainingGlyphIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[CNComposeRecipientTextView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineFragmentRectForGlyphAtIndex:effectiveRange:", a3, 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  if (CGRectIsEmpty(v33))
  {
    objc_msgSend(v5, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extraLineFragmentRect");
    v8 = v16;
    v10 = v17;
    v12 = v18;

  }
  -[MFMailComposeRecipientTextView beamHeight](self, "beamHeight");
  v20 = v19;
  objc_msgSend(v5, "textContainerInset");
  v22 = v21;
  objc_msgSend(v5, "textContainerInset");
  v24 = v23;
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v20;
  v35 = CGRectOffset(v34, v22, v24);
  -[MFMailComposeRecipientTextView convertRect:fromView:](self, "convertRect:fromView:", v5, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
  v37 = CGRectInset(v36, 0.0, v20 * -0.75);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;

  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (double)beamHeight
{
  void *v3;
  void *v4;
  void *v5;
  double Height;
  CGRect v8;

  -[CNComposeRecipientTextView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caretRectForPosition:", v5);
  Height = CGRectGetHeight(v8);

  return Height;
}

- (NSArray)people
{
  void *v3;
  void *v4;
  void *v5;

  -[CNComposeRecipientTextView addresses](self, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNComposeRecipientTextView addresses](self, "addresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

id __40__MFMailComposeRecipientTextView_people__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "em_person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
}

@end
