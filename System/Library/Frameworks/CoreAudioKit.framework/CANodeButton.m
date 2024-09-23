@implementation CANodeButton

- (CANodeButton)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CANodeButton;
  return -[CANodeButton init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CANodeButton;
  -[CANodeButton dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  double v20;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)CANodeButton;
  -[CANodeButton layoutSubviews](&v21, sel_layoutSubviews);
  if (-[CANodeButton hasLabel](self, "hasLabel"))
  {
    v3 = (void *)objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "text");
    v22 = *MEMORY[0x24BEBB360];
    v23[0] = objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "font");
    objc_msgSend(v3, "sizeWithAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  if (v7 == 0.0)
    v8 = 0.0;
  else
    v8 = v7 + 4.0;
  -[CANodeButton frame](self, "frame");
  v10 = v9;
  -[CANodeButton frame](self, "frame");
  if (v10 >= v11 - v8)
    v10 = v11 - v8;
  -[CANodeButton frame](self, "frame");
  v13 = (v12 - v10) * 0.5;
  v14 = floorf(v13);
  -[CANodeButton frame](self, "frame");
  v16 = (v15 - v8 - v10) * 0.5;
  objc_msgSend((id)-[CANodeButton imageView](self, "imageView"), "setFrame:", v14, floorf(v16), v10, v10);
  -[CANodeButton frame](self, "frame");
  v18 = (v17 - v5) * 0.5;
  v19 = floorf(v18);
  -[CANodeButton frame](self, "frame");
  objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "setFrame:", v19, v20 - v7, v5, v7);
}

- (BOOL)hasLabel
{
  return self->hasLabel;
}

- (void)setHasLabel:(BOOL)a3
{
  void *v5;

  self->hasLabel = a3;
  v5 = (void *)-[CANodeButton titleLabel](self, "titleLabel");
  if (a3)
    -[CANodeButton addSubview:](self, "addSubview:", v5);
  else
    objc_msgSend(v5, "removeFromSuperview");
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 760, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

@end
