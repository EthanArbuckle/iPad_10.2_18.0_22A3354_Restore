@implementation WKTextSelectionRectCustomHandleInfo

- (WKTextSelectionRectCustomHandleInfo)initWithFloatQuad:(const FloatQuad *)a3 isHorizontal:(BOOL)a4
{
  WKTextSelectionRectCustomHandleInfo *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKTextSelectionRectCustomHandleInfo;
  result = -[WKTextSelectionRectCustomHandleInfo init](&v8, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->m_p3.m_x;
    *(_OWORD *)&result->_quad.m_p1.m_x = *(_OWORD *)&a3->m_p1.m_x;
    *(_OWORD *)&result->_quad.m_p3.m_x = v7;
    result->_isHorizontal = a4;
  }
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
