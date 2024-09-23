@implementation CLKUIWheelsOfTimeButton

- (CLKUIWheelsOfTimeButton)initWithFrame:(CGRect)a3
{
  CLKUIWheelsOfTimeButton *v3;
  CLKUIWheelsOfTimeButton *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIWheelsOfTimeButton;
  v3 = -[CLKUIWheelsOfTimeButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CLKUIWheelsOfTimeButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 3.0);

    -[CLKUIWheelsOfTimeButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 0.0);

    -[CLKUIWheelsOfTimeButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[CLKUIWheelsOfTimeButton bounds](self, "bounds", a4);
  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchEdgeInsets.right);
  v15.size.height = v12 - (top + self->_touchEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (CGRect)_getMaxTextBounds
{
  CGRect v2;

  -[CLKUIWheelsOfTimeButton bounds](self, "bounds");
  return CGRectInset(v2, 0.5, 0.5);
}

- (__CFAttributedString)_newAttributedString:(id)a3 withFont:(id)a4 usingKerning:(double)a5 textColor:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  const __CFAllocator *v13;
  __CFAttributedString *Mutable;
  CFIndex Length;
  const __CFString *v16;
  id v17;
  const void *v18;
  CFNumberRef v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  const __CFString *v28;
  void *i;
  const __CTLine *v30;
  double width;
  double height;
  BOOL v33;
  uint64_t v35;
  double valuePtr;
  CFRange v38;
  CFRange v39;
  CFRange v40;
  CFRange v41;
  CGRect BoundsWithOptions;

  v10 = (__CFString *)a3;
  v11 = a4;
  valuePtr = a5;
  v12 = a6;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFAttributedStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v38.location = 0;
  v38.length = 0;
  CFAttributedStringReplaceString(Mutable, v38, v10);
  Length = CFAttributedStringGetLength(Mutable);
  v16 = (const __CFString *)*MEMORY[0x1E0CA8550];
  v17 = objc_retainAutorelease(v12);
  v18 = (const void *)objc_msgSend(v17, "CGColor");
  v39.location = 0;
  v39.length = Length;
  CFAttributedStringSetAttribute(Mutable, v39, v16, v18);
  if (a5 != 0.0)
  {
    v19 = CFNumberCreate(v13, kCFNumberFloatType, &valuePtr);
    v40.length = CFAttributedStringGetLength(Mutable);
    v40.location = 0;
    CFAttributedStringSetAttribute(Mutable, v40, (CFStringRef)*MEMORY[0x1E0CA8588], v19);
    CFRelease(v19);
  }
  objc_msgSend(v11, "pointSize");
  v21 = v20;
  v22 = v20 * 0.5;
  -[CLKUIWheelsOfTimeButton _getMaxTextBounds](self, "_getMaxTextBounds");
  v24 = v23;
  v26 = v25;
  v27 = v11;
  v28 = (const __CFString *)*MEMORY[0x1E0CA8188];
  for (i = v27; ; i = (void *)v35)
  {
    v41.length = CFAttributedStringGetLength(Mutable);
    v41.location = 0;
    CFAttributedStringSetAttribute(Mutable, v41, v28, i);
    v30 = CTLineCreateWithAttributedString(Mutable);
    BoundsWithOptions = CTLineGetBoundsWithOptions(v30, 8uLL);
    width = BoundsWithOptions.size.width;
    height = BoundsWithOptions.size.height;
    CFRelease(v30);
    v33 = width <= v24 && height <= v26;
    v21 = v21 + -0.5;
    if (v33 || v21 < v22)
      break;
    objc_msgSend(v27, "fontWithSize:", v21);
    v35 = objc_claimAutoreleasedReturnValue();

  }
  return Mutable;
}

- (void)setButtonText:(id)a3 selectedFont:(id)a4 selectedTextColor:(id)a5 unselectedFont:(id)a6 unselectedTextColor:(id)a7 kerning:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __CFAttributedString *v19;
  __CFAttributedString *v20;
  void *v21;
  id v22;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CLKUIWheelsOfTimeButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v18);
  v19 = -[CLKUIWheelsOfTimeButton _newAttributedString:withFont:usingKerning:textColor:](self, "_newAttributedString:withFont:usingKerning:textColor:", v18, v17, v16, a8);

  -[CLKUIWheelsOfTimeButton _createButtonImage:](self, "_createButtonImage:", v19);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIWheelsOfTimeButton setImage:forState:](self, "setImage:forState:", v22, 4);
  CFRelease(v19);
  v20 = -[CLKUIWheelsOfTimeButton _newAttributedString:withFont:usingKerning:textColor:](self, "_newAttributedString:withFont:usingKerning:textColor:", v18, v15, v14, a8);

  -[CLKUIWheelsOfTimeButton _createButtonImage:](self, "_createButtonImage:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIWheelsOfTimeButton setImage:forState:](self, "setImage:forState:", v21, 0);
  CFRelease(v20);

}

- (id)_createButtonImage:(__CFAttributedString *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGContext *CurrentContext;
  __int128 v14;
  CGFloat v15;
  const __CTLine *v16;
  double x;
  double y;
  double width;
  double height;
  double v21;
  double v22;
  double v23;
  void *v24;
  CGAffineTransform v26;
  CGSize v27;
  CGRect BoundsWithOptions;

  -[CLKUIWheelsOfTimeButton bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screenScale");
  v12 = v11;
  v27.width = v6;
  v27.height = v8;
  UIGraphicsBeginImageContextWithOptions(v27, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v26.c = v14;
  *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGContextSetTextMatrix(CurrentContext, &v26);
  -[CLKUIWheelsOfTimeButton bounds](self, "bounds");
  CGContextTranslateCTM(CurrentContext, 0.0, v15);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v16 = CTLineCreateWithAttributedString(a3);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v16, 8uLL);
  x = BoundsWithOptions.origin.x;
  y = BoundsWithOptions.origin.y;
  width = BoundsWithOptions.size.width;
  height = BoundsWithOptions.size.height;
  -[CLKUIWheelsOfTimeButton bounds](self, "bounds");
  v22 = (v21 - width) * 0.5;
  -[CLKUIWheelsOfTimeButton bounds](self, "bounds");
  CGContextSetTextPosition(CurrentContext, v22 - x, (v23 - height) * 0.5 - y);
  CTLineDraw(v16, CurrentContext);
  CFRelease(v16);
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v24;
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  bottom = self->_touchEdgeInsets.bottom;
  right = self->_touchEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

@end
