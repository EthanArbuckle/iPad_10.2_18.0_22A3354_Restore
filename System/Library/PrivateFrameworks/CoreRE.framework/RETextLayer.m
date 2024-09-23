@implementation RETextLayer

- (void)setAttributedString:(__CFAttributedString *)a3
{
  __CFAttributedString *attributedString;

  attributedString = self->_attributedString;
  if (attributedString != a3)
  {
    if (attributedString)
      CFRelease(attributedString);
    self->_attributedString = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setRenderBlock:(id)a3
{
  void *v4;
  id renderBlock;

  v4 = _Block_copy(a3);
  renderBlock = self->_renderBlock;
  self->_renderBlock = v4;

}

- (void)dealloc
{
  __CFAttributedString *attributedString;
  objc_super v4;

  attributedString = self->_attributedString;
  if (attributedString)
    CFRelease(attributedString);
  v4.receiver = self;
  v4.super_class = (Class)RETextLayer;
  -[RETextLayer dealloc](&v4, sel_dealloc);
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  float top;
  double left;
  double v9;
  double v10;
  double v11;
  double bottom;
  double v13;
  double v14;
  double v15;
  void (**renderBlock)(id, CGContext *, __CFAttributedString *, uint64_t, double, double, double, double, double, double);
  double v17;
  __CFAttributedString *attributedString;
  uint64_t v19;
  double v20;
  double v21;
  const CGPath *v22;
  const __CTFramesetter *v23;
  const __CTFrame *Frame;
  CFRange v25;
  CGRect v26;

  -[RETextLayer bounds](self, "bounds");
  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  v10 = v9 + left;
  v11 = v6 - left - self->_edgeInsets.right;
  bottom = self->_edgeInsets.bottom;
  v14 = v13 - bottom;
  v15 = v14 - top;
  renderBlock = (void (**)(id, CGContext *, __CFAttributedString *, uint64_t, double, double, double, double, double, double))self->_renderBlock;
  if (renderBlock)
  {
    v17 = v5 + top;
    attributedString = self->_attributedString;
    v19 = -[RETextLayer backgroundColor](self, "backgroundColor");
    -[RETextLayer bounds](self, "bounds");
    renderBlock[2](renderBlock, a3, attributedString, v19, v10, v17, v11, v15, v20, v21);
  }
  else
  {
    v26.origin.y = v5 + bottom;
    v26.origin.x = v10;
    v26.size.width = v6 - left - self->_edgeInsets.right;
    v26.size.height = v14 - top;
    v22 = CGPathCreateWithRect(v26, 0);
    v23 = CTFramesetterCreateWithAttributedString(self->_attributedString);
    v25.length = CFAttributedStringGetLength(self->_attributedString);
    v25.location = 0;
    Frame = CTFramesetterCreateFrame(v23, v25, v22, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(v23);
    CGPathRelease(v22);
  }
}

- (__CFAttributedString)attributedString
{
  return self->_attributedString;
}

- (EdgeInsets)edgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  EdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(EdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
