@implementation WKTextPlaceholder

- (WKTextPlaceholder)initWithElementContext:(const void *)a3
{
  WKTextPlaceholder *result;
  __int128 v5;
  ProcessQualified<WTF::UUID> v6;
  __int128 v7;

  result = -[UITextPlaceholder init](self, "init");
  if (result)
  {
    result->_elementContext.boundingRect = *(FloatRect *)a3;
    v6 = (ProcessQualified<WTF::UUID>)*((_OWORD *)a3 + 2);
    v5 = *((_OWORD *)a3 + 3);
    v7 = *((_OWORD *)a3 + 1);
    result[1].super._attachment = (_UITextPlaceholderAttachment *)*((_QWORD *)a3 + 8);
    *(ProcessQualified<WTF::UUID> *)((char *)&result->_elementContext.documentIdentifier + 8) = v6;
    *(_OWORD *)&result[1].super.super.isa = v5;
    *(_OWORD *)&result->_elementContext.webPageIdentifier.m_identifier = v7;
  }
  return result;
}

- (const)elementContext
{
  return &self->_elementContext;
}

- (id)rects
{
  WKTextSelectionRect *v2;
  WKTextSelectionRect *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = [WKTextSelectionRect alloc];
  WebCore::FloatRect::operator CGRect();
  v3 = -[WKTextSelectionRect initWithCGRect:](v2, "initWithCGRect:");
  v6[0] = v3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  if (v3)
    CFRelease(v3);
  return v4;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
