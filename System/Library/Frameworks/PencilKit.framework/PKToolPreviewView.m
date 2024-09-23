@implementation PKToolPreviewView

- (PKToolPreviewView)initWithFrame:(CGRect)a3
{
  PKToolPreviewView *v3;
  PKToolPreviewView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKToolPreviewView;
  v3 = -[PKToolPreviewView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKToolPreviewView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)prepareWithFrame:(double)a3 mode:(double)a4
{
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  CGSize v36;

  if (result)
  {
    v11 = result;
    objc_msgSend(result, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);

    if (v11[52])
    {
      if (a2)
        goto LABEL_4;
    }
    else
    {
      v30 = objc_alloc_init(MEMORY[0x1E0CD2708]);
      v31 = v11[52];
      v11[52] = v30;

      +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.2, 0.8, (uint64_t)PKMetalView, v11[52]);
      objc_msgSend(v11[52], "setReducesCaptureBitDepth:", 1);
      objc_msgSend(v11[52], "setIgnoresScreenClip:", 1);
      objc_msgSend(v11[52], "setScale:", 0.25);
      objc_msgSend(v11, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSublayer:", v11[52]);

      if (a2)
      {
LABEL_4:
        if (a2 > 3)
        {
LABEL_12:
          objc_msgSend(v11, "setFrame:", a3, a4, a5, a6);
          return (void **)objc_msgSend(v11, "setNeedsLayout");
        }
        v14 = v11[54];
        if (!v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
          v16 = &OBJC_IVAR___PKToolPreviewView__symbolLayer;
          v17 = v11[54];
          v11[54] = v15;

          v18 = 8 * a2 - 8;
          v19 = *(uint64_t *)((char *)off_1E7779EB0 + v18);
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, -1, *(double *)((char *)&unk_1BE4FCE78 + v18));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "size");
          v23 = v22;
          v25 = v24;
          objc_msgSend(v21, "scale");
          v27 = v26;
          v36.width = v23;
          v36.height = v25;
          UIGraphicsBeginImageContextWithOptions(v36, 0, v27);
          objc_msgSend(v21, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
          UIGraphicsGetImageFromCurrentImageContext();
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          UIGraphicsEndImageContext();
          v29 = objc_retainAutorelease(v28);
          objc_msgSend(v11[54], "setContents:", objc_msgSend(v29, "CGImage"));

LABEL_10:
          v14 = *(void **)((char *)v11 + *v16);
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    v14 = v11[53];
    if (!v14)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      v16 = &OBJC_IVAR___PKToolPreviewView__shapeLayer;
      v34 = v11[53];
      v11[53] = v33;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v11[53], "setFillColor:", objc_msgSend(v35, "CGColor"));

      objc_msgSend(v11[53], "setLineWidth:", 1.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v11[53], "setStrokeColor:", objc_msgSend(v20, "CGColor"));
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend(v11[52], "setMask:", v14);
    goto LABEL_12;
  }
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKToolPreviewView;
  -[PKToolPreviewView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKToolPreviewView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_symbolLayer, "setFrame:", v4, v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
}

@end
