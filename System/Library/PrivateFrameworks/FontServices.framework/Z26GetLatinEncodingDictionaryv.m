@implementation Z26GetLatinEncodingDictionaryv

_QWORD *___Z26GetLatinEncodingDictionaryv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = 4288;
  result[1] = &gLatinCharacterEncode;
  GetLatinEncodingDictionary(void)::gLatinEncodingDict = (uint64_t)result;
  return result;
}

@end
