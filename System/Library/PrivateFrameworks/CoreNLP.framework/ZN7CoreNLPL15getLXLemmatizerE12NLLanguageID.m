@implementation ZN7CoreNLPL15getLXLemmatizerE12NLLanguageID

_QWORD *___ZN7CoreNLPL15getLXLemmatizerE12NLLanguageID_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  CoreNLP::getLXLemmatizer(NLLanguageID)::lemmatizerMap = (uint64_t)result;
  return result;
}

@end
