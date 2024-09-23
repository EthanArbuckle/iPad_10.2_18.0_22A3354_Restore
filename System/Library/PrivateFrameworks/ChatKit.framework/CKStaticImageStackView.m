@implementation CKStaticImageStackView

- (CKStaticImageStackView)initWithFrame:(CGRect)a3 mediaObjects:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKStaticImageStackView *v10;
  CKStaticImageStackView *v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKStaticImageStackView;
  v10 = -[CKStaticImageStackView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CKStaticImageStackView setMediaObjects:](v10, "setMediaObjects:", v9);
    v11->_stackCornerRadius = 20.0;
    v12 = objc_alloc_init(-[CKStaticImageStackView _PFMessageStackLayoutFrameSolverClass](v11, "_PFMessageStackLayoutFrameSolverClass"));
    -[CKStaticImageStackView setFrameSolver:](v11, "setFrameSolver:", v12);
    v13 = (void *)objc_opt_new();
    if (objc_msgSend(v9, "count"))
    {
      v14 = 0;
      v15 = *MEMORY[0x1E0CD2F98];
      v16 = *MEMORY[0x1E0CD2A68];
      do
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setContentsGravity:", v15);
        objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.5);
        objc_msgSend(v17, "setMasksToBounds:", 1);
        objc_msgSend(v17, "setCornerCurve:", v16);
        -[CKStaticImageStackView layer](v11, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addSublayer:", v17);

        objc_msgSend(v13, "addObject:", v17);
        ++v14;
      }
      while (objc_msgSend(v9, "count") > v14);
    }
    -[CKStaticImageStackView setImageLayers:](v11, "setImageLayers:", v13);
    -[CKStaticImageStackView _updatePreviews](v11, "_updatePreviews");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v11, sel__mediaObjectPreviewDidChange_, CFSTR("CKPreviewDidChangeNotification"), 0);

  }
  return v11;
}

- (void)layoutSubviews
{
  *(_DWORD *)buf = 136315138;
  *a2 = "CGSize _SizeWithAspectRatioFittingSize(double, CGSize)";
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "%s would have attempted divide by zero because size.height was 0.", buf, 0xCu);
}

- (void)setStackCornerRadius:(double)a3
{
  if (self->_stackCornerRadius != a3)
  {
    self->_stackCornerRadius = a3;
    -[CKStaticImageStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_mediaObjectPreviewDidChange:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  int v9;
  objc_class *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint8_t buf[4];
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[CKStaticImageStackView mediaObjects](self, "mediaObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      -[CKStaticImageStackView _updatePreviews](self, "_updatePreviews");
      -[CKStaticImageStackView setNeedsLayout](self, "setNeedsLayout");
    }

  }
  else
  {
    v10 = (objc_class *)objc_opt_class();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("of type: %@"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = CFSTR("nil");
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Notification object received was %@ instead of expected type CKMediaObject, _mediaObjectPreviewDidChange does nothing", buf, 0xCu);
      }

    }
  }

}

- (void)_updatePreviews
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  -[CKStaticImageStackView mediaObjects](self, "mediaObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[CKStaticImageStackView mediaObjects](self, "mediaObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKStaticImageStackView imageLayers](self, "imageLayers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "previewMaxWidth");
      objc_msgSend(v7, "previewForWidth:orientation:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v9, "setContents:", objc_msgSend(objc_retainAutorelease(v11), "CGImage"));

      ++v5;
      -[CKStaticImageStackView mediaObjects](self, "mediaObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v13 > v5);
  }
}

- (Class)_PFMessageStackLayoutFrameSolverClass
{
  if (_PFMessageStackLayoutFrameSolverClass_onceToken != -1)
    dispatch_once(&_PFMessageStackLayoutFrameSolverClass_onceToken, &__block_literal_global_66);
  return (Class)(id)_PFMessageStackLayoutFrameSolverClass__PFMessageStackLayoutFrameSolverClass;
}

uint64_t __63__CKStaticImageStackView__PFMessageStackLayoutFrameSolverClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("PFMessagesStackLayoutFrameSolver"), CFSTR("PhotosFormats"));
  _PFMessageStackLayoutFrameSolverClass__PFMessageStackLayoutFrameSolverClass = result;
  return result;
}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (void)setMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjects, a3);
}

- (double)stackCornerRadius
{
  return self->_stackCornerRadius;
}

- (NSArray)imageLayers
{
  return self->_imageLayers;
}

- (void)setImageLayers:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayers, a3);
}

- (PFMessagesStackLayoutFrameSolver)frameSolver
{
  return self->_frameSolver;
}

- (void)setFrameSolver:(id)a3
{
  objc_storeStrong((id *)&self->_frameSolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSolver, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

@end
