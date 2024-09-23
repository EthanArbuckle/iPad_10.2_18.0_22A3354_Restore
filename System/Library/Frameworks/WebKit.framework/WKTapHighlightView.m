@implementation WKTapHighlightView

- (WKTapHighlightView)initWithFrame:(CGRect)a3
{
  WKTapHighlightView *v3;
  WKTapHighlightView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKTapHighlightView;
  v3 = -[WKTapHighlightView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    objc_msgSend((id)-[WKTapHighlightView layer](v3, "layer"), "setNeedsDisplayOnBoundsChange:", 1);
  return v4;
}

- (void)cleanUp
{
  WTF::Vector<WebCore::FloatRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_innerFrames, 0);
  WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_innerQuads, 0);
}

- (void)setColor:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_color.m_ptr;
  self->_color.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setMinimumCornerRadius:(float)a3
{
  self->_minimumCornerRadius = a3;
}

- (void)setCornerRadii:(Radii *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->m_bottomLeft.m_width;
  *(_OWORD *)&self->_cornerRadii.m_topLeft.m_width = *(_OWORD *)&a3->m_topLeft.m_width;
  *(_OWORD *)&self->_cornerRadii.m_bottomLeft.m_width = v3;
}

- (void)setFrames:(void *)a3
{
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  char v8;
  float *p_minimumCornerRadius;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  uint64_t m_size;
  float32x2_t *m_buffer;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[WKTapHighlightView cleanUp](self, "cleanUp");
  v5 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v5)
  {
    v18 = 0uLL;
    goto LABEL_4;
  }
  -[WKTapHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = *((unsigned int *)a3 + 3);
  v18 = 0uLL;
  if ((_DWORD)v5)
  {
LABEL_4:
    v6 = *(__int128 **)a3;
    v7 = *(_QWORD *)a3 + 16 * v5;
    v8 = 1;
    do
    {
      v17 = *v6;
      if ((v8 & 1) != 0)
      {
        p_minimumCornerRadius = &self->_minimumCornerRadius;
        v10 = vld1_dup_f32(p_minimumCornerRadius);
        v18 = *v6;
        v11 = vsub_f32(*(float32x2_t *)&v18, v10);
        v12 = vadd_f32(v10, vadd_f32(v10, *(float32x2_t *)((char *)&v18 + 8)));
      }
      else
      {
        v19 = v18;
        WebCore::FloatRect::unite((WebCore::FloatRect *)&v19, (const WebCore::FloatRect *)&v17);
        v12 = *(float32x2_t *)((char *)&v19 + 8);
        v11 = (float32x2_t)v19;
      }
      v8 = 0;
      *(float32x2_t *)&v18 = v11;
      *((float32x2_t *)&v18 + 1) = v12;
      ++v6;
    }
    while (v6 != (__int128 *)v7);
  }
  WebCore::FloatRect::operator CGRect();
  v16.receiver = self;
  v16.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v16, sel_setFrame_);
  WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)&self->_innerFrames, a3);
  m_size = self->_innerFrames.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (float32x2_t *)self->_innerFrames.m_buffer;
    v15 = 16 * m_size;
    do
    {
      *m_buffer = vsub_f32(*m_buffer, *(float32x2_t *)&v18);
      m_buffer += 2;
      v15 -= 16;
    }
    while (v15);
  }
  if ((objc_msgSend((id)-[WKTapHighlightView layer](self, "layer"), "needsDisplayOnBoundsChange") & 1) != 0)
    -[WKTapHighlightView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setQuads:(void *)a3 boundaryRect:(const FloatRect *)a4
{
  int32x2_t v7;
  uint64_t v8;
  float32x4_t v9;
  float32x4_t *v10;
  uint64_t v11;
  int v12;
  float32x2_t v13;
  float32x2_t v14;
  uint64_t v15;
  float32x4_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  void *v20;
  Vector<WebCore::FloatQuad, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_innerQuads;
  FloatQuad *m_buffer;
  float32x4_t *v23;
  unsigned int v24;
  uint64_t v25;
  float32x4_t *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  objc_super v30;
  _OWORD v31[2];

  -[WKTapHighlightView cleanUp](self, "cleanUp");
  v8 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v8
    || (-[WKTapHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24)), v8 = *((unsigned int *)a3 + 3), (_DWORD)v8))
  {
    v10 = *(float32x4_t **)a3;
    v11 = *(_QWORD *)a3 + 32 * v8;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = 0;
      v9 = *v10;
      v16 = v10[1];
      v31[0] = *v10;
      v31[1] = v16;
      do
      {
        v9.i32[0] = 0;
        v17 = *(float32x2_t *)((char *)v31 + v15);
        v7.i32[0] = v12;
        *(int32x2_t *)v9.f32 = vdup_lane_s32(vceq_s32(v7, *(int32x2_t *)v9.f32), 0);
        v13 = (float32x2_t)vbsl_s8(*(int8x8_t *)v9.f32, (int8x8_t)v17, vbsl_s8((int8x8_t)vcgt_f32(v17, v13), (int8x8_t)v17, (int8x8_t)v13));
        v7 = vcgt_f32(v14, v17);
        v14 = (float32x2_t)vbsl_s8(*(int8x8_t *)v9.f32, (int8x8_t)v17, vbsl_s8((int8x8_t)v7, (int8x8_t)v17, (int8x8_t)v14));
        v15 += 8;
        v12 = 1;
      }
      while (v15 != 32);
      v10 += 2;
    }
    while (v10 != (float32x4_t *)v11);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v18 = vsub_f32(v13, v14);
  v9.f32[0] = self->_minimumCornerRadius * 4.0;
  *(float *)v31 = v14.f32[0] - v9.f32[0];
  *((float *)v31 + 1) = v14.f32[1] - v9.f32[0];
  v19 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.f32, 0);
  *((float32x2_t *)&v31[0] + 1) = vadd_f32(v19, vadd_f32(v18, v19));
  WebCore::FloatRect::intersect((WebCore::FloatRect *)v31, (const WebCore::FloatRect *)a4);
  WebCore::FloatRect::operator CGRect();
  v30.receiver = self;
  v30.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v30, sel_setFrame_);
  p_innerQuads = &self->_innerQuads;
  m_buffer = self->_innerQuads.m_buffer;
  if (m_buffer)
  {
    p_innerQuads->m_buffer = 0;
    self->_innerQuads.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, v20);
  }
  v23 = *(float32x4_t **)a3;
  *(_QWORD *)a3 = 0;
  p_innerQuads->m_buffer = (FloatQuad *)v23;
  v24 = *((_DWORD *)a3 + 2);
  *((_DWORD *)a3 + 2) = 0;
  self->_innerQuads.m_capacity = v24;
  v25 = *((unsigned int *)a3 + 3);
  *((_DWORD *)a3 + 3) = 0;
  self->_innerQuads.m_size = v25;
  if ((_DWORD)v25)
  {
    v26 = &v23[2 * v25];
    do
    {
      v27.i64[0] = *(_QWORD *)&v31[0];
      v27.i64[1] = *(_QWORD *)&v31[0];
      v28 = vsubq_f32(*v23, v27);
      v29 = vsubq_f32(v23[1], v27);
      *v23 = v28;
      v23[1] = v29;
      v23 += 2;
    }
    while (v23 != v26);
  }
  if ((objc_msgSend((id)-[WKTapHighlightView layer](self, "layer"), "needsDisplayOnBoundsChange") & 1) != 0)
    -[WKTapHighlightView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WKTapHighlightView cleanUp](self, "cleanUp");
  v8.receiver = self;
  v8.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)drawRect:(CGRect)a3
{
  Vector<WebCore::FloatRect, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_innerFrames;
  void *v5;
  Vector<WebCore::FloatQuad, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_innerQuads;
  uint64_t m_size;
  FloatQuad *m_buffer;
  uint64_t v9;
  void *v10;
  CGContext *CurrentContext;
  RetainPtr<UIColor> *p_color;
  CGFloat Alpha;
  void *v14;
  char v15;
  _BYTE v16[8];
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_innerFrames = &self->_innerFrames;
  if (self->_innerFrames.m_size || self->_innerQuads.m_size)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (p_innerFrames->m_size)
    {
      WebCore::PathUtilities::pathWithShrinkWrappedRects();
      objc_msgSend(v5, "appendPath:", objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", WebCore::Path::platformPath((WebCore::Path *)v16)));
      if (v18 != -1)
        ((void (*)(char *, uint64_t *))off_1E34CE218[v18])(&v15, &v17);
    }
    else
    {
      p_innerQuads = &self->_innerQuads;
      m_size = self->_innerQuads.m_size;
      if ((_DWORD)m_size)
      {
        m_buffer = p_innerQuads->m_buffer;
        v9 = (uint64_t)&p_innerQuads->m_buffer[m_size];
        do
        {
          v10 = (void *)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "moveToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          objc_msgSend(v10, "closePath");
          objc_msgSend(v5, "appendPath:", v10);
          ++m_buffer;
        }
        while (m_buffer != (FloatQuad *)v9);
      }
    }
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    if (self->_innerQuads.m_size)
      CGContextSetLineWidth(CurrentContext, (float)(self->_minimumCornerRadius * 4.0));
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    p_color = &self->_color;
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(p_color->m_ptr, "CGColor"));
    objc_msgSend((id)objc_msgSend(p_color->m_ptr, "colorWithAlphaComponent:", 1.0), "set");
    CGContextSetAlpha(CurrentContext, Alpha);
    CGContextBeginTransparencyLayer(CurrentContext, 0);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v5, "CGPath"));
    CGContextDrawPath(CurrentContext, kCGPathFillStroke);
    CGContextEndTransparencyLayer(CurrentContext);
    CGContextRestoreGState(CurrentContext);
  }
  else
  {
    objc_msgSend(self->_color.m_ptr, "set", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v14 = (void *)MEMORY[0x1E0CEA390];
    -[WKTapHighlightView bounds](self, "bounds");
    objc_msgSend((id)objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:"), "fill");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  Vector<WebCore::FloatQuad, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_innerQuads;
  FloatQuad *m_buffer;
  FloatRect *v5;
  void *m_ptr;

  p_innerQuads = &self->_innerQuads;
  m_buffer = self->_innerQuads.m_buffer;
  if (m_buffer)
  {
    p_innerQuads->m_buffer = 0;
    p_innerQuads->m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  v5 = self->_innerFrames.m_buffer;
  if (v5)
  {
    self->_innerFrames.m_buffer = 0;
    self->_innerFrames.m_capacity = 0;
    WTF::fastFree((WTF *)v5, (void *)a2);
  }
  m_ptr = self->_color.m_ptr;
  self->_color.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *(_OWORD *)((char *)self + 428) = 0u;
  *(_OWORD *)((char *)self + 444) = 0u;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 61) = 0;
  return self;
}

@end
