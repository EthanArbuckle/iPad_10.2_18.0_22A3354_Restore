@implementation UITopoView

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setNetTopoMiniStaticLayout_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)UITopoView;
  -[UITopoView dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (void *)objc_msgSend_layer(self, a2, v2);
  objc_msgSend_bounds(v3, v4, v5);
  v7 = v6;
  v8 = *MEMORY[0x24BDF7FB8];
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend_frame(self, a2, v3);
  v10 = v9;
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)UITopoView;
  -[UITopoView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (width != v10 || height != v12)
  {
    if (objc_msgSend_netTopoMiniStaticLayout(self, v13, v14))
    {
      v18 = (void *)objc_msgSend_netTopoMiniStaticLayout(self, v16, v17);
      objc_msgSend_performLayout(v18, v19, v20);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend_bounds(self, a2, v3);
  v10 = v9;
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)UITopoView;
  -[UITopoView setBounds:](&v21, sel_setBounds_, x, y, width, height);
  if (width != v10 || height != v12)
  {
    if (objc_msgSend_netTopoMiniStaticLayout(self, v13, v14))
    {
      v18 = (void *)objc_msgSend_netTopoMiniStaticLayout(self, v16, v17);
      objc_msgSend_performLayout(v18, v19, v20);
    }
  }
}

- (NetTopoMiniStaticLayout)netTopoMiniStaticLayout
{
  return self->netTopoMiniStaticLayout;
}

- (void)setNetTopoMiniStaticLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

@end
