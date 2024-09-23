@implementation ZL21InitParserDictionarysv

_QWORD *___ZL21InitParserDictionarysv_block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *result;

  v0 = (_QWORD *)operator new();
  *v0 = &off_1E617A718;
  v0[1] = 30;
  v0[2] = &gParserFontDictionaryList;
  gParserFontDictionary = (uint64_t)v0;
  v1 = (_QWORD *)operator new();
  v1[1] = 37;
  v1[2] = &gParserPrivateDictionaryList;
  *v1 = &off_1E617A6F0;
  _MergedGlobals_0 = (uint64_t)v1;
  v2 = (_QWORD *)operator new();
  v2[1] = 4;
  v2[2] = &gParserBlendDictionaryList;
  *v2 = &off_1E617A6C8;
  qword_1ECDE6AF8 = (uint64_t)v2;
  v3 = (_QWORD *)operator new();
  v3[1] = 20;
  v3[2] = &gParserPrivateBlendDictionaryList;
  *v3 = &off_1E617A6A0;
  qword_1ECDE6AF0 = (uint64_t)v3;
  v4 = (_QWORD *)operator new();
  *v4 = &off_1E617A718;
  v4[1] = 15;
  v4[2] = &gParserCompositeDictionaryList;
  gParserCompositeDictionary = (uint64_t)v4;
  v5 = (_QWORD *)operator new();
  *v5 = &off_1E617A718;
  v5[1] = 13;
  v5[2] = &gParserDerivedDictionaryList;
  gParserDerivedDictionary = (uint64_t)v5;
  v6 = (_QWORD *)operator new();
  *v6 = &off_1E617A718;
  v6[1] = 25;
  v6[2] = &gParserCIDFontDictionaryList;
  gParserCIDFontDictionary = (uint64_t)v6;
  result = (_QWORD *)operator new();
  *result = &off_1E617A718;
  result[1] = 14;
  result[2] = &gParserEncodingDictionaryList;
  qword_1ECDE6B00 = (uint64_t)result;
  return result;
}

@end
