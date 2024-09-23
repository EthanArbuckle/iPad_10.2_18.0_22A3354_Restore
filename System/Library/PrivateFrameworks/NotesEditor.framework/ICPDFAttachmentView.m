@implementation ICPDFAttachmentView

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PDF attachment"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentView icaxAttachmentViewTypeDescription](self, "icaxAttachmentViewTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

+ (id)renderingQueue
{
  if (renderingQueue_onceToken != -1)
    dispatch_once(&renderingQueue_onceToken, &__block_literal_global_20);
  return (id)renderingQueue_renderingQueue;
}

uint64_t __37__ICPDFAttachmentView_renderingQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)renderingQueue_renderingQueue;
  renderingQueue_renderingQueue = (uint64_t)v0;

  objc_msgSend((id)renderingQueue_renderingQueue, "setName:", CFSTR("com.apple.notes.PDF-rendering-queue"));
  return objc_msgSend((id)renderingQueue_renderingQueue, "setMaxConcurrentOperationCount:", 1);
}

- (ICPDFAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICPDFAttachmentView;
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](&v7, sel_initWithFrame_textAttachment_textContainer_forManualRendering_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  objc_super v3;

  -[ICPDFAttachmentView cancelRenderingIfPossible](self, "cancelRenderingIfPossible");
  -[ICPDFAttachmentView cleanupPDFDocument](self, "cleanupPDFDocument");
  v3.receiver = self;
  v3.super_class = (Class)ICPDFAttachmentView;
  -[ICAttachmentView dealloc](&v3, sel_dealloc);
}

- (void)cleanupPDFDocument
{
  ICPDFAttachmentView *v2;
  CGPDFPage *page;
  CGPDFDocument *pdf;
  ICPDFAttachmentView *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  page = obj->_page;
  if (page)
  {
    CGPDFPageRelease(page);
    v2 = obj;
    obj->_page = 0;
  }
  pdf = v2->_pdf;
  if (pdf)
  {
    CGPDFDocumentRelease(pdf);
    v2 = obj;
    obj->_pdf = 0;
  }
  objc_sync_exit(v2);

}

- (void)prepareForPrinting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICPDFAttachmentView;
  -[ICAttachmentView prepareForPrinting](&v3, sel_prepareForPrinting);
  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
}

- (id)pdfURL
{
  void *v2;
  void *v3;
  void *v4;

  -[ICPDFAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGPDFPage)page
{
  ICPDFAttachmentView *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  CGPDFDocument *v5;
  CGPDFPage *Page;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_page)
  {
    -[ICPDFAttachmentView pdfURL](v2, "pdfURL");
    v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = CGPDFDocumentCreateWithURL(v3);
      v2->_pdf = v5;
      if (v5)
      {
        Page = CGPDFDocumentGetPage(v5, 1uLL);
        v2->_page = Page;
        if (Page)
          CGPDFPageRetain(Page);
      }
    }

  }
  objc_sync_exit(v2);

  return v2->_page;
}

- (void)setImage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  if (!v8)
  {
    -[ICAttachmentView forManualRendering](self, "forManualRendering");
LABEL_7:
    -[ICPDFAttachmentView updateLayerContentsWithFade:](self, "updateLayerContentsWithFade:", 0);
    goto LABEL_8;
  }
  if (!-[ICPDFAttachmentView isManaullyGeneratingImage](self, "isManaullyGeneratingImage"))
  {
    -[ICPDFAttachmentView attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCachedImage:", v8);

    -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
  }
  if (-[ICAttachmentView forManualRendering](self, "forManualRendering"))
    goto LABEL_7;
  -[ICPDFAttachmentView progressView](self, "progressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPDFAttachmentView updateLayerContentsWithFade:](self, "updateLayerContentsWithFade:", v6 != 0);

LABEL_8:
  -[ICPDFAttachmentView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPDFAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v7);

}

- (void)setAttachment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[ICPDFAttachmentView attachment](self, "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICPDFAttachmentView;
    -[ICPDFAttachmentView setAttachment:](&v8, sel_setAttachment_, v4);
    -[ICPDFAttachmentView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPDFAttachmentView setImage:](self, "setImage:", v7);

    -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
  }

}

- (void)didChangeMedia
{
  UIImage *image;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView didChangeMedia](&v5, sel_didChangeMedia);
  image = self->_image;
  self->_image = 0;

  -[ICPDFAttachmentView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachedImage:", 0);

  -[ICPDFAttachmentView cleanupPDFDocument](self, "cleanupPDFDocument");
  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
}

- (void)didScrollOutOfVisibleRange
{
  UIImage *image;

  if (!-[ICAttachmentView forManualRendering](self, "forManualRendering"))
  {
    image = self->_image;
    self->_image = 0;

    -[ICPDFAttachmentView updateLayerContentsWithFade:](self, "updateLayerContentsWithFade:", 0);
    -[ICPDFAttachmentView cancelRenderingIfPossible](self, "cancelRenderingIfPossible");
  }
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  void *v3;

  -[ICPDFAttachmentView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && -[ICPDFAttachmentView cancelRenderingIfPossible](self, "cancelRenderingIfPossible");
}

- (void)didScrollIntoVisibleRange
{
  void *v3;
  void *v4;

  -[ICPDFAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPDFAttachmentView setImage:](self, "setImage:", v4);

  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  -[ICAttachmentView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
  -[ICPDFAttachmentView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPDFAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v3);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICPDFAttachmentView startImageRenderIfNeeded](self, "startImageRenderIfNeeded");
}

- (void)setHighlightColor:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView setHighlightColor:](&v5, sel_setHighlightColor_, a3);
  -[ICPDFAttachmentView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPDFAttachmentView setupBorderForLayer:](self, "setupBorderForLayer:", v4);

}

- (BOOL)availableImageIsAcceptable
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;

  -[ICPDFAttachmentView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICPDFAttachmentView bounds](self, "bounds");
  v5 = v4;
  -[ICPDFAttachmentView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = vabdd_f64(v7, v5) < 1.0;

  -[ICPDFAttachmentView image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = vabdd_f64(v10, v5);

  return v11 < 1.0 && v8;
}

- (BOOL)needToStartRender
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICPDFAttachmentView isManaullyGeneratingImage](self, "isManaullyGeneratingImage"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[ICPDFAttachmentView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ICPDFAttachmentView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[ICPDFAttachmentView renderOperation](self, "renderOperation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          LOBYTE(v3) = 0;
        else
          v3 = !-[ICPDFAttachmentView availableImageIsAcceptable](self, "availableImageIsAcceptable");

      }
      else
      {
        LOBYTE(v3) = 0;
      }

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (void)startImageRenderIfNeeded
{
  BOOL v3;
  void *v4;
  ICPDFAttachmentRenderOperation *v5;

  v3 = -[ICPDFAttachmentView needToStartRender](self, "needToStartRender");
  if (!-[ICPDFAttachmentView isManaullyGeneratingImage](self, "isManaullyGeneratingImage")
    && (v3 || -[ICAttachmentView forManualRendering](self, "forManualRendering")))
  {
    v5 = -[ICPDFAttachmentRenderOperation initWithView:]([ICPDFAttachmentRenderOperation alloc], "initWithView:", self);
    if (-[ICAttachmentView forManualRendering](self, "forManualRendering"))
    {
      -[ICPDFAttachmentView setIsManaullyGeneratingImage:](self, "setIsManaullyGeneratingImage:", 1);
      -[ICPDFAttachmentRenderOperation generateImageForPrinting](v5, "generateImageForPrinting");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPDFAttachmentView setImage:](self, "setImage:", v4);
      -[ICPDFAttachmentView setIsManaullyGeneratingImage:](self, "setIsManaullyGeneratingImage:", 0);
    }
    else
    {
      -[ICPDFAttachmentView setRenderOperation:](self, "setRenderOperation:", v5);
      -[ICPDFAttachmentView setRendering:](self, "setRendering:", 1);
      objc_msgSend((id)objc_opt_class(), "renderingQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addOperation:", v5);
    }

  }
}

- (void)updateLayerContentsWithFade:(BOOL)a3
{
  void *v4;
  void *v5;
  CGImage *v6;
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFromValue:", &unk_1EA821F50);
    objc_msgSend(v4, "setToValue:", &unk_1EA821F60);
    objc_msgSend(v4, "setDuration:", 0.1);
    -[ICPDFAttachmentView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimation:forKey:", v4, CFSTR("opacity"));

  }
  v6 = -[UIImage CGImage](self->_image, "CGImage");
  -[ICPDFAttachmentView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

}

- (void)setupBorderForLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  CGColorSpace *DeviceGray;
  CGColor *v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPDFAttachmentView highlightColor](self, "highlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICPDFAttachmentView highlightColor](self, "highlightColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    v7 = *MEMORY[0x1E0D64900];
  }
  else
  {
    -[ICPDFAttachmentView image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      v12 = xmmword_1DD9E72F0;
      v11 = CGColorCreate(DeviceGray, (const CGFloat *)&v12);
      objc_msgSend(v4, "setBorderColor:", v11);
      -[ICPDFAttachmentView ic_hairlineWidth](self, "ic_hairlineWidth");
      objc_msgSend(v4, "setBorderWidth:");
      CGColorRelease(v11);
      CGColorSpaceRelease(DeviceGray);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    -[ICPDFAttachmentView ic_hairlineWidth](self, "ic_hairlineWidth");
  }
  objc_msgSend(v4, "setBorderWidth:", v7);
LABEL_6:

}

- (BOOL)cancelRenderingIfPossible
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "renderingQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuspended:", 1);

  -[ICPDFAttachmentView renderOperation](self, "renderOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isExecuting") & 1) != 0 || (objc_msgSend(v4, "isFinished") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "cancel");
    -[ICPDFAttachmentView setRenderOperation:](self, "setRenderOperation:", 0);
    v5 = 1;
  }
  objc_msgSend((id)objc_opt_class(), "renderingQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuspended:", 0);

  -[ICPDFAttachmentView setRendering:](self, "setRendering:", !v5);
  return v5;
}

- (void)setRendering:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_rendering || !a3)
  {
    if (self->_rendering && !a3)
    {
      self->_rendering = a3;
      -[ICPDFAttachmentView startProgressSelectorDelayer](self, "startProgressSelectorDelayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancelPreviousFireRequests");

      -[ICPDFAttachmentView stopProgress](self, "stopProgress");
    }
  }
  else
  {
    self->_rendering = a3;
    -[ICPDFAttachmentView startProgressSelectorDelayer](self, "startProgressSelectorDelayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_startProgress, 0, 1, 0.3);
      -[ICPDFAttachmentView setStartProgressSelectorDelayer:](self, "setStartProgressSelectorDelayer:", v7);

    }
    -[ICPDFAttachmentView startProgressSelectorDelayer](self, "startProgressSelectorDelayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestFire");

  }
}

- (void)startProgress
{
  void *v3;
  void *v4;
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
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[ICPDFAttachmentView progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[ICPDFAttachmentView setProgressView:](self, "setProgressView:", v4);

    -[ICPDFAttachmentView progressView](self, "progressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimating");

    -[ICPDFAttachmentView progressView](self, "progressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    -[ICPDFAttachmentView progressView](self, "progressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICPDFAttachmentView progressView](self, "progressView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPDFAttachmentView addSubview:](self, "addSubview:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[ICPDFAttachmentView progressView](self, "progressView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 9, 0, v10, 9, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB3718];
    -[ICPDFAttachmentView progressView](self, "progressView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 10, 0, v13, 10, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }
}

- (void)stopProgress
{
  void *v3;
  void *v4;

  -[ICPDFAttachmentView progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICPDFAttachmentView progressView](self, "progressView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[ICPDFAttachmentView setProgressView:](self, "setProgressView:", 0);
  }
}

- (NSOperation)renderOperation
{
  return (NSOperation *)objc_loadWeakRetained((id *)&self->_renderOperation);
}

- (void)setRenderOperation:(id)a3
{
  objc_storeWeak((id *)&self->_renderOperation, a3);
}

- (UIActivityIndicatorView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (ICSelectorDelayer)startProgressSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 568, 1);
}

- (void)setStartProgressSelectorDelayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (BOOL)isManaullyGeneratingImage
{
  return self->_isManaullyGeneratingImage;
}

- (void)setIsManaullyGeneratingImage:(BOOL)a3
{
  self->_isManaullyGeneratingImage = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isRendering
{
  return self->_rendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_startProgressSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_destroyWeak((id *)&self->_renderOperation);
}

@end
