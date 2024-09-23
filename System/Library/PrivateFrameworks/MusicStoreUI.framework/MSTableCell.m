@implementation MSTableCell

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSTableCell;
  -[SUTableCell dealloc](&v3, sel_dealloc);
}

- (void)setPreviewStatus:(id)a3
{
  -[MSTableCell setPreviewStatus:animated:](self, "setPreviewStatus:animated:", a3, 0);
}

- (void)setPreviewStatus:(id)a3 animated:(BOOL)a4
{
  SUPlayerStatus *previewStatus;
  _BOOL4 v5;
  SUPlayerStatus *v8;
  SUPlayerStatus *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGImage *v18;
  id v19;
  UIBezierPath *v20;
  UIBezierPath *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  UIImage *ImageFromCurrentImageContext;
  id v29;
  MSAudioProgressView *v30;
  MSAudioProgressView *v31;
  CGSize v32;

  previewStatus = self->_previewStatus;
  if (previewStatus != a3)
  {
    v5 = a4;

    v8 = (SUPlayerStatus *)a3;
    self->_previewStatus = v8;
    if (v8)
    {
      if (self->_previewContainerView)
      {
        v9 = v8;
      }
      else
      {
        v10 = (void *)-[MSTableCell contentView](self, "contentView");
        v11 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PreviewFlipBackground"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
        objc_msgSend(v10, "frame");
        v13 = v12;
        v15 = v14;
        objc_msgSend(v11, "size");
        v18 = (CGImage *)objc_msgSend(v10, "newSnapshotWithRect:", v13, v15, v16, v17);
        -[UIImageView removeFromSuperview](self->_backsideSnapshotView, "removeFromSuperview");

        self->_backsideSnapshotView = 0;
        if (v18)
        {
          v19 = objc_alloc(MEMORY[0x24BDF6AE8]);
          self->_backsideSnapshotView = (UIImageView *)objc_msgSend(v19, "initWithImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v18));
          CGImageRelease(v18);
        }
        self->_previewContainerView = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v11);
        v20 = -[SUTableCell clippingPath](self, "clippingPath");
        if (v20)
        {
          v21 = v20;
          -[UIView bounds](self->_previewContainerView, "bounds");
          v23 = v22;
          v25 = v24;
          objc_msgSend(v11, "scale");
          v27 = v26;
          v32.width = v23;
          v32.height = v25;
          UIGraphicsBeginImageContextWithOptions(v32, 0, v27);
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), "set");
          -[UIBezierPath fill](v21, "fill");
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          v29 = objc_alloc_init(MEMORY[0x24BDE56D0]);
          objc_msgSend(v29, "setContents:", -[UIImage CGImage](ImageFromCurrentImageContext, "CGImage"));
          -[CALayer bounds](-[UIView layer](self->_previewContainerView, "layer"), "bounds");
          objc_msgSend(v29, "setFrame:");
          -[CALayer setMask:](-[UIView layer](self->_previewContainerView, "layer"), "setMask:", v29);

          UIGraphicsEndImageContext();
        }
        objc_msgSend(v10, "addSubview:", self->_previewContainerView);
        v30 = [MSAudioProgressView alloc];
        -[UIView bounds](self->_previewContainerView, "bounds");
        v31 = -[MSAudioProgressView initWithFrame:](v30, "initWithFrame:");
        self->_previewProgressView = v31;
        -[MSAudioProgressView setBackgroundColor:](v31, "setBackgroundColor:", -[MSTableCell backgroundColor](self, "backgroundColor"));
        if (v5)
          -[MSTableCell _flipToPreviewProgressView](self, "_flipToPreviewProgressView");
        else
          -[UIView addSubview:](self->_previewContainerView, "addSubview:", self->_previewProgressView);
        -[MSTableCell setNeedsLayout](self, "setNeedsLayout");
        v9 = self->_previewStatus;
      }
      -[MSAudioProgressView setPlayerStatus:](self->_previewProgressView, "setPlayerStatus:", v9);
    }
    else if (v5)
    {
      -[MSTableCell _flipFromPreviewProgressView](self, "_flipFromPreviewProgressView");
    }
    else
    {
      -[MSTableCell _destroyPreviewProgressView](self, "_destroyPreviewProgressView");
    }
  }
}

- (void)_destroyPreviewProgressView
{
  -[UIImageView removeFromSuperview](self->_backsideSnapshotView, "removeFromSuperview");

  self->_backsideSnapshotView = 0;
  -[UIView removeFromSuperview](self->_previewContainerView, "removeFromSuperview");

  self->_previewContainerView = 0;
  -[MSAudioProgressView removeFromSuperview](self->_previewProgressView, "removeFromSuperview");

  self->_previewProgressView = 0;
  -[MSTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_flipFromPreviewProgressView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[6];

  -[NSArray makeObjectsPerformSelector:](-[UIView subviews](self->_previewContainerView, "subviews"), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[UIView bounds](self->_previewContainerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v3, v5, v7, v9);
  -[UIView addSubview:](self->_previewContainerView, "addSubview:", v11);
  objc_msgSend(v11, "addSubview:", self->_previewProgressView);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setBackgroundColor:", -[MSTableCell backgroundColor](self, "backgroundColor"));
  if (self->_backsideSnapshotView)
    objc_msgSend(v12, "addSubview:");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
  v13 = dispatch_time(0, 10000000);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__MSTableCell__flipFromPreviewProgressView__block_invoke;
  v14[3] = &unk_24F1F2D58;
  v14[4] = self;
  v14[5] = v12;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v14);

}

uint64_t __43__MSTableCell__flipFromPreviewProgressView__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 1120);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__MSTableCell__flipFromPreviewProgressView__block_invoke_2;
  v5[3] = &unk_24F1F2C28;
  v5[4] = v2;
  objc_msgSend(MEMORY[0x24BDF6F90], "transitionFromView:toView:duration:options:completion:", v3, v1, 0x100000, v5, 0.6);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

uint64_t __43__MSTableCell__flipFromPreviewProgressView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyPreviewProgressView");
}

- (void)_flipToPreviewProgressView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[6];

  -[UIView bounds](self->_previewContainerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v3, v5, v7, v9);
  -[UIView addSubview:](self->_previewContainerView, "addSubview:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setBackgroundColor:", -[MSTableCell backgroundColor](self, "backgroundColor"));
  if (self->_backsideSnapshotView)
    objc_msgSend(v12, "addSubview:");
  objc_msgSend(v11, "addSubview:", v12);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
  v13 = dispatch_time(0, 10000000);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__MSTableCell__flipToPreviewProgressView__block_invoke;
  v14[3] = &unk_24F1F2D58;
  v14[4] = v12;
  v14[5] = self;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v14);

}

uint64_t __41__MSTableCell__flipToPreviewProgressView__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDF6F90], "transitionFromView:toView:duration:options:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120), 0x200000, 0, 0.6);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (SUPlayerStatus)previewStatus
{
  return self->_previewStatus;
}

@end
