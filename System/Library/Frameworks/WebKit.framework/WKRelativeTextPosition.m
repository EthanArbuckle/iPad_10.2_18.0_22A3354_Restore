@implementation WKRelativeTextPosition

- (WKRelativeTextPosition)initWithAnchors:(OptionSet<WebKit:(int64_t)a4 :TextPositionAnchor>)a3 offset:
{
  WKRelativeTextPosition *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKRelativeTextPosition;
  result = -[WKRelativeTextPosition init](&v7, sel_init);
  if (result)
  {
    result->_anchors = a3;
    result->_offset = a4;
  }
  return result;
}

- (BOOL)isRelativeToStart
{
  return self->_anchors.m_storage & 1;
}

- (id)description
{
  const char *v2;

  if ((self->_anchors.m_storage & 1) != 0)
    v2 = "start";
  else
    v2 = "end";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WKRelativeTextPosition(%s, %d)"), v2, self->_offset);
}

- (OptionSet<WebKit::TextPositionAnchor>)anchors
{
  return self->_anchors;
}

- (int64_t)offset
{
  return self->_offset;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  return self;
}

@end
