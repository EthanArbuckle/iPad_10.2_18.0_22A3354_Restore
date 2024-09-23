@implementation ASVThumbnailView

- (ASVThumbnailView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  ASVThumbnailView *v9;
  ASVThumbnailView *v10;
  ASVThumbnailView *v11;
  objc_super v13;
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  AssetViewerLogHandleForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v8, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView initWithFrame called", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)ASVThumbnailView;
  v9 = -[ASVThumbnailView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    -[ASVThumbnailView _commonInit](v9, "_commonInit");
    v11 = v10;
  }

  return v10;
}

- (ASVThumbnailView)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  ASVThumbnailView *v6;
  ASVThumbnailView *v7;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  AssetViewerLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView initWithCoder called", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)ASVThumbnailView;
  v6 = -[ASVThumbnailView initWithCoder:](&v9, sel_initWithCoder_, v4);

  if (v6)
  {
    -[ASVThumbnailView _commonInit](v6, "_commonInit");
    v7 = v6;
  }

  return v6;
}

- (void)_commonInit
{
  CGSize *p_maxThumbnailSize;
  void *v4;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  void *v7;
  id v8;
  QLItemThumbnailGenerator *v9;
  QLItemThumbnailGenerator *thumbnailGenerator;
  ASVThumbnailButton *v11;
  ASVThumbnailButton *button;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint **p_widthButtonConstraint;
  NSLayoutConstraint *widthButtonConstraint;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint **p_heightButtonConstraint;
  NSLayoutConstraint *heightButtonConstraint;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[10];

  v49[8] = *MEMORY[0x1E0C80C00];
  p_maxThumbnailSize = &self->_maxThumbnailSize;
  self->_maxThumbnailSize = (CGSize)vdupq_n_s64(0x4072C00000000000uLL);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHexValue:error:", CFSTR("262626"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v5;

  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v7 = (void *)getQLItemThumbnailGeneratorClass_softClass;
  v48 = getQLItemThumbnailGeneratorClass_softClass;
  if (!getQLItemThumbnailGeneratorClass_softClass)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __getQLItemThumbnailGeneratorClass_block_invoke;
    v44[3] = &unk_1E9F0D4C0;
    v44[4] = &v45;
    __getQLItemThumbnailGeneratorClass_block_invoke((uint64_t)v44);
    v7 = (void *)v46[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v45, 8);
  v9 = (QLItemThumbnailGenerator *)objc_opt_new();
  thumbnailGenerator = self->_thumbnailGenerator;
  self->_thumbnailGenerator = v9;

  +[ASVThumbnailButton thumbnailButton](ASVThumbnailButton, "thumbnailButton");
  v11 = (ASVThumbnailButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v11;

  -[ASVThumbnailButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_previewCurrentItem, 64);
  -[ASVThumbnailView addSubview:](self, "addSubview:", self->_button);
  -[ASVThumbnailButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASVThumbnailButton widthAnchor](self->_button, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", p_maxThumbnailSize->width);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  p_widthButtonConstraint = &self->_widthButtonConstraint;
  widthButtonConstraint = self->_widthButtonConstraint;
  self->_widthButtonConstraint = v14;

  -[ASVThumbnailButton heightAnchor](self->_button, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", p_maxThumbnailSize->height);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  p_heightButtonConstraint = &self->_heightButtonConstraint;
  heightButtonConstraint = self->_heightButtonConstraint;
  self->_heightButtonConstraint = v18;

  LODWORD(v21) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_widthButtonConstraint, "setPriority:", v21);
  LODWORD(v22) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_heightButtonConstraint, "setPriority:", v22);
  v32 = (void *)MEMORY[0x1E0CB3718];
  -[ASVThumbnailButton centerYAnchor](self->_button, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView centerYAnchor](self, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v41;
  -[ASVThumbnailButton centerXAnchor](self->_button, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView centerXAnchor](self, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v38;
  -[ASVThumbnailButton leadingAnchor](self->_button, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView leadingAnchor](self, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v35;
  -[ASVThumbnailButton trailingAnchor](self->_button, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView trailingAnchor](self, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v23;
  -[ASVThumbnailButton topAnchor](self->_button, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView topAnchor](self, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v26;
  -[ASVThumbnailButton bottomAnchor](self->_button, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailView bottomAnchor](self, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v29;
  v30 = *p_heightButtonConstraint;
  v49[6] = *p_widthButtonConstraint;
  v49[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v31);

}

- (void)setThumbnailItem:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailItem, a3);
  -[ASVThumbnailView updateThumbnailIfNeeded](self, "updateThumbnailIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVThumbnailView;
  v4 = a3;
  -[ASVThumbnailView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[ASVThumbnailView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v6 != v9)
    -[ASVThumbnailView updateThumbnailIfNeeded](self, "updateThumbnailIfNeeded");
}

- (void)setMaxThumbnailSize:(CGSize)a3
{
  if (a3.width != self->_maxThumbnailSize.width || a3.height != self->_maxThumbnailSize.height)
  {
    self->_maxThumbnailSize = a3;
    -[ASVThumbnailView updateThumbnailIfNeeded](self, "updateThumbnailIfNeeded");
  }
}

- (void)updateThumbnailIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  QLItemThumbnailGenerator *thumbnailGenerator;
  id v18;
  _QWORD v19[4];
  id v20;
  ASVThumbnailView *v21;
  id v22[4];
  id location;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  AssetViewerLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView updateThumbnailIfNeeded() called", buf, 2u);
  }

  -[ASVThumbnailView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  -[ASVThumbnailView maxThumbnailSize](self, "maxThumbnailSize");
  if (*(double *)&v6 != 0.0)
  {
    v9 = v7;
    v10 = v8;
    if (v7 != *MEMORY[0x1E0C9D820] || v8 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        -[NSLayoutConstraint setConstant:](self->_widthButtonConstraint, "setConstant:", v9);
        -[NSLayoutConstraint setConstant:](self->_heightButtonConstraint, "setConstant:", v10);
        self->_lastRequestedThumbnailSize.width = v9;
        self->_lastRequestedThumbnailSize.height = v10;
        self->_lastRequestedThumbnailScale = *(double *)&v6;
        -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        AssetViewerLogHandleForCategory(2);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "previewItemURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_1D93A7000, v15, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView generating thumbnail at %@, %@", buf, 0x16u);

        }
        thumbnailGenerator = self->_thumbnailGenerator;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke;
        v19[3] = &unk_1E9F0D498;
        objc_copyWeak(v22, &location);
        v18 = v14;
        v20 = v18;
        v21 = self;
        v22[1] = v6;
        v22[2] = *(id *)&v9;
        v22[3] = *(id *)&v10;
        -[QLItemThumbnailGenerator generateThumbnailForItem:ofSize:minimumSize:scale:badgeType:completionBlock:](thumbnailGenerator, "generateThumbnailForItem:ofSize:minimumSize:scale:badgeType:completionBlock:", v18, 0, v19, v9, v10, v9, *(double *)&v6);

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);

      }
    }
  }
}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11[2];
  __int128 v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_2;
  block[3] = &unk_1E9F0D470;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11[1] = *(id *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_13;
  AssetViewerLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32) != 0;
    *(_DWORD *)buf = 67109120;
    v18 = v4;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView thumbnail generation done, has thumbnail? %d", buf, 8u);
  }

  objc_msgSend(WeakRetained, "thumbnailItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40))
    || (v6 = *(_QWORD *)(a1 + 48), *(double *)(v6 + 456) != *(double *)(a1 + 64)))
  {
LABEL_12:

    goto LABEL_13;
  }
  v7 = (double *)(v6 + 440);
  v8 = *(double *)(a1 + 72);
  v9 = *(double *)(a1 + 80);
  v10 = *v7;
  v11 = v7[1];

  if (v8 == v10 && v9 == v11)
  {
    objc_msgSend(WeakRetained, "layoutIfNeeded");
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_44;
    v14[3] = &unk_1E9F0D448;
    v15 = WeakRetained;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.2);

    v5 = v15;
    goto LABEL_12;
  }
LABEL_13:

}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_44(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setThumbnail:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setError:", 0);
  }
  else
  {
    v2 = (id)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setError:", v2);

  }
}

- (void)previewCurrentItem
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[ASVThumbnailView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      AssetViewerLogHandleForCategory(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "previewItemURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewItemURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1D93A7000, v6, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView preview current item, path: %@,  obj: %@", buf, 0x16u);

      }
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v11 = (void *)getQLPreviewControllerClass_softClass;
      v22 = getQLPreviewControllerClass_softClass;
      if (!getQLPreviewControllerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getQLPreviewControllerClass_block_invoke;
        v25 = &unk_1E9F0D4C0;
        v26 = &v19;
        __getQLPreviewControllerClass_block_invoke((uint64_t)buf);
        v11 = (void *)v20[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v19, 8);
      v13 = [v12 alloc];
      -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithPreviewItems:", v15);

      objc_msgSend(v16, "setDelegate:", self);
      -[ASVThumbnailView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVThumbnailView thumbnailItem](self, "thumbnailItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "thumbnailView:wantsToPresentPreviewController:forItem:", self, v16, v18);

    }
  }
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  ASVThumbnailView *v4;
  void *v5;

  v4 = self;
  -[ASVThumbnailButton thumbnail](self->_button, "thumbnail", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = (ASVThumbnailView *)v4->_button;
  return v4;
}

- (ASVThumbnailViewDelegate)delegate
{
  return (ASVThumbnailViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (QLItem)thumbnailItem
{
  return self->_thumbnailItem;
}

- (CGSize)maxThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxThumbnailSize.width;
  height = self->_maxThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightButtonConstraint, 0);
  objc_storeStrong((id *)&self->_widthButtonConstraint, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
