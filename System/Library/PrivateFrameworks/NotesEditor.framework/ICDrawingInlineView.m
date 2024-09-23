@implementation ICDrawingInlineView

- (ICDrawingInlineView)initWithFrame:(CGRect)a3
{
  ICDrawingInlineView *v3;
  ICDrawingInlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineView;
  v3 = -[ICDrawingInlineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICDrawingInlineView commonInit](v3, "commonInit");
  return v4;
}

- (ICDrawingInlineView)initWithFrame:(CGRect)a3 forManualRendering:(BOOL)a4
{
  ICDrawingInlineView *v5;
  ICDrawingInlineView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDrawingInlineView;
  v5 = -[ICDrawingInlineView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[ICDrawingInlineView commonInit](v5, "commonInit");
    v6->_forManualRendering = a4;
  }
  return v6;
}

- (ICDrawingInlineView)initWithCoder:(id)a3
{
  ICDrawingInlineView *v3;
  ICDrawingInlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineView;
  v3 = -[ICDrawingInlineView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICDrawingInlineView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  CALayer *v3;
  CALayer *imageLayer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  imageLayer = self->_imageLayer;
  self->_imageLayer = v3;

  -[ICDrawingInlineView bounds](self, "bounds");
  -[CALayer setFrame:](self->_imageLayer, "setFrame:");
  -[CALayer setMasksToBounds:](self->_imageLayer, "setMasksToBounds:", 1);
  -[ICDrawingInlineView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[ICDrawingInlineView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineView setBorderColor:](self, "setBorderColor:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_delayedPreviewImageChanged, 1, 1, 0.3);
  -[ICDrawingInlineView setPreviewImageUpdateDelayer:](self, "setPreviewImageUpdateDelayer:", v8);

  -[ICDrawingInlineView registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICDrawingInlineView previewImageUpdateDelayer](self, "previewImageUpdateDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICDrawingInlineView;
  -[ICDrawingInlineView dealloc](&v5, sel_dealloc);
}

- (BOOL)shouldUseLightDrawingBackground
{
  void *v3;
  BOOL v4;

  -[ICDrawingInlineView ic_appearanceInfo](self, "ic_appearanceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDark"))
    v4 = -[ICDrawingInlineView isInAttachmentBrowser](self, "isInAttachmentBrowser")
      || -[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay");
  else
    v4 = 0;

  return v4;
}

- (void)setAttachment:(id)a3
{
  ICAttachment *v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  ICAttachment *v40;

  v5 = (ICAttachment *)a3;
  if (self->_attachment != v5)
  {
    v40 = v5;
    -[ICDrawingInlineView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (uint64_t *)MEMORY[0x1E0D63660];
    v8 = (uint64_t *)MEMORY[0x1E0D635F8];
    v9 = (uint64_t *)MEMORY[0x1E0D63648];
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0D63660];
      -[ICDrawingInlineView attachment](self, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, v11, v13);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *v8;
      -[ICDrawingInlineView attachment](self, "attachment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObserver:name:object:", self, v15, v17);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *v9;
      -[ICDrawingInlineView attachment](self, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v7 = (uint64_t *)MEMORY[0x1E0D63660];
      objc_msgSend(v18, "removeObserver:name:object:", self, v22, v21);

    }
    objc_storeStrong((id *)&self->_attachment, a3);
    -[ICDrawingInlineView attachment](self, "attachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *v7;
      -[ICDrawingInlineView attachment](self, "attachment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_attachmentPreviewImagesDidUpdate_, v25, v27);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v8;
      -[ICDrawingInlineView attachment](self, "attachment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_attachmentPreviewImagesDidUpdate_, v29, v31);

      objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDrawingInlineView attachment](self, "attachment");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "progressForObjectID:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        -[ICDrawingInlineView observePreviewGenerationProgress:](self, "observePreviewGenerationProgress:", v35);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *v9;
      -[ICDrawingInlineView attachment](self, "attachment");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", self, sel_attachmentPreviewDidStart_, v37, v39);

    }
    -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", 1);
    v5 = v40;
  }

}

- (CGRect)boundsForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  double height;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[ICDrawingInlineView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  x = v6;
  y = v8;
  height = v10;

  -[ICDrawingInlineView attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawingModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "drawing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fullBounds");
  width = v15;

  if (TSDNearlyEqualSizes())
  {
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSize");
    TSDRectWithSize();
    x = v17;
    y = v18;
    width = v19;
    height = v20;
  }
  if (!-[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay"))
  {
    if ((width + -250.0) * 0.5 <= 0.0)
      v21 = (width + -250.0) * 0.5;
    else
      v21 = 0.0;
    if ((height + -250.0) * 0.5 <= 0.0)
      v22 = (height + -250.0) * 0.5;
    else
      v22 = 0.0;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, v21, v22);
    v29 = CGRectIntegral(v28);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  if (width < 1.0 || height < 1.0 || (TSDRectIsFinite() & 1) == 0)
  {
    y = 0.0;
    height = 250.0;
    width = 250.0;
    x = 0.0;
  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)imageFrame
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect result;

  if (-[ICDrawingInlineView fullscreen](self, "fullscreen"))
  {
    -[ICDrawingInlineView bounds](self, "bounds");
LABEL_17:
    y = v4;
    width = v5;
    height = v6;
    goto LABEL_18;
  }
  v7 = -[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay");
  -[ICDrawingInlineView boundsForDisplay](self, "boundsForDisplay");
  v11 = v10;
  v13 = v12;
  if (!v7)
  {
    v42 = (void *)MEMORY[0x1E0D63AF0];
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSize");
    v44 = v43;
    v46 = v45;
    -[ICDrawingInlineView attachment](self, "attachment");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fullSize:forOrientation:", (int)objc_msgSend(v47, "orientation"), v44, v46);
    v49 = v48;
    v51 = v50;

    -[ICDrawingInlineView bounds](self, "bounds");
    v53 = v52 / v49;
    -[ICDrawingInlineView bounds](self, "bounds");
    v55 = v54 / v13;
    v59.a = v53;
    if (v53 < v54 / v13)
      v55 = v53;
    v59.b = 0.0;
    v59.c = 0.0;
    v59.d = v55;
    v63.origin.y = -v11;
    v59.tx = 0.0;
    v59.ty = 0.0;
    v63.origin.x = 0.0;
    v63.size.width = v49;
    v63.size.height = v51;
    *(CGRect *)&v3 = CGRectApplyAffineTransform(v63, &v59);
    goto LABEL_17;
  }
  v14 = v8;
  v15 = v9;
  v16 = (void *)MEMORY[0x1E0D63AF0];
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSize");
  v18 = v17;
  v20 = v19;
  -[ICDrawingInlineView attachment](self, "attachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fullSize:forOrientation:", (int)objc_msgSend(v21, "orientation"), v18, v20);
  v23 = v22;
  v25 = v24;

  -[ICDrawingInlineView bounds](self, "bounds");
  v28 = v27 / v15;
  v29 = 1.0;
  if (v27 / v15 > 1.0)
    v28 = 1.0;
  if (v26 / v13 <= 1.0)
    v29 = v26 / v13;
  if (v28 < v29)
    v29 = v28;
  v60.a = v29;
  v61.origin.x = -v14;
  v60.b = 0.0;
  v60.c = 0.0;
  v60.d = v29;
  v61.origin.y = -v11;
  v60.tx = 0.0;
  v60.ty = 0.0;
  v61.size.width = v23;
  v61.size.height = v25;
  v62 = CGRectApplyAffineTransform(v61, &v60);
  x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;
  -[ICDrawingInlineView attachment](self, "attachment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35;
  v38 = v37;

  -[ICDrawingInlineView frame](self, "frame");
  v41 = floor((v40 - v36) * 0.5);
  if (v36 >= v40)
    v41 = -0.0;
  v3 = x + v41;
  if (v38 < v39)
    y = y + floor((v39 - v38) * 0.5);
LABEL_18:
  v56 = y;
  v57 = width;
  v58 = height;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v3;
  return result;
}

- (UIColor)drawingBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "ic_lightAttachmentBackgroundColor");
}

- (void)animateImageArrivalWithAnimationDuration:(double)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", &unk_1EA821F80);
  objc_msgSend(v5, "setToValue:", &unk_1EA821F90);
  objc_msgSend(v5, "setDuration:", a3);
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v5, CFSTR("opacity"));

  v7 = -[ICDrawingInlineView shouldUseLightDrawingBackground](self, "shouldUseLightDrawingBackground");
  -[ICDrawingInlineView ic_backgroundColor](self, "ic_backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke;
    v11[3] = &unk_1EA7DE660;
    v11[4] = self;
    v12 = v7;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke_2;
    v9[3] = &unk_1EA7DE660;
    v10 = v7;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "ic_animateWithDuration:animations:completion:", v11, v9, a3);
  }

}

void __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "drawingBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = (id *)(a1 + 32);
  }
  v4 = (id)v3;
  objc_msgSend(*v2, "setIc_backgroundColor:", v3);

}

uint64_t __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "setIc_backgroundColor:", 0);
  return result;
}

- (id)attachmentImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICDrawingInlineView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  v5 = v4;
  v7 = v6;
  -[ICDrawingInlineView ic_appearanceInfo](self, "ic_appearanceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v8, "type"), 1, v5, v7, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "orientedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)previewImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int IsLandscape;
  double v26;
  double v27;
  void *v28;
  void *v29;

  -[ICDrawingInlineView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDrawingInlineView ic_backingScaleFactor](self, "ic_backingScaleFactor");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSize");
    v7 = v6;
    v9 = v8;
    -[ICDrawingInlineView attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    -[ICDrawingInlineView frame](self, "frame");
    v16 = v15;
    v18 = v17;
    if (-[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay"))
    {
      v19 = fmax(v16, 256.0);
      if (v12 >= v16)
        v20 = v16;
      else
        v20 = v19;
      v21 = fmax(v18, 256.0);
      if (v14 >= v18)
        v22 = v18;
      else
        v22 = v21;
    }
    else
    {
      -[ICDrawingInlineView attachment](self, "attachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "orientation");
      IsLandscape = ICDrawingOrientationIsLandscape();

      v26 = v7 / v12;
      v27 = v9 / v14;
      if (IsLandscape)
      {
        v20 = v26 * v16;
        v22 = v27 * v18;
      }
      else
      {
        v22 = v26 * v18;
        v20 = v27 * v16;
      }
    }
    -[ICDrawingInlineView attachment](self, "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawingInlineView ic_appearanceInfo](self, "ic_appearanceInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v29, "type"), 1, v20, v22, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (void)updateImageWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  ICDrawingInlineView *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[6];
  BOOL v36;
  _QWORD v37[3];
  char v38;

  v3 = a3;
  -[ICDrawingInlineView bounds](self, "bounds");
  if (v6 != *MEMORY[0x1E0C9D820] || v5 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[ICDrawingInlineView previewImage](self, "previewImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (-[ICDrawingInlineView forManualRendering](self, "forManualRendering"))
      {
        objc_msgSend(v8, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDrawingInlineView updateLayerImage:animation:](self, "updateLayerImage:animation:", v9, 0);

      }
      else
      {
        -[ICDrawingInlineView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[ICDrawingInlineView setNeedsToUpdateImage:](self, "setNeedsToUpdateImage:", 1);
        }
        else
        {
          if (!-[ICDrawingInlineView hasImage](self, "hasImage")
            && (-[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay") || v3))
          {
            objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
            objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
            objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
            -[ICDrawingInlineView imageFrame](self, "imageFrame");
            v12 = v11;
            v14 = v13;
            v16 = v15;
            v18 = v17;
            -[ICDrawingInlineView imageLayer](self, "imageLayer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

            -[ICDrawingInlineView borderColor](self, "borderColor");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = objc_msgSend(v20, "CGColor");
            -[ICDrawingInlineView layer](self, "layer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setBorderColor:", v21);

            -[ICDrawingInlineView updateBorderWidth](self, "updateBorderWidth");
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.04);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDrawingInlineView setIc_backgroundColor:](self, "setIc_backgroundColor:", v23);

            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
          }
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v38 = 0;
          v24 = MEMORY[0x1E0C809B0];
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke;
          v35[3] = &unk_1EA7E1690;
          v35[4] = self;
          v35[5] = v37;
          v36 = v3;
          objc_msgSend(v8, "asyncImage:aboutToLoadHandler:", v35, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "copy");

          if (v26)
          {
            v28 = v24;
            v29 = 3221225472;
            v30 = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_4;
            v31 = &unk_1EA7E16B8;
            v34 = v37;
            v32 = self;
            v33 = v26;
            v27 = _Block_copy(&v28);
            -[ICDrawingInlineView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", v27, v28, v29, v30, v31);

          }
          _Block_object_dispose(v37, 8);
        }
      }
    }

  }
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  char v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_2;
  v5[3] = &unk_1EA7E1668;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;
  id location;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      v2 = *(void **)(a1 + 32);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_3;
      v3[3] = &unk_1EA7E1640;
      objc_copyWeak(&v4, &location);
      v5 = *(_BYTE *)(a1 + 56);
      objc_msgSend(v2, "ic_decodeWithCompletion:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "updateLayerImage:animation:", 0, *(unsigned __int8 *)(a1 + 56));
    }
  }
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateLayerImage:animation:", v5, *(unsigned __int8 *)(a1 + 40));

}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  if ((objc_msgSend(*(id *)(a1 + 32), "thumbnailDisplay") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBorderColor:", 0);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBorderWidth:", 0.0);

  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "shouldUseLightDrawingBackground");
  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "drawingBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setIc_backgroundColor:", v6);

  }
  else
  {
    objc_msgSend(v5, "setIc_backgroundColor:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsToUpdateImage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "previewImageUpdateDelayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPreviousFireRequests");

}

- (BOOL)hasImage
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)updateLayerImage:(id)a3 animation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t);
  void *v61;
  ICDrawingInlineView *v62;
  id v63;
  _OWORD v64[7];

  v4 = a4;
  v6 = a3;
  -[ICDrawingInlineView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
  v7 = 0x1E0CD2000uLL;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  -[ICDrawingInlineView attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "orientation");

  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSizeOrientationTransform:", v9);
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = *(_OWORD *)((char *)&v64[3] + 8);
  v64[1] = *(_OWORD *)((char *)&v64[4] + 8);
  v64[2] = *(_OWORD *)((char *)&v64[5] + 8);
  objc_msgSend(v10, "setAffineTransform:", v64);

  -[ICDrawingInlineView imageFrame](self, "imageFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v20 = 0.1;
  if (!v4)
    v20 = 0.0;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v20);
  -[ICDrawingInlineView attachment](self, "attachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "previewUpdateDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineView attachment](self, "attachment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "modificationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v22, "compare:", v24);

  if (v4)
    v26 = !-[ICDrawingInlineView hasImage](self, "hasImage");
  else
    v26 = 0;
  -[ICDrawingInlineView attachment](self, "attachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  v29 = v28;
  v31 = v30;
  -[ICDrawingInlineView ic_appearanceInfo](self, "ic_appearanceInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v32, "type"), 1, v29, v31, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 || v25 != -1)
    && (v33
     || (objc_msgSend(0, "size"),
         v39 = v38,
         v41 = v40,
         objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize"),
         v39 == v43)
     && v41 == v42))
  {
    v44 = -[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay");
    objc_msgSend(v6, "ic_CGImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      -[ICDrawingInlineView layer](self, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setBorderColor:", 0);

      -[ICDrawingInlineView layer](self, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setBorderWidth:", 0.0);

      goto LABEL_18;
    }
    v34 = v4;
    v35 = v33;
    v37 = 0;
  }
  else
  {
    v34 = v4;
    v35 = v33;
    objc_msgSend(v6, "ic_CGImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 1;
  }
  -[ICDrawingInlineView borderColor](self, "borderColor");
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v46 = objc_msgSend(v45, "CGColor");
  -[ICDrawingInlineView layer](self, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBorderColor:", v46);

  -[ICDrawingInlineView updateBorderWidth](self, "updateBorderWidth");
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.04);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawingInlineView setIc_backgroundColor:](self, "setIc_backgroundColor:", v48);

    -[ICDrawingInlineView observePreviewGenerationProgress:](self, "observePreviewGenerationProgress:", 0);
    v49 = *(float *)"333?";
    v33 = v35;
    v4 = v34;
    v7 = 0x1E0CD2000;
    goto LABEL_22;
  }
  v33 = v35;
  v4 = v34;
  v7 = 0x1E0CD2000;
LABEL_18:
  if (-[ICDrawingInlineView shouldUseLightDrawingBackground](self, "shouldUseLightDrawingBackground"))
  {
    -[ICDrawingInlineView drawingBackgroundColor](self, "drawingBackgroundColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawingInlineView setIc_backgroundColor:](self, "setIc_backgroundColor:", v52);

  }
  else
  {
    -[ICDrawingInlineView setIc_backgroundColor:](self, "setIc_backgroundColor:", 0);
  }
  -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "removeFromSuperlayer");

  -[ICDrawingInlineView setLoadingProgressLayer:](self, "setLoadingProgressLayer:", 0);
  v49 = 1.0;
LABEL_22:
  if (!(v26 | !v4))
  {
    v55 = (void *)MEMORY[0x1E0DC3F10];
    v58 = MEMORY[0x1E0C809B0];
    v59 = 3221225472;
    v60 = __50__ICDrawingInlineView_updateLayerImage_animation___block_invoke;
    v61 = &unk_1EA7DD498;
    v62 = self;
    v63 = v36;
    objc_msgSend(v55, "ic_animateWithDuration:animations:completion:", &v58, 0, 0.3);

    if (!v6)
      goto LABEL_27;
    goto LABEL_26;
  }
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setContents:", v36);

  if (v6)
  {
LABEL_26:
    -[ICDrawingInlineView imageLayer](self, "imageLayer", v58, v59, v60, v61, v62);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v57 = v49;
    objc_msgSend(v56, "setOpacity:", v57);

  }
LABEL_27:
  objc_msgSend(*(id *)(v7 + 2224), "commit", v58, v59, v60, v61, v62);
  if (-[ICDrawingInlineView needsToUpdateImage](self, "needsToUpdateImage"))
  {
    -[ICDrawingInlineView setNeedsToUpdateImage:](self, "setNeedsToUpdateImage:", 0);
    -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", v4);
  }

}

void __50__ICDrawingInlineView_updateLayerImage_animation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContents:", v1);

}

- (BOOL)isReadyToPresent
{
  void *v2;
  BOOL v3;

  -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)didScrollOutOfVisibleRange
{
  void *v3;
  void (**v4)(void);
  void *v5;
  id v6;

  -[ICDrawingInlineView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDrawingInlineView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[ICDrawingInlineView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
  }
  -[ICDrawingInlineView imageLayer](self, "imageLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", 0);

  -[ICDrawingInlineView previewImageUpdateDelayer](self, "previewImageUpdateDelayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelPreviousFireRequests");

}

- (void)didScrollIntoVisibleRange
{
  if (!-[ICDrawingInlineView hasImage](self, "hasImage"))
    -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", 1);
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void (**v6)(void);
  void *v7;

  -[ICDrawingInlineView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[ICDrawingInlineView hasImage](self, "hasImage");

    if (v5)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[ICDrawingInlineView imageLoadingCancelBlock](self, "imageLoadingCancelBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      -[ICDrawingInlineView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", 0);
      -[ICDrawingInlineView previewImageUpdateDelayer](self, "previewImageUpdateDelayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelPreviousFireRequests");

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v9 = CGRectGetMaxX(v15) + -21.0;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v10 = CGRectGetMaxY(v16) + -21.0;
    -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPosition:", v9, v10);

  }
  -[ICDrawingInlineView frame](self, "frame");
  v12 = v17.size.width;
  v13 = v17.size.height;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectEqualToRect(v17, v18))
  {
    v14.receiver = self;
    v14.super_class = (Class)ICDrawingInlineView;
    -[ICDrawingInlineView setFrame:](&v14, sel_setFrame_, x, y, width, height);
    if (v12 != width || v13 != height)
      -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", 1);
  }
}

- (void)didMoveToWindow
{
  if (-[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay"))
    -[ICDrawingInlineView updateBorderWidth](self, "updateBorderWidth");
}

- (void)updateBorderWidth
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if (-[ICDrawingInlineView thumbnailDisplay](self, "thumbnailDisplay"))
  {
    -[ICDrawingInlineView ic_backingScaleFactor](self, "ic_backingScaleFactor");
    v4 = 1.0 / v3;
    -[ICDrawingInlineView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = v4;
  }
  else
  {
    -[ICDrawingInlineView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1.0;
    v7 = v5;
  }
  objc_msgSend(v5, "setBorderWidth:", v6);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDrawingInlineView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineView;
  -[ICDrawingInlineView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", 1);
}

- (void)observePreviewGenerationProgress:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  CGFloat v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  v11 = a3;
  v4 = -[ICDrawingInlineView hideLoadingProgress](self, "hideLoadingProgress");
  v5 = v11;
  if (!v4)
  {
    -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D64C78]);
      -[ICDrawingInlineView bounds](self, "bounds");
      v8 = CGRectGetMaxX(v12) + -21.0;
      -[ICDrawingInlineView bounds](self, "bounds");
      objc_msgSend(v7, "setPosition:", v8, CGRectGetMaxY(v13) + -21.0);
      objc_msgSend(v7, "setZPosition:", 1.0);
      objc_msgSend(v7, "setRemoveOnCompletion:", 1);
      -[ICDrawingInlineView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSublayer:", v7);

      -[ICDrawingInlineView setLoadingProgressLayer:](self, "setLoadingProgressLayer:", v7);
    }
    v5 = v11;
    if (v11)
    {
      -[ICDrawingInlineView loadingProgressLayer](self, "loadingProgressLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObservedProgress:", v11);

      v5 = v11;
    }
  }

}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v3;

  -[ICDrawingInlineView previewImageUpdateDelayer](self, "previewImageUpdateDelayer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFire");

}

- (void)attachmentPreviewDidStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D63650]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ICDrawingInlineView_attachmentPreviewDidStart___block_invoke;
  v9[3] = &unk_1EA7DD498;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __49__ICDrawingInlineView_attachmentPreviewDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observePreviewGenerationProgress:", *(_QWORD *)(a1 + 40));
}

- (void)delayedPreviewImageChanged
{
  if (-[ICDrawingInlineView isVisibleWithinScrollView](self, "isVisibleWithinScrollView"))
    -[ICDrawingInlineView updateImageWithAnimation:](self, "updateImageWithAnimation:", 1);
}

- (BOOL)isVisibleWithinScrollView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  BOOL v12;
  CGRect v14;
  CGRect v15;

  -[ICDrawingInlineView lowestSuperScrollView](self, "lowestSuperScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICDrawingInlineView bounds](self, "bounds");
    -[ICDrawingInlineView convertRect:toView:](self, "convertRect:toView:", v3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "bounds");
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    v12 = CGRectIntersectsRect(v14, v15);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)lowestSuperScrollView
{
  ICDrawingInlineView *v2;
  uint64_t v3;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[ICDrawingInlineView superview](v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (ICDrawingInlineView *)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ICDrawingInlineView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1EA7E16E0;
  v5[4] = self;
  v4 = (id)-[ICDrawingInlineView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

void __46__ICDrawingInlineView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateImageWithAnimation:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldUseLightDrawingBackground");
  if (objc_msgSend(*(id *)(a1 + 32), "hasImage"))
  {
    v3 = *(void **)(a1 + 32);
    if ((v2 & 1) != 0)
    {
      objc_msgSend(v3, "drawingBackgroundColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v4);

    }
    else
    {
      objc_msgSend(v3, "setBackgroundColor:", 0);
    }
  }
}

- (BOOL)thumbnailDisplay
{
  return self->_thumbnailDisplay;
}

- (void)setThumbnailDisplay:(BOOL)a3
{
  self->_thumbnailDisplay = a3;
}

- (BOOL)hideLoadingProgress
{
  return self->_hideLoadingProgress;
}

- (void)setHideLoadingProgress:(BOOL)a3
{
  self->_hideLoadingProgress = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)showGotoNote
{
  return self->_showGotoNote;
}

- (void)setShowGotoNote:(BOOL)a3
{
  self->_showGotoNote = a3;
}

- (CGSize)attachmentContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_attachmentContentSize.width;
  height = self->_attachmentContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAttachmentContentSize:(CGSize)a3
{
  self->_attachmentContentSize = a3;
}

- (BOOL)isInAttachmentBrowser
{
  return self->_isInAttachmentBrowser;
}

- (void)setIsInAttachmentBrowser:(BOOL)a3
{
  self->_isInAttachmentBrowser = a3;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (BOOL)fullscreen
{
  return self->_fullscreen;
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (id)imageLoadingCancelBlock
{
  return self->_imageLoadingCancelBlock;
}

- (void)setImageLoadingCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (BOOL)needsToUpdateImage
{
  return self->_needsToUpdateImage;
}

- (void)setNeedsToUpdateImage:(BOOL)a3
{
  self->_needsToUpdateImage = a3;
}

- (ICSelectorDelayer)previewImageUpdateDelayer
{
  return self->_previewImageUpdateDelayer;
}

- (void)setPreviewImageUpdateDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageUpdateDelayer, a3);
}

- (ICLoadingPieLayer)loadingProgressLayer
{
  return (ICLoadingPieLayer *)objc_loadWeakRetained((id *)&self->_loadingProgressLayer);
}

- (void)setLoadingProgressLayer:(id)a3
{
  objc_storeWeak((id *)&self->_loadingProgressLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_loadingProgressLayer);
  objc_storeStrong((id *)&self->_previewImageUpdateDelayer, 0);
  objc_storeStrong(&self->_imageLoadingCancelBlock, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
