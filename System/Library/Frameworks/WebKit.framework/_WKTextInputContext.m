@implementation _WKTextInputContext

- (_WKTextInputContext)init
{
  return 0;
}

- (id)_initWithTextInputContext:(const void *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_WKTextInputContext;
  result = -[_WKTextInputContext init](&v8, sel_init);
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)a3;
    v5 = *((_OWORD *)a3 + 1);
    v6 = *((_OWORD *)a3 + 2);
    v7 = *((_OWORD *)a3 + 3);
    *((_QWORD *)result + 10) = *((_QWORD *)a3 + 8);
    *((_OWORD *)result + 3) = v6;
    *((_OWORD *)result + 4) = v7;
    *((_OWORD *)result + 2) = v5;
  }
  return result;
}

- (CGRect)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (const)_textInputContext
{
  return &self->_textInputContext;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v6;
  BOOL result;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self->_textInputContext.boundingRect.m_location.m_x != *((float *)a3 + 4)
    || self->_textInputContext.boundingRect.m_location.m_y != *((float *)a3 + 5))
  {
    return 0;
  }
  v6 = self->_textInputContext.boundingRect.m_size.m_width == *((float *)a3 + 6)
    && self->_textInputContext.boundingRect.m_size.m_height == *((float *)a3 + 7);
  if (!v6 || self->_textInputContext.webPageIdentifier.m_identifier != *((_QWORD *)a3 + 4))
    return 0;
  result = 0;
  if (self->_textInputContext.m_processIdentifier.m_identifier == *((_QWORD *)a3 + 7)
    && *(_QWORD *)&self->_textInputContext.documentIdentifier.m_object[8] == *((_QWORD *)a3 + 6)
    && self[1].super.isa == (Class)*((_QWORD *)a3 + 8))
  {
    return *(_QWORD *)&self[1]._textInputContext.boundingRect.m_location == *((_QWORD *)a3 + 10);
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self[1]._textInputContext.boundingRect.m_location;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
