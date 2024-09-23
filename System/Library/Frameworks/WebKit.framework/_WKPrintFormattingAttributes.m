@implementation _WKPrintFormattingAttributes

- (_WKPrintFormattingAttributes)initWithPageCount:(unint64_t)a3 frameID:()ProcessQualified<WTF:()WTF:(unsigned long long>>)a4 :(PrintInfo *)a5 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::FrameIdentifierType printInfo:
{
  unint64_t m_identifier;
  unint64_t v7;
  _WKPrintFormattingAttributes *result;
  __int128 v10;
  objc_super v11;

  m_identifier = a4.m_processIdentifier.m_identifier;
  v7 = a4.m_object.m_identifier;
  v11.receiver = self;
  v11.super_class = (Class)_WKPrintFormattingAttributes;
  result = -[_WKPrintFormattingAttributes init](&v11, sel_init);
  if (result)
  {
    result->_pageCount = a3;
    result->_frameID.m_object.m_identifier = v7;
    result->_frameID.m_processIdentifier.m_identifier = m_identifier;
    v10 = *(_OWORD *)&a5->pageSetupScaleFactor;
    *(RectEdges<float> *)((char *)&result->_printInfo.margin + 1) = *(RectEdges<float> *)((char *)&a5->margin + 1);
    *(_OWORD *)&result->_printInfo.pageSetupScaleFactor = v10;
  }
  return result;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,)frameID
{
  unint64_t m_identifier;
  unint64_t v3;
  ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long>> result;

  m_identifier = self->_frameID.m_processIdentifier.m_identifier;
  v3 = self->_frameID.m_object.m_identifier;
  result.m_processIdentifier.m_identifier = m_identifier;
  result.m_object.m_identifier = v3;
  return result;
}

- (PrintInfo)printInfo
{
  RectEdges<float> v3;

  v3 = *(RectEdges<float> *)((char *)&self[1].margin + 4);
  *(_OWORD *)&retstr->pageSetupScaleFactor = *(_OWORD *)&self[1].pageSetupScaleFactor;
  *(RectEdges<float> *)((char *)&retstr->margin + 4) = v3;
  return self;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 45) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
