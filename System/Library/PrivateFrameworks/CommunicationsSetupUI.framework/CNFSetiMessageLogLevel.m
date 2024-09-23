@implementation CNFSetiMessageLogLevel

uint64_t (*__CNFSetiMessageLogLevel_block_invoke())(_QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol();
  CNFSetiMessageLogLevel__MMCSSetLogLevel = result;
  return result;
}

@end
