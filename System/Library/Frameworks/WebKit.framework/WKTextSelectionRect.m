@implementation WKTextSelectionRect

- (WKTextSelectionRect)initWithCGRect:(CGRect)a3
{
  IntSize v4;
  IntRect v6;
  _OWORD v7[2];
  __int16 v8;
  uint64_t v9;
  _BYTE v10[13];
  __int16 v11;
  int v12;
  char v13;
  char v14;
  CGRect v15;

  v15 = a3;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  memset(v10, 0, sizeof(v10));
  v9 = 0;
  v11 = 1;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v6.m_location = (IntPoint)WebCore::enclosingIntRect((WebCore *)&v15, (const CGRect *)a2);
  v6.m_size = v4;
  WebCore::SelectionGeometry::setRect((WebCore::SelectionGeometry *)v7, &v6);
  return -[WKTextSelectionRect initWithSelectionGeometry:scaleFactor:](self, "initWithSelectionGeometry:scaleFactor:", v7, 1.0);
}

- (WKTextSelectionRect)initWithSelectionGeometry:(const void *)a3 scaleFactor:(double)a4
{
  WKTextSelectionRect *result;
  __int128 v7;
  $63E34D7BC9913F9EF64CB9772E5ACB0C v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKTextSelectionRect;
  result = -[WKTextSelectionRect init](&v11, sel_init);
  if (result)
  {
    v7 = *((_OWORD *)a3 + 1);
    *(_OWORD *)&result->_selectionGeometry.m_quad.m_p1.m_x = *(_OWORD *)a3;
    *(_OWORD *)&result->_selectionGeometry.m_quad.m_p3.m_x = v7;
    v9 = *((_OWORD *)a3 + 3);
    v8 = *(($63E34D7BC9913F9EF64CB9772E5ACB0C *)a3 + 4);
    v10 = *((_OWORD *)a3 + 2);
    *(_DWORD *)&result->_selectionGeometry.m_cachedEnclosingRect.__engaged_ = *((_DWORD *)a3 + 20);
    *(_OWORD *)&result->_selectionGeometry.m_lineNumber = v9;
    result->_selectionGeometry.m_cachedEnclosingRect.var0 = v8;
    *(_OWORD *)&result->_selectionGeometry.m_behavior = v10;
    result->_scaleFactor = a4;
  }
  return result;
}

- (id)_path
{
  float32x4_t *p_selectionGeometry;
  uint64_t v4;
  double scaleFactor;
  float v6;
  int32x2_t v7;
  int64x2_t v8;
  float64x2_t v9;
  float32x4_t v10;
  void *v11;

  p_selectionGeometry = (float32x4_t *)&self->_selectionGeometry;
  if (!self->_selectionGeometry.m_behavior)
    return 0;
  v4 = WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)&self->_selectionGeometry);
  scaleFactor = self->_scaleFactor;
  v6 = scaleFactor;
  v7 = vneg_s32((int32x2_t)v4);
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  v9 = vmulq_n_f64(vcvtq_f64_s64(v8), scaleFactor);
  v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v9);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath", vaddq_f32(vmulq_n_f32(*p_selectionGeometry, v6), v10), vaddq_f32(vmulq_n_f32(p_selectionGeometry[1], v6), v10));
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "moveToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  objc_msgSend(v11, "closePath");
  return v11;
}

- (int64_t)writingDirection
{
  return self->_selectionGeometry.m_direction;
}

- (id)range
{
  return 0;
}

- (id)_customHandleInfo
{
  __int128 v2;
  _OWORD v4[2];

  if (!self->_selectionGeometry.m_behavior)
    return 0;
  v2 = *(_OWORD *)&self->_selectionGeometry.m_quad.m_p3.m_x;
  v4[0] = *(_OWORD *)&self->_selectionGeometry.m_quad.m_p1.m_x;
  v4[1] = v2;
  return (id)(id)CFMakeCollectable(-[WKTextSelectionRectCustomHandleInfo initWithFloatQuad:isHorizontal:]([WKTextSelectionRectCustomHandleInfo alloc], "initWithFloatQuad:isHorizontal:", v4, self->_selectionGeometry.m_isHorizontal));
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)&self->_selectionGeometry);
  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)containsStart
{
  return self->_selectionGeometry.m_containsStart;
}

- (BOOL)containsEnd
{
  return self->_selectionGeometry.m_containsEnd;
}

- (BOOL)isVertical
{
  return !self->_selectionGeometry.m_behavior && !self->_selectionGeometry.m_isHorizontal;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_WORD *)self + 28) = 0;
  *(_QWORD *)((char *)self + 68) = 0;
  *(_QWORD *)((char *)self + 60) = 0;
  *(_QWORD *)((char *)self + 73) = 0;
  *(_WORD *)((char *)self + 81) = 1;
  *((_DWORD *)self + 21) = 0;
  *((_BYTE *)self + 88) = 0;
  *((_BYTE *)self + 104) = 0;
  return self;
}

@end
