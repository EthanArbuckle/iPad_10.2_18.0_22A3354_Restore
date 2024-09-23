@implementation SUUIImageIndexBarEntry

- (SUUIImageIndexBarEntry)initWithImage:(id)a3
{
  id v5;
  SUUIImageIndexBarEntry *v6;
  SUUIImageIndexBarEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIImageIndexBarEntry;
  v6 = -[SUUIImageIndexBarEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    -[SUUIIndexBarEntry setEntryType:](v7, "setEntryType:", 2);
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p image:%@>"), v5, self, self->_image);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIImageIndexBarEntry;
  v3 = -[SUUIIndexBarEntry hash](&v5, sel_hash);
  return -[UIImage hash](self->_image, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SUUIImageIndexBarEntry *v4;
  UIImage *image;
  char v6;
  objc_super v8;

  v4 = (SUUIImageIndexBarEntry *)a3;
  if (v4 == self)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v8.receiver = self,
        v8.super_class = (Class)SUUIImageIndexBarEntry,
        !-[SUUIIndexBarEntry isEqual:](&v8, sel_isEqual_, v4)))
  {
    v6 = 0;
    goto LABEL_8;
  }
  image = v4->_image;
  if (image == self->_image)
  {
LABEL_7:
    v6 = 1;
    goto LABEL_8;
  }
  v6 = -[UIImage isEqual:](image, "isEqual:");
LABEL_8:

  return v6;
}

- (CGSize)_calculatedContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImage size](self->_image, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if ((-[UIImage renderingMode](self->_image, "renderingMode") & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    CGContextSetFillColorWithColor(CurrentContext, 0);
    -[UIImage drawInRect:](self->_image, "drawInRect:", x, y, width, height);
  }
  else
  {
    CGContextBeginTransparencyLayer(CurrentContext, 0);
    CGContextSetFillColorWithColor(CurrentContext, 0);
    -[UIImage drawInRect:](self->_image, "drawInRect:", x, y, width, height);
    -[SUUIIndexBarEntry tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    UIRectFillUsingBlendMode(v10, kCGBlendModeSourceIn);
    CGContextEndTransparencyLayer(CurrentContext);

  }
  CGContextRestoreGState(CurrentContext);
}

- (id)entryImage
{
  return self->_image;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
