@implementation PKEraserTool

- (PKEraserTool)initWithEraserType:(PKEraserType)eraserType
{
  void *v4;
  PKEraserTool *v5;
  objc_super v7;

  PKEraserInkForTypeAndWeight(eraserType, NAN);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKEraserTool;
  v5 = -[PKTool _initWithInk:](&v7, sel__initWithInk_, v4);

  return v5;
}

- (PKEraserTool)initWithEraserType:(int64_t)a3 weight:(double)a4
{
  void *v5;
  PKEraserTool *v6;
  objc_super v8;

  PKEraserInkForTypeAndWeight(a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKEraserTool;
  v6 = -[PKTool _initWithInk:](&v8, sel__initWithInk_, v5);

  return v6;
}

- (PKEraserTool)initWithEraserType:(PKEraserType)eraserType width:(CGFloat)width
{
  double v6;
  void *v7;
  PKEraserTool *v8;
  objc_super v10;

  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", CFSTR("com.apple.ink.eraser"), width);
  PKEraserInkForTypeAndWeight(eraserType, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PKEraserTool;
  v8 = -[PKTool _initWithInk:](&v10, sel__initWithInk_, v7);

  return v8;
}

- (BOOL)_isFixedWidthBitmap
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKTool ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.eraser")))
  {
    -[PKTool ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)objc_msgSend(v5, "version") > 3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGFloat)width
{
  void *v3;
  double v4;
  double v5;

  if (!-[PKEraserTool _isFixedWidthBitmap](self, "_isFixedWidthBitmap"))
    return 0.0;
  -[PKTool ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weight");
  +[PKInkingTool _widthForWeight:type:](PKInkingTool, "_widthForWeight:type:", CFSTR("com.apple.ink.eraser"));
  v5 = v4;

  return v5;
}

- (void)setWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  if (-[PKEraserTool _isFixedWidthBitmap](self, "_isFixedWidthBitmap", a3))
  {
    -[PKTool ink](self, "ink");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "weight");
    +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", CFSTR("com.apple.ink.eraser"));
    v5 = v4;
    -[PKTool ink](self, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWeight:", v5);

  }
}

+ (CGFloat)defaultWidthForEraserType:(PKEraserType)eraserType
{
  CGFloat result;

  if (eraserType != PKEraserTypeFixedWidthBitmap)
    return 0.0;
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", CFSTR("com.apple.ink.eraser"));
  return result;
}

+ (CGFloat)minimumWidthForEraserType:(PKEraserType)eraserType
{
  CGFloat result;

  if (eraserType != PKEraserTypeFixedWidthBitmap)
    return 0.0;
  +[PKInkingTool minimumWidthForInkType:](PKInkingTool, "minimumWidthForInkType:", CFSTR("com.apple.ink.eraser"));
  return result;
}

+ (CGFloat)maximumWidthForEraserType:(PKEraserType)eraserType
{
  CGFloat result;

  if (eraserType != PKEraserTypeFixedWidthBitmap)
    return 0.0;
  +[PKInkingTool maximumWidthForInkType:](PKInkingTool, "maximumWidthForInkType:", CFSTR("com.apple.ink.eraser"));
  return result;
}

- (double)_weight
{
  void *v2;
  double v3;
  double v4;

  -[PKTool ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "version") < 4)
  {
    v4 = NAN;
  }
  else
  {
    objc_msgSend(v2, "weight");
    v4 = v3;
  }

  return v4;
}

- (PKEraserType)eraserType
{
  void *v3;
  void *v4;
  char v5;

  -[PKTool ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.ink.objectEraser"));

  if ((v5 & 1) != 0)
    return 0;
  if (-[PKEraserTool _isFixedWidthBitmap](self, "_isFixedWidthBitmap"))
    return 2;
  return 1;
}

- (BOOL)_isEraserTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return CFSTR("com.apple.tool.eraser");
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end
