@implementation MPUHTMLParserStateSAXInitSharedHandler

_QWORD *___MPUHTMLParserStateSAXInitSharedHandler_block_invoke()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x100uLL, 0x1080040AADF51B8uLL);
  _MPUHTMLParserStateSAXInitSharedHandler___gMPUHTMLParserStateSAXHandler = (uint64_t)result;
  result[12] = _MPUHTMLParserStateStartDocument;
  result[13] = _MPUHTMLParserStateEndDocument;
  result[14] = _MPUHTMLParserStateStartElement;
  result[15] = _MPUHTMLParserStateEndElement;
  result[17] = _MPUHTMLParserStateCharacters;
  result[18] = _MPUHTMLParserStateWhitespace;
  result[5] = _MPUHTMLParserStateGetEntity;
  result[21] = _MPUHTMLParserStateFatal;
  result[22] = _MPUHTMLParserStateError;
  return result;
}

@end
