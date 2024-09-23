@implementation ABDeviceButtonHighlightView

- (ABDeviceButtonHighlightView)initWithFrame:(CGRect)a3
{
  ABDeviceButtonHighlightView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CAPackage *package;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  CAStateController *stateController;
  void *v13;
  void *v14;
  CATransform3D v16;
  CATransform3D v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ABDeviceButtonHighlightView;
  v3 = -[ABDeviceButtonHighlightView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("button highlight"), CFSTR("ca"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v5, *MEMORY[0x24BDE5D50], 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    package = v3->_package;
    v3->_package = (CAPackage *)v6;

    CATransform3DMakeScale(&v17, 1.0, -1.0, 1.0);
    -[CAPackage rootLayer](v3->_package, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    objc_msgSend(v8, "setTransform:", &v16);

    v9 = objc_alloc(MEMORY[0x24BDE5788]);
    -[CAPackage rootLayer](v3->_package, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithLayer:", v10);
    stateController = v3->_stateController;
    v3->_stateController = (CAStateController *)v11;

    -[ABDeviceButtonHighlightView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAPackage rootLayer](v3->_package, "rootLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v14);

  }
  return v3;
}

- (void)setColor:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(void **)(a1 + 440) != v4)
    {
      v9 = v4;
      objc_storeStrong((id *)(a1 + 440), v4);
      objc_msgSend(*(id *)(a1 + 416), "publishedObjectWithName:", CFSTR("base color"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 416), "publishedObjectWithName:", CFSTR("glow"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 416), "publishedObjectWithName:", CFSTR("ring-confirmation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_retainAutorelease(v9);
      v8 = objc_msgSend(v10, "CGColor");
      objc_msgSend(v7, "setBorderColor:", v8);
      objc_msgSend(v6, "setContentsMultiplyColor:", v8);
      objc_msgSend(v5, "setBackgroundColor:", v8);

      v4 = v10;
    }
  }

}

- (void)setHighlightRingVisible:(uint64_t)a1
{
  char v2;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (a1)
  {
    v2 = a2;
    if (*(unsigned __int8 *)(a1 + 432) != a2)
    {
      *(_BYTE *)(a1 + 432) = a2;
      objc_msgSend(*(id *)(a1 + 416), "rootLayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 424);
      v9 = v4;
      if ((v2 & 1) != 0)
      {
        objc_msgSend(v4, "stateWithName:", CFSTR("long-press-confirmation"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = 1.0;
        objc_msgSend(v6, "setState:ofLayer:transitionSpeed:", v7, v9, v8);

      }
      else
      {
        LODWORD(v5) = 0;
        objc_msgSend(v6, "setState:ofLayer:transitionSpeed:", 0, v4, v5);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
