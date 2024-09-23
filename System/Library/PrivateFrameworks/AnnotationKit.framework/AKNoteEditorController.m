@implementation AKNoteEditorController

- (NSString)editedText
{
  void *v2;
  void *v3;
  void *v4;

  -[AKNoteEditorController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (double)suggestedEditorHeightForWidth:(double)a3
{
  return 170.0;
}

- (void)beginEditing:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  AKNoteEditorViewController *v13;
  void *v14;
  AKNoteEditorViewController *v15;
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
  id v27;

  -[AKNoteEditorController delegate](self, "delegate", a3);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stickyViewFrameForNoteEditor:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v27, "stickyContainerForNoteEditor:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "edgeForNoteEditor:", self))
  {
    v13 = [AKNoteEditorViewController alloc];
    +[AKController akBundle](AKController, "akBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AKNoteEditorViewController initWithNibName:bundle:](v13, "initWithNibName:bundle:", CFSTR("AKNoteEditorViewController"), v14);

    -[AKNoteEditorViewController setDelegate:](v15, "setDelegate:", self);
    -[AKNoteEditorController annotation](self, "annotation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorViewController setAnnotation:](v15, "setAnnotation:", v16);

    -[AKNoteEditorViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 7);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorViewController view](v15, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    -[AKNoteEditorViewController setPreferredContentSize:](v15, "setPreferredContentSize:", 320.0, 200.0);
    -[AKNoteEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSourceView:", v12);

    -[AKNoteEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSourceRect:", v5, v7, v9, v11);

    -[AKNoteEditorController annotation](self, "annotation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorController _popupBackgroundColorForPopupAnnotation:](self, "_popupBackgroundColorForPopupAnnotation:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v23);

    -[AKNoteEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", self);

    objc_msgSend(v27, "popoverPresentingViewControllerForNoteEditor:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorController setContentViewController:](self, "setContentViewController:", v15);
    objc_msgSend(v26, "presentViewController:animated:completion:", v15, 1, 0);

  }
}

- (void)finishEditing
{
  void *v3;
  void *v4;
  id v5;

  -[AKNoteEditorController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "noteEditorWillDismissFromFullScreen:", self);
  -[AKNoteEditorController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)noteEditorViewControllerDidBeginEditing:(id)a3
{
  id v4;

  -[AKNoteEditorController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteEditorDidBeginEditing:", self);

}

- (void)noteEditorViewControllerDidEndEditing:(id)a3
{
  id v4;

  -[AKNoteEditorController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteEditorDidFinishEditing:", self);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 0;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5;
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

  v5 = a3;
  -[AKNoteEditorController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "noteEditorWillPresentFullScreen:", self);
  objc_msgSend(v5, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKNoteEditorController annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKNoteEditorController _popupBackgroundColorForPopupAnnotation:](self, "_popupBackgroundColorForPopupAnnotation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v7);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_finishEditing);
  objc_msgSend(v12, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v13);

  return v12;
}

- (id)_popupBackgroundColorForPopupAnnotation:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  int64_t v7;
  void *v8;

  objc_msgSend(a3, "parentAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:](AKHighlightAppearanceHelper, "attributeTagForHighlightOfColor:", v6);

  }
  else
  {
    v7 = 765200;
  }
  +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AKPopupAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (AKNoteEditorControllerDelegate)delegate
{
  return (AKNoteEditorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKNoteEditorViewController)contentViewController
{
  return (AKNoteEditorViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
