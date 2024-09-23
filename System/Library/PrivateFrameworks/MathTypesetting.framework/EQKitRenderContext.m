@implementation EQKitRenderContext

- (EQKitRenderContext)initWithCGContext:(CGContext *)a3
{
  EQKitRenderContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitRenderContext;
  v4 = -[EQKitRenderContext init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_selection = 0;
    v4->_cgContext = a3;
    v4->_highlightColor = 0;
  }
  return v4;
}

- (void)dealloc
{
  CGColor *highlightColor;
  objc_super v4;

  CFRelease(self->_cgContext);
  highlightColor = self->_highlightColor;
  if (highlightColor)
    CFRelease(highlightColor);
  v4.receiver = self;
  v4.super_class = (Class)EQKitRenderContext;
  -[EQKitRenderContext dealloc](&v4, sel_dealloc);
}

- (void)setHighlightColor:(CGColor *)a3
{
  CGColor *highlightColor;

  highlightColor = self->_highlightColor;
  if (highlightColor != a3)
  {
    if (highlightColor)
      CFRelease(highlightColor);
    self->_highlightColor = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (EQKitSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)rendersDebugRects
{
  return self->_rendersDebugRects;
}

- (void)setRendersDebugRects:(BOOL)a3
{
  self->_rendersDebugRects = a3;
}

@end
