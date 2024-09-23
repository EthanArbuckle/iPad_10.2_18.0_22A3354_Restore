@implementation MUQuickLookContentEditorViewController

- (MUQuickLookContentEditorViewController)init
{
  MUQuickLookContentEditorViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUQuickLookContentEditorViewController;
  v2 = -[MUQuickLookContentEditorViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController setBackgroundColor:](v2, "setBackgroundColor:", v3);

  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent")
    && -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") == 1)
  {
    if (v3)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __57__MUQuickLookContentEditorViewController_viewWillAppear___block_invoke;
      v5[3] = &unk_24E5D4068;
      v5[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.2);
    }
    else
    {
      -[MUQuickLookContentEditorViewController updateThumbnailView](self, "updateThumbnailView");
    }
  }
}

uint64_t __57__MUQuickLookContentEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateThumbnailView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
    -[MUQuickLookContentEditorViewController _updatePeekSize](self, "_updatePeekSize");
}

- (void)_updatePeekSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  -[MUQuickLookContentEditorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v19;
  if (v19)
  {
    objc_msgSend(v19, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[MUQuickLookContentEditorViewController presentationMode](self, "presentationMode");
    v14 = v6 + -5.0;
    v15 = v8 + -5.0;
    if (v13 == 1)
    {
      v12 = v12 + 10.0;
      v10 = v10 + 10.0;
      v8 = v8 + -5.0;
      v6 = v6 + -5.0;
    }
    -[MUQuickLookContentEditorViewController view](self, "view", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    v17 = CGRectEqualToRect(v20, v21);

    v4 = v19;
    if (!v17)
    {
      -[MUQuickLookContentEditorViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v6, v8, v10, v12);

      v4 = v19;
    }
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  objc_super v13;

  if (sel_find_ == a3 || sel_findPrevious_ == a3 || sel_findNext_ == a3)
  {
    v8 = a4;
    -[MarkupViewController contentViewController](self, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "canPerformAction:withSender:", a3, v8);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUQuickLookContentEditorViewController;
    v10 = a4;
    v11 = -[MarkupViewController canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v10);

  }
  return v11;
}

+ (CGSize)suggestedContentSizeForURL:(id)a3
{
  const __CFURL *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGImageSourceRef v12;
  CGImageSourceRef v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = (const __CFURL *)a3;
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v4)
  {
    +[MUImageDownsamplingUtilities _sourceContentType:](MUImageDownsamplingUtilities, "_sourceContentType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF84E0]))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE30F0]), "initWithURL:", v4);
      objc_msgSend(a1, "_suggestedContentSizeForPDF:", v9);
      v5 = v10;
      v6 = v11;

    }
    else if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8410]))
    {
      v12 = CGImageSourceCreateWithURL(v4, 0);
      if (v12)
      {
        v13 = v12;
        objc_msgSend(a1, "_suggestedContentSizeForImageSource:", v12);
        v5 = v14;
        v6 = v15;
        CFRelease(v13);
      }
    }

  }
  v16 = v5;
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)suggestedContentSizeForData:(id)a3
{
  const __CFData *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGImageSourceRef v12;
  CGImageSourceRef v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = (const __CFData *)a3;
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v4)
  {
    +[MUImageDownsamplingUtilities _sourceContentType:](MUImageDownsamplingUtilities, "_sourceContentType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF84E0]))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE30F0]), "initWithData:", v4);
      objc_msgSend(a1, "_suggestedContentSizeForPDF:", v9);
      v5 = v10;
      v6 = v11;

    }
    else if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8410]))
    {
      v12 = CGImageSourceCreateWithData(v4, 0);
      if (v12)
      {
        v13 = v12;
        objc_msgSend(a1, "_suggestedContentSizeForImageSource:", v12);
        v5 = v14;
        v6 = v15;
        CFRelease(v13);
      }
    }

  }
  v16 = v5;
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3
{
  CGImageRef ImageAtIndex;
  CGImageRef v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    v4 = ImageAtIndex;
    CGImageGetSizeAfterOrientation();
    v6 = v5;
    v8 = v7;
    CFRelease(v4);
  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)_suggestedContentSizeForPDF:(id)a3
{
  id v3;
  void *v4;
  CGFloat width;
  CGFloat height;
  void *v7;
  double v8;
  double v9;
  CGSize result;
  CGRect BoxRect;

  v3 = a3;
  v4 = v3;
  width = *MEMORY[0x24BDBF148];
  height = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v3 && objc_msgSend(v3, "pageCount"))
  {
    objc_msgSend(v4, "pageAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)objc_msgSend(v7, "pageRef"), kCGPDFMediaBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;

  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10;

  v10 = a6;
  -[MarkupViewController setData:withArchivedModelData:placeholderImage:](self, "setData:withArchivedModelData:placeholderImage:", a3, a4, a5);
  -[MUQuickLookContentEditorViewController _handleLoadingWithCompletion:](self, "_handleLoadingWithCompletion:", v10);

}

- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10;

  v10 = a6;
  -[MarkupViewController setFileURL:withArchivedModelData:placeholderImage:](self, "setFileURL:withArchivedModelData:placeholderImage:", a3, a4, a5);
  -[MUQuickLookContentEditorViewController _handleLoadingWithCompletion:](self, "_handleLoadingWithCompletion:", v10);

}

- (void)_handleLoadingWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent")
      && (-[MarkupViewController _pdfView](self, "_pdfView"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if (!-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDD0BA0];
      v10[0] = CFSTR("MUQuickLookContentEditorViewController failed to load content");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MarkupUI.MUQuickLookContentEditorViewController"), 1, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v6 = 0;
LABEL_8:
    v4[2](v4, v6);

  }
}

- (BOOL)_canShowWhileLocked
{
  void *v3;
  char v4;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "editorCanShowWhileLocked:", self);
  else
    v4 = 1;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    -[MUQuickLookContentEditorViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "horizontalSizeClass");
    if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
    {
      -[MUQuickLookContentEditorViewController traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "userInterfaceIdiom");
      v9 = objc_msgSend(v4, "userInterfaceIdiom");

      if (v8 == v9)
        goto LABEL_12;
    }
    else
    {

    }
    -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
  }
  else if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    v10 = objc_msgSend(v4, "horizontalSizeClass");
    -[MUQuickLookContentEditorViewController traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "horizontalSizeClass");

    if (v10 != v12
      && -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") == 1
      && !objc_msgSend(v4, "horizontalSizeClass"))
    {
      -[MUQuickLookContentEditorViewController updateThumbnailView](self, "updateThumbnailView");
    }
  }
LABEL_12:

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent")
    && -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") == 1)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __100__MUQuickLookContentEditorViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_24E5D4090;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MUQuickLookContentEditorViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);

}

uint64_t __100__MUQuickLookContentEditorViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateThumbnailViewWithTraitCollection:", *(_QWORD *)(a1 + 40));
}

- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 forPage:(id)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a4;
  if (-[MUQuickLookContentEditorViewController delegateRespondsToDetectedFormInContent](self, "delegateRespondsToDetectedFormInContent", a3, a4, a5)&& v5&& !-[MUQuickLookContentEditorViewController formDetectedInDocument](self, "formDetectedInDocument"))
  {
    -[MUQuickLookContentEditorViewController setFormDetectedInDocument:](self, "setFormDetectedInDocument:", 1);
    -[MarkupViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editor:detectedFormInContent:", self, 1);

  }
}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  -[MarkupViewController undoManager](self, "undoManager", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController actionsNotEnablingMarkup](self, "actionsNotEnablingMarkup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "undoActionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  -[MUQuickLookContentEditorViewController actionsNotEnablingMarkup](self, "actionsNotEnablingMarkup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "redoActionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (a4)
    v12 = 0;
  else
    v12 = (v8 | v11) ^ 1u;
  -[MUQuickLookContentEditorViewController _detectedEditEnablingMarkup:](self, "_detectedEditEnablingMarkup:", v12);

}

- (void)editDetectedForAnnotationController:(id)a3
{
  -[MUQuickLookContentEditorViewController _detectedEditEnablingMarkup:](self, "_detectedEditEnablingMarkup:", 1);
}

- (void)contentControllerDidUnlockDocument:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[MarkupViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "editorDidUnlockDocument:", self);
      v5 = v7;
    }
  }

}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController setAnnotationEditingEnabled:](&v6, sel_setAnnotationEditingEnabled_);
  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    if (v3)
      -[MUQuickLookContentEditorViewController flattenImageForAnalysis](self, "flattenImageForAnalysis");
    -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enableMarkupMode:", v3);

  }
}

- (UIView)transitioningView
{
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
    -[MarkupViewController _pdfView](self, "_pdfView");
  else
    -[MUQuickLookContentEditorViewController view](self, "view");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)documentIsLocked
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent");
  if (v3)
  {
    -[MarkupViewController _pdfDocument](self, "_pdfDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLocked");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)canEncryptDocument
{
  void *v3;
  void *v4;
  int v5;

  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    -[MarkupViewController _pdfDocument](self, "_pdfDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "isEncrypted") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (!-[MUQuickLookContentEditorViewController didAppearOnce](self, "didAppearOnce")
    && !a3
    && self->_presentationMode == 1)
  {
    -[MUQuickLookContentEditorViewController setDidAppearOnce:](self, "setDidAppearOnce:", 1);
  }
  self->_presentationMode = a3;
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    -[MUQuickLookContentEditorViewController _setPresentationModeForPDFContent:](self, "_setPresentationModeForPDFContent:", a3);
  }
  else if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    -[MUQuickLookContentEditorViewController _setPresentationModeForImageContent:](self, "_setPresentationModeForImageContent:", a3);
  }
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)flattenImageForAnalysis
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[MUQuickLookContentEditorViewController _editedImageAnalysisQueue](self, "_editedImageAnalysisQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__MUQuickLookContentEditorViewController_flattenImageForAnalysis__block_invoke;
  v4[3] = &unk_24E5D40B8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__MUQuickLookContentEditorViewController_flattenImageForAnalysis__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_flattenImageForAnalysis");

}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[5];

  v4 = a4;
  v5 = a3;
  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateForFullScreen:animated:", v5, v4);

    -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
  }
  else if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    if (v4)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __71__MUQuickLookContentEditorViewController_updateForFullScreen_animated___block_invoke;
      v8[3] = &unk_24E5D4068;
      v8[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v8, 0.2);
    }
    else
    {
      -[MUQuickLookContentEditorViewController updateThumbnailView](self, "updateThumbnailView");
    }
  }
}

uint64_t __71__MUQuickLookContentEditorViewController_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateThumbnailView");
}

- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shouldHideInteraction:animated:", v5, v4);

  }
}

- (UIFindInteraction)findInteraction
{
  void *v3;
  void *v4;

  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    -[MarkupViewController _pdfView](self, "_pdfView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIFindInteraction *)v4;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    v5 = -[MUQuickLookContentEditorViewController _imageAnalysisOverlayAcceptSingleTouch:](self, "_imageAnalysisOverlayAcceptSingleTouch:", v4);
  }
  else
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "acceptSingleTouch:", v4);

  }
  return v5;
}

- (void)updateThumbnailView
{
  id v3;

  -[MUQuickLookContentEditorViewController traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController _updateThumbnailViewWithTraitCollection:](self, "_updateThumbnailViewWithTraitCollection:", v3);

}

- (BOOL)isInteractionActive
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractionActive");

  return v3;
}

- (BOOL)hasResultsForVisualSearch
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasResultsForVisualSearch");

  return v3;
}

- (void)infoButtonTapped
{
  id v2;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoButtonTapped");

}

- (BOOL)_presentationModeAllowsEditing
{
  return -[MUQuickLookContentEditorViewController presentationMode](self, "presentationMode") == 0;
}

- (BOOL)canEditPDF
{
  _BOOL4 v3;

  v3 = -[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent");
  if (v3)
    LOBYTE(v3) = -[MUQuickLookContentEditorViewController canEditContent](self, "canEditContent");
  return v3;
}

- (BOOL)canEditContent
{
  void *v3;
  BOOL v4;

  if (!-[MUQuickLookContentEditorViewController _presentationModeAllowsEditing](self, "_presentationModeAllowsEditing"))
    return 0;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canEditContent"))
    v4 = -[MUQuickLookContentEditorViewController allowsEditing](self, "allowsEditing");
  else
    v4 = 0;

  return v4;
}

- (BOOL)allowsEditing
{
  void *v3;
  char v4;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "editorShouldAllowEditingContents:", self);
  else
    v4 = 1;

  return v4;
}

- (id)getMenuElementsForPage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id location[2];

  v4 = a3;
  if (-[MUQuickLookContentEditorViewController canEditPDF](self, "canEditPDF"))
  {
    objc_initWeak(location, self);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (void *)MEMORY[0x24BDF67B8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Rotate Left"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rotate.left"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke;
    v62[3] = &unk_24E5D40E0;
    objc_copyWeak(&v64, location);
    v10 = v4;
    v63 = v10;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v9, CFSTR("rotate_left"), v62);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v11);
    v46 = (void *)v11;
    v12 = (void *)MEMORY[0x24BDF67B8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Rotate Right"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rotate.right"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_2;
    v59[3] = &unk_24E5D40E0;
    objc_copyWeak(&v61, location);
    v16 = v10;
    v60 = v16;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, v15, CFSTR("rotate_right"), v59);
    v17 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v17;
    objc_msgSend(v5, "addObject:", v17);
    v18 = (void *)MEMORY[0x24BDF67B8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Insert Blank Page"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("doc.badge.plus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_3;
    v56[3] = &unk_24E5D40E0;
    objc_copyWeak(&v58, location);
    v22 = v16;
    v57 = v22;
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v21, CFSTR("insert_blank_page"), v56);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v23);
    v43 = (void *)v23;
    v44 = v4;
    v24 = (void *)MEMORY[0x24BDF67B8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Insert from File"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("folder"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_4;
    v53[3] = &unk_24E5D40E0;
    objc_copyWeak(&v55, location);
    v28 = v22;
    v54 = v28;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, v27, CFSTR("insert_page_from_file"), v53);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v29);
    if (objc_msgSend(MEMORY[0x24BDFA1B8], "isSupported"))
    {
      v30 = (void *)MEMORY[0x24BDF67B8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Scan Pages"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("doc.text.viewfinder"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_5;
      v50[3] = &unk_24E5D40E0;
      objc_copyWeak(&v52, location);
      v51 = v28;
      objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", v32, v33, CFSTR("insert_pages_from_scanner"), v50);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v34);
      objc_destroyWeak(&v52);
    }
    -[MarkupViewController _pdfDocument](self, "_pdfDocument");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "pageCount");

    if (v36 >= 2)
    {
      v37 = (void *)MEMORY[0x24BDF67B8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_6;
      v47[3] = &unk_24E5D40E0;
      objc_copyWeak(&v49, location);
      v48 = v28;
      objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v39, v40, CFSTR("delete_page"), v47);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setAttributes:", 2);
      objc_msgSend(v5, "addObject:", v41);

      objc_destroyWeak(&v49);
    }

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&v64);
    objc_destroyWeak(location);
    v4 = v44;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_rotatePage:clockwise:", *(_QWORD *)(a1 + 32), 0);

}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_rotatePage:clockwise:", *(_QWORD *)(a1 + 32), 1);

}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_insertBlankPageAfterPage:", *(_QWORD *)(a1 + 32));

}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_insertPageFromFileAfterPage:", *(_QWORD *)(a1 + 32));

}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_insertPagesFromScannerAfterPage:", *(_QWORD *)(a1 + 32));

}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deletePage:", *(_QWORD *)(a1 + 32));

}

- (void)convertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MUQuickLookContentEditorViewController sharedSerialPagesEditionQueue](self, "sharedSerialPagesEditionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__MUQuickLookContentEditorViewController_convertToPDFAndWrite_completionHandler___block_invoke;
  v11[3] = &unk_24E5D4108;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__MUQuickLookContentEditorViewController_convertToPDFAndWrite_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_convertToPDFAndWrite:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  v6 = a3;
  -[MUQuickLookContentEditorViewController scanPDFHandler](self, "scanPDFHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MarkupUI.MUQuickLookContentEditorViewController"), 3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);
    -[MUQuickLookContentEditorViewController setScanPDFHandler:](self, "setScanPDFHandler:", 0);

  }
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MUQuickLookContentEditorViewController *v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke;
  v9[3] = &unk_24E5D4180;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v10 = v8;
  v11 = self;
  -[MUQuickLookContentEditorViewController convertToPDFAndWrite:completionHandler:](self, "convertToPDFAndWrite:completionHandler:", v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_2;
    v5[3] = &unk_24E5D4158;
    v6 = *(id *)(a1 + 32);
    objc_copyWeak(&v9, (id *)(a1 + 48));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

    objc_destroyWeak(&v9);
  }

}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_3;
  v4[3] = &unk_24E5D4130;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v4);

  objc_destroyWeak(&v6);
}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "scanPDFHandler");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v5, "setScanPDFHandler:", 0);
    }

    WeakRetained = v5;
  }

}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  NSLog(CFSTR("Inserting PDF page from scanner in %@ failed with error: %@"), self, v6);
  -[MUQuickLookContentEditorViewController scanPDFHandler](self, "scanPDFHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    -[MUQuickLookContentEditorViewController setScanPDFHandler:](self, "setScanPDFHandler:", 0);
  }
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)sharedSerialPagesEditionQueue
{
  if (sharedSerialPagesEditionQueue_onceToken != -1)
    dispatch_once(&sharedSerialPagesEditionQueue_onceToken, &__block_literal_global);
  return (id)sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue;
}

void __71__MUQuickLookContentEditorViewController_sharedSerialPagesEditionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.markup.pdf-pages-edition.serial-queue", attr);
  v2 = (void *)sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue;
  sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue = (uint64_t)v1;

}

- (id)pdfPageOptionsForImageRef:(CGImage *)a3 withPreviousPage:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "boundsForBox:", 0);
  v5 = v4;
  CGImageGetSizeAfterOrientation();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", 0.0, 0.0, v5, v5 * v6 / v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDE31F0];
  v12[0] = *MEMORY[0x24BDE31E8];
  v12[1] = v9;
  v13[0] = v8;
  v13[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)insertPages:(id)a3 atIndexes:(id)a4 inDocument:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v25, "count");
  if (v10 == objc_msgSend(v8, "count"))
  {
    v11 = objc_msgSend(v8, "count");
    v12 = v25;
    if (v11)
    {
      for (i = 0; i < v16; ++i)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertPage:atIndex:", v14, objc_msgSend(v15, "unsignedIntegerValue"));

        v16 = objc_msgSend(v8, "count");
        v12 = v25;
      }
    }
    v17 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 >= 2)
      v20 = CFSTR("Insert pages");
    else
      v20 = CFSTR("Insert page");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](self, "_registerActionNotEnablingMarkup:", v21);
    -[MarkupViewController undoManager](self, "undoManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "prepareWithInvocationTarget:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_deletePages:inDocument:", v25, v9);

    -[MarkupViewController undoManager](self, "undoManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActionName:", v21);

  }
  else
  {
    NSLog(CFSTR("Number of pages to insert is different from the number of indexes"));
  }

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Importing %@"), v5);

  -[MUQuickLookContentEditorViewController importHandler](self, "importHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, 0);
    -[MUQuickLookContentEditorViewController setImportHandler:](self, "setImportHandler:", 0);
  }

}

- (void)documentPickerWasCancelled:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("Document picking for PDF page insertion was cancelled."), a2, a3);
  -[MUQuickLookContentEditorViewController importHandler](self, "importHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = CFSTR("Document picker was cancelled.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MarkupUI.MUQuickLookContentEditorViewController"), 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v7);
    -[MUQuickLookContentEditorViewController setImportHandler:](self, "setImportHandler:", 0);

  }
}

- (void)find:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformAction:withSender:", sel_find_, v7);

  if (v5)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "find:", v7);

  }
}

- (void)findPrevious:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformAction:withSender:", sel_findPrevious_, v7);

  if (v5)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPrevious:", v7);

  }
}

- (void)findNext:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformAction:withSender:", sel_findNext_, v7);

  if (v5)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findNext:", v7);

  }
}

- (BOOL)isVisualSearchEnabled
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisualSearchEnabled");

  return v3;
}

- (NSString)filledInfoButtonGlyphName
{
  void *v2;
  void *v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filledInfoButtonGlyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)infoButtonGlyphName
{
  void *v2;
  void *v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoButtonGlyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setupAndStartImageAnalysisIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    if (+[MUImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](MUImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", -[MUQuickLookContentEditorViewController presentationMode](self, "presentationMode")))
    {
      -[MUQuickLookContentEditorViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
    }
  }
}

- (void)stopImageAnalysis
{
  id v2;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopImageAnalysis");

}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHighlightTextAndDDAfterNextAnalysis");

  return v3;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHighlightTextAndDDAfterNextAnalysis:", v3);

}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldEnterVisualSearchAfterNextAnalysis");

  return v3;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldEnterVisualSearchAfterNextAnalysis:", v3);

}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  void *v2;
  char v3;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpliftSubjectAfterNextAnalysis");

  return v3;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpliftSubjectAfterNextAnalysis:", v3);

}

- (UIImage)imageForAnalysis
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent"))
  {
    -[MUQuickLookContentEditorViewController latestImageForAnalysis](self, "latestImageForAnalysis");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[MarkupViewController contentViewController](self, "contentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageForAnalysis");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return (UIImage *)v5;
}

- (NSDictionary)clientPreviewOptions
{
  void *v2;
  void *v3;

  -[MarkupViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientPreviewOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[MarkupViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editor:needsToUpdateChromeWithAnimation:", self, v3);

}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  id v3;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editor:willPresentViewControllerWithAnimation:", self, 0);

}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  id v3;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editor:didDismissViewControllerWithAnimation:", self, 0);

}

- (id)_editedImageAnalysisQueue
{
  if (_editedImageAnalysisQueue_onceToken != -1)
    dispatch_once(&_editedImageAnalysisQueue_onceToken, &__block_literal_global_168);
  return (id)_editedImageAnalysisQueue_queue;
}

void __67__MUQuickLookContentEditorViewController__editedImageAnalysisQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.markup.edited-image-analysis.serial-queue", attr);
  v2 = (void *)_editedImageAnalysisQueue_queue;
  _editedImageAnalysisQueue_queue = (uint64_t)v1;

}

- (void)_adjustImageInteractionForScrollEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustImageInteractionForScrollView:", v4);

  -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  void *v3;
  void *v4;
  MUImageAnalysisManager *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasAnalysis"))
    {
      objc_msgSend(v10, "addInteractionIfNeeded");
      objc_msgSend(v10, "setupAnalysisButtonsContainer");
      -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
LABEL_5:
      v4 = v10;
      goto LABEL_10;
    }
    if ((objc_msgSend(v10, "isAnalysisOngoing") & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v10, "stopImageAnalysis");
  }
  v5 = [MUImageAnalysisManager alloc];
  -[MUQuickLookContentEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUImageAnalysisManager initWithDelegate:presentingView:](v5, "initWithDelegate:presentingView:", self, v6);

  -[MUQuickLookContentEditorViewController setImageAnalysisManager:](self, "setImageAnalysisManager:", v7);
  -[MarkupViewController contentViewController](self, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setScrollViewDelegate:", self);
  -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");

  v4 = (void *)v7;
LABEL_10:

}

- (BOOL)_imageAnalysisOverlayAcceptSingleTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;

  v4 = a3;
  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController imageAnalysisView](self, "imageAnalysisView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  if (v6 && v5)
  {
    objc_msgSend(v4, "locationInView:", v6);
    v9 = v8;
    v11 = v10;
    if (objc_msgSend(v4, "_isPointerTouch")
      && objc_msgSend(v5, "isTextSelectionEnabled")
      && (objc_msgSend(v5, "textExistsAtPoint:", v9, v11) & 1) != 0
      || (objc_msgSend(v5, "dataDetectorExistsAtPoint:", v9, v11) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v12 = objc_msgSend(v5, "visualSearchExistsAtPoint:", v9, v11);
    }
    v7 = v12 | objc_msgSend(v5, "hasActiveTextSelection");
  }

  return v7;
}

- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 toPDFDocument:(id)a4 atPageIndex:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
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
  unint64_t v24;
  MUQuickLookContentEditorViewController *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v26 = self;
  -[MarkupViewController _pdfView](self, "_pdfView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v27, "displayBox");
  v11 = objc_msgSend(v8, "pageCount");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v14 = (void *)MEMORY[0x2207DC428]();
      objc_msgSend(v8, "pageAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

      objc_msgSend(v16, "boundsForBox:", 1);
      objc_msgSend(v16, "setBounds:forBox:", v10);
      objc_msgSend(v9, "insertPage:atIndex:", v16, a5 + i);
      objc_msgSend(v12, "addObject:", v16);

      objc_autoreleasePoolPop(v14);
    }
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Insert from File"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](v26, "_registerActionNotEnablingMarkup:", v18);

  -[MarkupViewController undoManager](v26, "undoManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prepareWithInvocationTarget:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_deletePages:inDocument:", v12, v9);

  -[MarkupViewController undoManager](v26, "undoManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Insert from File"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActionName:", v23);

  v24 = objc_msgSend(v12, "count");
  return v24;
}

- (void)_insertPagesFromFileURLs:(id)a3 afterPage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  MUQuickLookContentEditorViewController *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = objc_msgSend(v8, "indexForPage:", v7);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("Could not find index of page below which new pages should be inserted"));
  }
  else
  {
    -[MUQuickLookContentEditorViewController sharedSerialPagesEditionQueue](self, "sharedSerialPagesEditionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke;
    v10[3] = &unk_24E5D4230;
    v11 = v6;
    v13 = self;
    v14 = &v15;
    v12 = v8;
    dispatch_async(v9, v10);

  }
  _Block_object_dispose(&v15, 8);

}

void __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = *MEMORY[0x24BDBCBE8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = 0;
        v17 = 0;
        v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v17, v6, &v16);
        v10 = v17;
        v11 = v16;
        v12 = v11;
        if ((v9 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "pageAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v15[0] = MEMORY[0x24BDAC760];
            v15[1] = 3221225472;
            v15[2] = __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke_2;
            v15[3] = &unk_24E5D4208;
            v14 = *(void **)(a1 + 48);
            v15[4] = *(_QWORD *)(a1 + 56);
            objc_msgSend(v14, "_insertFileAtURL:type:afterPage:completionHandler:", v8, v10, v13, v15);
          }
          else
          {
            NSLog(CFSTR("Original page to insert new page from could not be resolved"));
          }

        }
        else
        {
          NSLog(CFSTR("The content type of the edited copy could not be determined: %@"), v11);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

uint64_t __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 afterPage:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[MUQuickLookContentEditorViewController supportedUTTypes](self, "supportedUTTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToType:", v19))
        {
          objc_msgSend(v11, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Inserting elements of file at URL of type %@"), v21);

          if (v19 == *MEMORY[0x24BDF84E0])
          {
            -[MUQuickLookContentEditorViewController _insertPDFDocumentWithURL:afterPage:completionHandler:](self, "_insertPDFDocumentWithURL:afterPage:completionHandler:", v10, v12, v13);
          }
          else if (v19 == *MEMORY[0x24BDF8410])
          {
            -[MUQuickLookContentEditorViewController _insertImageWithURL:afterPage:completionHandler:](self, "_insertImageWithURL:afterPage:completionHandler:", v10, v12, v13);
          }
          else
          {
            v13[2](v13, 0);
          }

          goto LABEL_16;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend(v11, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Could not insert elements of file at URL because %@ type is not supported"), v20);

  v13[2](v13, 0);
LABEL_16:

}

- (void)_insertPDFDocumentWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  MUQuickLookContentEditorViewController *v15;
  id v16;
  id v17;

  v12 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDE30F0];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithURL:", v10);

  if (v11)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__MUQuickLookContentEditorViewController__insertPDFDocumentWithURL_afterPage_completionHandler___block_invoke;
    block[3] = &unk_24E5D4258;
    v14 = v12;
    v17 = v8;
    v15 = self;
    v16 = v11;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __96__MUQuickLookContentEditorViewController__insertPDFDocumentWithURL_afterPage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "document");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "indexForPage:", *(_QWORD *)(a1 + 32));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    NSLog(CFSTR("Could not find index of page below which new pages should be inserted from PDF Document"));
  else
    objc_msgSend(*(id *)(a1 + 40), "_insertPagesFromProvidedPDFDocument:toPDFDocument:atPageIndex:", *(_QWORD *)(a1 + 48), v3, v2 + 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_insertImageWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  CGImageSource *v12;
  CGImageSource *v13;
  CGImage *ImageAtIndex;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFURL *url;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;

  url = (const __CFURL *)a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexForPage:", v9);

  v12 = CGImageSourceCreateWithURL(url, 0);
  if (v12)
  {
    v13 = v12;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
    CFRelease(v13);
    if (ImageAtIndex)
    {
      v15 = v11 + 1;
      if (objc_msgSend(v10, "pageCount") && v15 <= objc_msgSend(v10, "pageCount"))
      {
        if (v11 == -1)
          v17 = 0;
        else
          v17 = v11;
        objc_msgSend(v10, "pageAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUQuickLookContentEditorViewController pdfPageOptionsForImageRef:withPreviousPage:](self, "pdfPageOptionsForImageRef:withPreviousPage:", ImageAtIndex, v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = (void *)MEMORY[0x24BDBD1B8];
      }
      v19 = objc_alloc(MEMORY[0x24BDE3100]);
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", ImageAtIndex);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithImage:options:", v20, v16);

      CGImageRelease(ImageAtIndex);
      if (v21)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __90__MUQuickLookContentEditorViewController__insertImageWithURL_afterPage_completionHandler___block_invoke;
        block[3] = &unk_24E5D4280;
        block[4] = self;
        v24 = v21;
        v27 = v15;
        v25 = v10;
        v26 = v8;
        dispatch_sync(MEMORY[0x24BDAC9B8], block);

      }
      else
      {
        NSLog(CFSTR("PDF document could not be created from URL %@"), url);
        (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
      }

    }
    else
    {
      NSLog(CFSTR("Image to insert could not be created from image source"));
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
  }
  else
  {
    NSLog(CFSTR("Cannot create image source from url"));
  }

}

uint64_t __90__MUQuickLookContentEditorViewController__insertImageWithURL_afterPage_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v8[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertPages:atIndexes:inDocument:", v3, v5, a1[6]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)_convertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, _QWORD);
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(id, _QWORD);
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = objc_alloc_init(MEMORY[0x24BDE30F0]);
  v9 = (void *)MEMORY[0x2207DC428]();
  if (objc_msgSend(v6, "pageCount"))
  {
    v37 = v9;
    v38 = v7;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = v11;
      v14 = v10;
      objc_msgSend(v6, "imageOfPageAtIndex:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUQuickLookContentEditorViewController scanImageToPDFConversionHandler](self, "scanImageToPDFConversionHandler");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "insertPage:atIndex:", v10, objc_msgSend(v8, "pageCount"));
      }
      else
      {
        v16 = objc_msgSend(v6, "pageCount");
        objc_msgSend(v11, "debugDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Failed to create PDF page from image (image %lu/%lu of scanned document) with description: %@"), v12, v16, v17);

      }
      ++v12;
    }
    while (v12 < objc_msgSend(v6, "pageCount"));

    v9 = v37;
    v7 = v38;
  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "temporaryDirectory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v18, "fileExistsAtPath:", v23);

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v22, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v18, "removeItemAtPath:error:", v24, &v40);
    v25 = v40;

    if (v25)
    {
      objc_msgSend(v22, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Failed to remove item (at path %@) prior to storing scanned PDF with error: %@"), v26, v25);

LABEL_13:
      v7[2](v7, 0);
      goto LABEL_18;
    }
  }
  objc_msgSend(v22, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v39);
  v25 = v39;

  if (v25)
  {
    NSLog(CFSTR("Failed to create directory for scanned PDF with error: %@"), v25);
    goto LABEL_13;
  }
  v28 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Scanned Document"), &stru_24E5D4C60, 0);
  v30 = v7;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@.pdf"), v31);
  v32 = objc_claimAutoreleasedReturnValue();

  v7 = v30;
  v33 = (void *)v32;
  objc_msgSend(v22, "URLByAppendingPathComponent:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *MEMORY[0x24BDBF498];
  v42[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "writeToURL:withOptions:", v34, v35))
    v36 = v34;
  else
    v36 = 0;
  ((void (**)(id, void *))v7)[2](v7, v36);

LABEL_18:
}

- (void)_detectedEditEnablingMarkup:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  v5 = -[MarkupViewController formFillingEnabled](self, "formFillingEnabled");
  -[MarkupViewController delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "editorDidChangeContent:enablingMarkup:", self, v3 && !v5);
      v7 = v9;
    }
  }

}

- (void)_loadSourceContentWithCompletion:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MUQuickLookContentEditorViewController setFormDetectedInDocument:](self, "setFormDetectedInDocument:", 0);
  -[MUQuickLookContentEditorViewController _resetOriginalDelegate](self, "_resetOriginalDelegate");
  v7[1] = 3221225472;
  v7[2] = __75__MUQuickLookContentEditorViewController__loadSourceContentWithCompletion___block_invoke;
  v7[3] = &unk_24E5D42A8;
  v7[4] = self;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  v7[0] = MEMORY[0x24BDAC760];
  v5 = v4;
  -[MarkupViewController _loadSourceContentWithCompletion:](&v6, sel__loadSourceContentWithCompletion_, v7);

}

uint64_t __75__MUQuickLookContentEditorViewController__loadSourceContentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_hasPDFContent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "contentViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setThumbnailViewStyle:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setAsPDFViewDelegatePrivateIfNecessary");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController setDelegate:](&v6, sel_setDelegate_, v4);
  if (v4)
    v5 = objc_opt_respondsToSelector();
  else
    v5 = 0;
  -[MUQuickLookContentEditorViewController setDelegateRespondsToDetectedFormInContent:](self, "setDelegateRespondsToDetectedFormInContent:", v5 & 1);
  -[MUQuickLookContentEditorViewController _setAsPDFViewDelegatePrivateIfNecessary](self, "_setAsPDFViewDelegatePrivateIfNecessary");

}

- (void)_setAsPDFViewDelegatePrivateIfNecessary
{
  MUDelegateProxy *v3;
  PDFViewDelegatePrivate *pdfViewDelegateProxy;
  void *v5;
  void *v6;
  PDFViewDelegatePrivate *v7;
  id v8;

  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent")
    && -[MUQuickLookContentEditorViewController delegateRespondsToDetectedFormInContent](self, "delegateRespondsToDetectedFormInContent"))
  {
    if (!self->_pdfViewDelegateProxy)
    {
      v3 = [MUDelegateProxy alloc];
      pdfViewDelegateProxy = self->_pdfViewDelegateProxy;
      self->_pdfViewDelegateProxy = (PDFViewDelegatePrivate *)v3;

      -[PDFViewDelegatePrivate setFirstDelegate:](self->_pdfViewDelegateProxy, "setFirstDelegate:", self);
    }
    -[MarkupViewController _pdfView](self, "_pdfView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFViewDelegatePrivate setSecondDelegate:](self->_pdfViewDelegateProxy, "setSecondDelegate:", v6);

    v7 = self->_pdfViewDelegateProxy;
    -[MarkupViewController _pdfView](self, "_pdfView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

  }
  else
  {
    -[MUQuickLookContentEditorViewController _resetOriginalDelegate](self, "_resetOriginalDelegate");
  }
}

- (void)_resetOriginalDelegate
{
  PDFViewDelegatePrivate *pdfViewDelegateProxy;
  void *v4;
  id v5;

  pdfViewDelegateProxy = self->_pdfViewDelegateProxy;
  if (pdfViewDelegateProxy)
  {
    -[PDFViewDelegatePrivate secondDelegate](pdfViewDelegateProxy, "secondDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController _pdfView](self, "_pdfView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v5);

  }
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MarkupViewController imageViewCombinedContentView](self, "imageViewCombinedContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateBottomRightContainerPositionForImageView:view:", v7, v6);

}

- (void)_updateThumbnailViewWithTraitCollection:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent")
    && -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") == 1)
  {
    v4 = -[MUQuickLookContentEditorViewController _shouldShowMarkupOverlays](self, "_shouldShowMarkupOverlays");
    v5 = -[MarkupViewController fixedThumbnailView](self, "fixedThumbnailView");
    v6 = v4 && objc_msgSend(v11, "horizontalSizeClass") == 2;
    -[MarkupViewController setFixedThumbnailView:](self, "setFixedThumbnailView:", v6);
    if (v5 && !-[MarkupViewController fixedThumbnailView](self, "fixedThumbnailView"))
    {
      -[MarkupViewController contentViewController](self, "contentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShouldShowThumbnailView:", 0);

    }
    if (v4)
    {
      -[MarkupViewController contentViewController](self, "contentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_msgSend(v8, "shouldShowThumbnailView") & 1) != 0
        || -[MarkupViewController fixedThumbnailView](self, "fixedThumbnailView");

    }
    else
    {
      v9 = 0;
    }
    -[MarkupViewController setShowThumbnailViewForMultipage:](self, "setShowThumbnailViewForMultipage:", v9);
    -[MarkupViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_respondsToSelector() & 1) == 0)
      objc_msgSend(v10, "editor:needsScreenEdgePanGestureRecognition:", self, -[MarkupViewController showThumbnailViewForMultipage](self, "showThumbnailViewForMultipage"));

  }
}

- (void)_flattenImageForAnalysis
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;

  v8 = 0;
  -[MarkupViewController dataRepresentationWithError:](self, "dataRepresentationWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (v4)
  {
    NSLog(CFSTR("Getting data representation for current image returned an error: %@. %@"), v4, self);
    -[MUQuickLookContentEditorViewController setLatestImageForAnalysis:](self, "setLatestImageForAnalysis:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUQuickLookContentEditorViewController setLatestImageForAnalysis:](self, "setLatestImageForAnalysis:", v6);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MUQuickLookContentEditorViewController__flattenImageForAnalysis__block_invoke;
  block[3] = &unk_24E5D4068;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __66__MUQuickLookContentEditorViewController__flattenImageForAnalysis__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalysisManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startImageAnalysis");

}

- (void)_setPresentationModeForImageContent:(unint64_t)a3
{
  void *v5;
  int v6;

  if (-[MUQuickLookContentEditorViewController _hasImageContent](self, "_hasImageContent")
    && _os_feature_enabled_impl())
  {
    if (+[MUImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](MUImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", a3)&& (-[MUQuickLookContentEditorViewController didAppearOnce](self, "didAppearOnce")|| (-[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasAnalysis"), v5, v6)))
    {
      -[MUQuickLookContentEditorViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
    }
    else
    {
      -[MUQuickLookContentEditorViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
    }
  }
}

- (void)_setPresentationModeForPDFContent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[MUQuickLookContentEditorViewController _hasPDFContent](self, "_hasPDFContent"))
  {
    -[MarkupViewController _pdfView](self, "_pdfView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    if (a3 == 1)
    {
      objc_msgSend(v10, "setFindInteractionEnabled:", 0);
      objc_msgSend(v10, "usePageViewController:withViewOptions:", 1, 0);
      objc_msgSend(v10, "setDisplayDirection:", 0);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

    }
    else if (!a3)
    {
      objc_msgSend(v10, "documentScrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyboardDismissMode:", 1);

      -[MarkupViewController setForcesPDFViewTopAlignment:](self, "setForcesPDFViewTopAlignment:", 1);
      -[MarkupViewController contentViewScrollView](self, "contentViewScrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 2);

      -[MarkupViewController contentViewScrollView](self, "contentViewScrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setIndicatorInsetAdjustmentBehavior:", 1);

      objc_msgSend(v10, "setFindInteractionEnabled:", 1);
    }
    -[MarkupViewController setAllowsThumbnailViewPageReordering:](self, "setAllowsThumbnailViewPageReordering:", -[MUQuickLookContentEditorViewController canEditPDF](self, "canEditPDF"));

  }
}

- (BOOL)_shouldShowMarkupOverlays
{
  char v3;

  v3 = -[MUQuickLookContentEditorViewController documentIsLocked](self, "documentIsLocked");
  return -[MUQuickLookContentEditorViewController _presentationModeAllowsMarkupOverlays](self, "_presentationModeAllowsMarkupOverlays") & ~v3;
}

- (BOOL)_presentationModeAllowsMarkupOverlays
{
  return -[MUQuickLookContentEditorViewController presentationMode](self, "presentationMode") == 0;
}

- (void)_registerActionNotEnablingMarkup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MUQuickLookContentEditorViewController actionsNotEnablingMarkup](self, "actionsNotEnablingMarkup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[MUQuickLookContentEditorViewController setActionsNotEnablingMarkup:](self, "setActionsNotEnablingMarkup:", v6);

  }
  -[MUQuickLookContentEditorViewController actionsNotEnablingMarkup](self, "actionsNotEnablingMarkup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)_rotatePage:(id)a3 clockwise:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v6 = objc_msgSend(v15, "rotation");
  v7 = 90;
  if (v4)
  {
    v8 = CFSTR("Rotate Left");
  }
  else
  {
    v7 = -90;
    v8 = CFSTR("Rotate Right");
  }
  objc_msgSend(v15, "setRotation:", v6 + v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](self, "_registerActionNotEnablingMarkup:", v10);
  -[MarkupViewController undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareWithInvocationTarget:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_rotatePage:clockwise:", v15, !v4);

  -[MarkupViewController undoManager](self, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActionName:", v10);

  -[MarkupViewController _pdfView](self, "_pdfView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoScales:", objc_msgSend(v14, "autoScales"));

}

- (void)_insertBlankPageAfterPage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  dispatch_time_t v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForPage:", v4) + 1;
  v7 = objc_alloc_init(MEMORY[0x24BDE3100]);
  objc_msgSend(v4, "boundsForBox:", 1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "setBounds:forBox:", 0, v9, v11, v13, v15);
  -[MUQuickLookContentEditorViewController _insertBlankPage:atIndex:](self, "_insertBlankPage:atIndex:", v7, v6);
  objc_initWeak(&location, self);
  v16 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MUQuickLookContentEditorViewController__insertBlankPageAfterPage___block_invoke;
  block[3] = &unk_24E5D42D0;
  objc_copyWeak(&v20, &location);
  v19 = v7;
  v17 = v7;
  dispatch_after(v16, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __68__MUQuickLookContentEditorViewController__insertBlankPageAfterPage___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pdfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "goToPage:", *(_QWORD *)(a1 + 32));

}

- (void)_insertPageFromFileAfterPage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MUQuickLookContentEditorViewController setAnnotationEditingEnabled:](self, "setAnnotationEditingEnabled:", 0);
  -[MarkupViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editor:willPresentViewControllerWithAnimation:", self, 1);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__MUQuickLookContentEditorViewController__insertPageFromFileAfterPage___block_invoke;
  v7[3] = &unk_24E5D42F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MUQuickLookContentEditorViewController _presentDocumentPicker:](self, "_presentDocumentPicker:", v7);

}

void __71__MUQuickLookContentEditorViewController__insertPageFromFileAfterPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MarkupUI.MUQuickLookContentEditorViewController")))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 2)
      {
        NSLog(CFSTR("Document picker for PDF page insertion was cancelled."));
        goto LABEL_10;
      }
    }
    else
    {

    }
    NSLog(CFSTR("Presenting document picker for PDF page insertion failed with error: %@"), *(_QWORD *)(a1 + 32));
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_insertPagesFromFileURLs:afterPage:", v10, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editor:didDismissViewControllerWithAnimation:", *(_QWORD *)(a1 + 32), 1);

  }
  else
  {
    NSLog(CFSTR("Presenting document picker for PDF page insertion did not return any document URL."));
  }
LABEL_10:

}

- (void)_insertPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MarkupViewController _pdfDocument](self, "_pdfDocument");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertPage:atIndex:", v6, a4);

}

- (void)_insertBlankPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[MUQuickLookContentEditorViewController _insertPage:atIndex:](self, "_insertPage:atIndex:", v6, a4);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Insert Blank Page"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](self, "_registerActionNotEnablingMarkup:", v8);

  -[MarkupViewController undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareWithInvocationTarget:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_deletePage:", v6);

  -[MarkupViewController undoManager](self, "undoManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Insert Blank Page"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActionName:", v12);

}

- (void)_insertDeletedPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[MUQuickLookContentEditorViewController _insertPage:atIndex:](self, "_insertPage:atIndex:", v6, a4);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Insert Deleted Page"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](self, "_registerActionNotEnablingMarkup:", v8);

  -[MarkupViewController undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareWithInvocationTarget:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_deletePage:", v6);

  -[MarkupViewController undoManager](self, "undoManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Insert Deleted Page"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActionName:", v12);

}

- (void)_deletePage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MarkupViewController _pdfDocument](self, "_pdfDocument", v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUQuickLookContentEditorViewController _deletePages:inDocument:](self, "_deletePages:inDocument:", v6, v7);

}

- (void)_deletePages:(id)a3 inDocument:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v26 = a3;
  v6 = a4;
  -[MarkupViewController _pdfView](self, "_pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "indexForPage:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __66__MUQuickLookContentEditorViewController__deletePages_inDocument___block_invoke;
  v27[3] = &unk_24E5D4320;
  v13 = v6;
  v28 = v13;
  v14 = v10;
  v29 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);
  if (v13 && objc_msgSend(v13, "pageCount") && v9 >= objc_msgSend(v13, "pageCount"))
  {
    objc_msgSend(v13, "pageAtIndex:", objc_msgSend(v13, "pageCount") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "goToPage:", v15);

  }
  v16 = objc_msgSend(v26, "count");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 >= 2)
    v19 = CFSTR("Remove pages");
  else
    v19 = CFSTR("Remove page");
  objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUQuickLookContentEditorViewController _registerActionNotEnablingMarkup:](self, "_registerActionNotEnablingMarkup:", v20);
  -[MarkupViewController undoManager](self, "undoManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "prepareWithInvocationTarget:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reverseObjectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "insertPages:atIndexes:inDocument:", v26, v24, v13);

  -[MarkupViewController undoManager](self, "undoManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActionName:", v20);

}

void __66__MUQuickLookContentEditorViewController__deletePages_inDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "indexForPage:", a2);
  objc_msgSend(*(id *)(a1 + 32), "removePageAtIndex:", v3);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1)
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_235);
  return (id)supportedUTTypes_supportedTypes;
}

void __58__MUQuickLookContentEditorViewController_supportedUTTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDF8410];
  v3[0] = *MEMORY[0x24BDF84E0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;

}

- (void)_presentDocumentPicker:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__MUQuickLookContentEditorViewController__presentDocumentPicker___block_invoke;
  v6[3] = &unk_24E5D42A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __65__MUQuickLookContentEditorViewController__presentDocumentPicker___block_invoke(uint64_t a1)
{
  void *v2;
  MUDocumentPickerViewController *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setImportHandler:", v2);

  v3 = [MUDocumentPickerViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "supportedUTTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIDocumentPickerViewController initForOpeningContentTypes:asCopy:](v3, "initForOpeningContentTypes:asCopy:", v4, 1);

  objc_msgSend(v6, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_presentDocumentScannerAfterPage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  -[MUQuickLookContentEditorViewController scanPDFHandler](self, "scanPDFHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NSLog(CFSTR("Trying to scan new pages to add to PDF document but a scan is already in progress (from %@)."), self);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke;
    v13[3] = &unk_24E5D4368;
    objc_copyWeak(&v15, &location);
    v7 = v4;
    v14 = v7;
    -[MUQuickLookContentEditorViewController setScanPDFHandler:](self, "setScanPDFHandler:", v13);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_2;
    v10[3] = &unk_24E5D4390;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    -[MUQuickLookContentEditorViewController setScanImageToPDFConversionHandler:](self, "setScanImageToPDFConversionHandler:", v10);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_3;
    block[3] = &unk_24E5D40B8;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *context;

  v28 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editor:willPresentViewControllerWithAnimation:", v7, 1);

    if (v28)
    {
      objc_msgSend(v7, "_pdfView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_pdfDocument");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        v27 = v5;
        v12 = objc_msgSend(v9, "displayBox");
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE30F0]), "initWithURL:", v28);
        v26 = v11;
        v14 = objc_msgSend(v11, "indexForPage:", *(_QWORD *)(a1 + 32));
        if (objc_msgSend(v13, "pageCount"))
        {
          v15 = 0;
          v29 = v13;
          v30 = v14 + 1;
          do
          {
            context = (void *)MEMORY[0x2207DC428]();
            objc_msgSend(v13, "pageAtIndex:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "copy");

            objc_msgSend(v17, "boundsForBox:", 1);
            objc_msgSend(v17, "setBounds:forBox:", v12);
            objc_msgSend(v7, "_insertPage:atIndex:", v17, v30 + v15);
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Scan Pages"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "_registerActionNotEnablingMarkup:", v19);

            objc_msgSend(v7, "undoManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "prepareWithInvocationTarget:", v7);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "_deletePage:", v17);

            objc_msgSend(v7, "undoManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Scan Pages"), &stru_24E5D4C60, CFSTR("MUQuickLookContentEditorViewController"));
            v24 = v12;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setActionName:", v25);

            v12 = v24;
            v13 = v29;

            objc_autoreleasePoolPop(context);
            ++v15;
          }
          while (v15 < objc_msgSend(v29, "pageCount"));
        }

        v5 = v27;
        v11 = v26;
      }

    }
  }

}

id __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_retainAutorelease(v3);
    objc_msgSend(WeakRetained, "pdfPageOptionsForImageRef:withPreviousPage:", objc_msgSend(v5, "CGImage"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3100]), "initWithImage:options:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "annotationEditingEnabled"))
      objc_msgSend(WeakRetained, "setAnnotationEditingEnabled:", 0);
    objc_msgSend(WeakRetained, "delegate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "editor:willPresentViewControllerWithAnimation:", WeakRetained, 1);

    v2 = objc_alloc_init(MEMORY[0x24BDFA1B8]);
    objc_msgSend(v2, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

    objc_msgSend(v2, "setModalPresentationStyle:", 5);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v2, 1, 0);

  }
}

- (BOOL)_hasPDFContent
{
  void *v2;
  char isKindOfClass;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasImageContent
{
  void *v2;
  char isKindOfClass;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)importHandler
{
  return self->_importHandler;
}

- (void)setImportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (id)scanPDFHandler
{
  return self->_scanPDFHandler;
}

- (void)setScanPDFHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (id)scanImageToPDFConversionHandler
{
  return self->_scanImageToPDFConversionHandler;
}

- (void)setScanImageToPDFConversionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (NSMutableSet)actionsNotEnablingMarkup
{
  return self->_actionsNotEnablingMarkup;
}

- (void)setActionsNotEnablingMarkup:(id)a3
{
  objc_storeStrong((id *)&self->_actionsNotEnablingMarkup, a3);
}

- (MUImageAnalysisManager)imageAnalysisManager
{
  return self->_imageAnalysisManager;
}

- (void)setImageAnalysisManager:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalysisManager, a3);
}

- (UIImage)latestImageForAnalysis
{
  return self->_latestImageForAnalysis;
}

- (void)setLatestImageForAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_latestImageForAnalysis, a3);
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)delegateRespondsToDetectedFormInContent
{
  return self->_delegateRespondsToDetectedFormInContent;
}

- (void)setDelegateRespondsToDetectedFormInContent:(BOOL)a3
{
  self->_delegateRespondsToDetectedFormInContent = a3;
}

- (BOOL)formDetectedInDocument
{
  return self->_formDetectedInDocument;
}

- (void)setFormDetectedInDocument:(BOOL)a3
{
  self->_formDetectedInDocument = a3;
}

- (PDFViewDelegatePrivate)pdfViewDelegateProxy
{
  return self->_pdfViewDelegateProxy;
}

- (void)setPdfViewDelegateProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pdfViewDelegateProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_latestImageForAnalysis, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_actionsNotEnablingMarkup, 0);
  objc_storeStrong(&self->_scanImageToPDFConversionHandler, 0);
  objc_storeStrong(&self->_scanPDFHandler, 0);
  objc_storeStrong(&self->_importHandler, 0);
}

@end
