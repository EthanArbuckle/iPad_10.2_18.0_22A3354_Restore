@implementation ViewWithDrawInfo

- (ViewWithDrawInfo)init
{
  ViewWithDrawInfo *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ViewWithDrawInfo;
  v2 = -[ViewWithDrawInfo init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ViewWithDrawInfo setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[ViewWithDrawInfo setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    -[ViewWithDrawInfo layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v4, "setNeedsDisplay");

  }
  return v2;
}

- (void)setDrawInfo:(id)a3
{
  objc_storeStrong((id *)&self->_drawInfo, a3);
  -[ViewWithDrawInfo setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  CGContextRef CurrentContext;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ViewWithDrawInfo;
  -[ViewWithDrawInfo drawRect:](&v9, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ViewWithDrawInfo drawInfo](self, "drawInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderingBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ViewWithDrawInfo drawInfo](self, "drawInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renderingBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    CurrentContext = UIGraphicsGetCurrentContext();
    ((void (**)(_QWORD, CGContextRef))v7)[2](v7, CurrentContext);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  CGSize v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)ViewWithDrawInfo;
  -[ViewWithDrawInfo description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithDrawInfo drawInfo](self, "drawInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  NSStringFromCGSize(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithDrawInfo drawInfo](self, "drawInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderingBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _Block_copy(v8);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <contentSize: %@, drawBlock: %@>"), v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CUIKORTextDrawInfo)drawInfo
{
  return self->_drawInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawInfo, 0);
}

@end
