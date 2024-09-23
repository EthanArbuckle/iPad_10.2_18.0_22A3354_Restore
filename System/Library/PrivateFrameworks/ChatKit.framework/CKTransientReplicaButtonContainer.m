@implementation CKTransientReplicaButtonContainer

- (CKTransientReplicaButtonContainer)initWithFrame:(CGRect)a3 hasDarkVibrancy:(BOOL)a4 isInDarkMode:(BOOL)a5 color:(id)a6 sendColor:(char)a7
{
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double height;
  double width;
  double y;
  double x;
  id v15;
  CKTransientReplicaButtonContainer *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CALayer *v28;
  CALayer *v29;
  UIView *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIView *v40;
  void *v41;
  double MidX;
  double MidY;
  void *v44;
  void *v45;
  UIView *cancelButtonCircle;
  UIView *v47;
  UIView *sendButtonCircle;
  UIView *v49;
  CALayer *sendButtonGlyphLayer;
  CALayer *v51;
  CALayer *cancelButtonGlyphLayer;
  CKTransientReplicaButtonContainer *v53;
  int v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a6;
  v63.receiver = self;
  v63.super_class = (Class)CKTransientReplicaButtonContainer;
  v16 = -[CKTransientReplicaButtonContainer initWithFrame:](&v63, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v55 = v9;
    v56 = v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendButtonColorForColorType:", v7);
    v19 = objc_claimAutoreleasedReturnValue();

    v62 = v15;
    v20 = v15;
    -[CKTransientReplicaButtonContainer layer](v16, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupBlending:", 1);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 5, 3, 19.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("circle.fill"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle.fill"), v22);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v22);
    v25 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v24;
    -[CKTransientReplicaButtonContainer _invertedCircularFillGlyph:](v16, "_invertedCircularFillGlyph:", v24);
    v26 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v25;
    -[CKTransientReplicaButtonContainer _invertedCircularFillGlyph:](v16, "_invertedCircularFillGlyph:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v26;
    -[CKTransientReplicaButtonContainer _glyphLayerForButtonAnimationWithImage:](v16, "_glyphLayerForButtonAnimationWithImage:", v26);
    v28 = (CALayer *)objc_claimAutoreleasedReturnValue();
    -[CKTransientReplicaButtonContainer _glyphLayerForButtonAnimationWithImage:](v16, "_glyphLayerForButtonAnimationWithImage:", v27);
    v29 = (CALayer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v30 = (UIView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTransientReplicaButtonContainer bounds](v16, "bounds");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[UIView setFrame:](v30, "setFrame:");
    objc_msgSend(v31, "setFrame:", v33, v35, v37, v39);
    -[UIView setImage:forState:](v30, "setImage:forState:", v23, 0);
    v61 = (void *)v19;
    -[UIView setTintColor:](v30, "setTintColor:", v19);
    objc_msgSend(v31, "setImage:forState:", v23, 0);
    v60 = v20;
    objc_msgSend(v31, "setTintColor:", v20);
    v40 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v33, v35, v37, v39);
    if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityDarkerSystemColorsEnabled())
    {
      -[UIView layer](v40, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      setUpVibrancyForLayer(v41, v55, v56 ^ 1, v56);

    }
    -[UIView addSubview:](v40, "addSubview:", v31);
    -[CKTransientReplicaButtonContainer addSubview:](v16, "addSubview:", v30);
    -[CKTransientReplicaButtonContainer addSubview:](v16, "addSubview:", v40);
    v64.origin.x = v33;
    v64.origin.y = v35;
    v64.size.width = v37;
    v64.size.height = v39;
    MidX = CGRectGetMidX(v64);
    v65.origin.x = v33;
    v65.origin.y = v35;
    v65.size.width = v37;
    v65.size.height = v39;
    MidY = CGRectGetMidY(v65);
    -[CALayer setPosition:](v28, "setPosition:", MidX, MidY);
    -[CALayer setPosition:](v29, "setPosition:", MidX, MidY);
    -[UIView layer](v30, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSublayer:", v28);

    objc_msgSend(v31, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSublayer:", v29);

    cancelButtonCircle = v16->_cancelButtonCircle;
    v16->_cancelButtonCircle = v40;
    v47 = v40;

    sendButtonCircle = v16->_sendButtonCircle;
    v16->_sendButtonCircle = v30;
    v49 = v30;

    sendButtonGlyphLayer = v16->_sendButtonGlyphLayer;
    v16->_sendButtonGlyphLayer = v28;
    v51 = v28;

    cancelButtonGlyphLayer = v16->_cancelButtonGlyphLayer;
    v16->_cancelButtonGlyphLayer = v29;

    v53 = v16;
    v15 = v62;
  }

  return v16;
}

- (id)_invertedCircularFillGlyph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_configurationWithHierarchicalColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0CEA618]);
  -[CKTransientReplicaButtonContainer traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  objc_msgSend(v13, "setScale:");

  objc_msgSend(v4, "imageWithConfiguration:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(v15, "size");
  v17 = (void *)objc_msgSend(v16, "initWithSize:format:", v13);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__CKTransientReplicaButtonContainer__invertedCircularFillGlyph___block_invoke;
  v21[3] = &unk_1E274A3D0;
  v22 = v15;
  objc_msgSend(v17, "imageWithActions:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithRenderingMode:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __64__CKTransientReplicaButtonContainer__invertedCircularFillGlyph___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)_glyphLayerForButtonAnimationWithImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v3);
  v10 = objc_msgSend(v9, "CGImage");

  objc_msgSend(v8, "setContents:", v10);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v5, v7);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v11);

  return v8;
}

- (UIView)sendButtonCircle
{
  return self->_sendButtonCircle;
}

- (UIView)cancelButtonCircle
{
  return self->_cancelButtonCircle;
}

- (CALayer)sendButtonGlyphLayer
{
  return self->_sendButtonGlyphLayer;
}

- (CALayer)cancelButtonGlyphLayer
{
  return self->_cancelButtonGlyphLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonGlyphLayer, 0);
  objc_storeStrong((id *)&self->_sendButtonGlyphLayer, 0);
  objc_storeStrong((id *)&self->_cancelButtonCircle, 0);
  objc_storeStrong((id *)&self->_sendButtonCircle, 0);
}

@end
