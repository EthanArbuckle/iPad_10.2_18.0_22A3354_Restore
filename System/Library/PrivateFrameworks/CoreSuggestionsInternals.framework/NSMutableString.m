@implementation NSMutableString

void __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("=\\?(?:[^\\s()<>@,;:\"\\/\\[\\]?.=]+?)\\?(?:[^\\s()<>@,;:\"\\/\\[\\]?.=]+?)\\?(?:[^?\\s]+)\\?="),
    0,
    &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSString+EncodedWord.m"), 45, CFSTR("error creating encodedWordRegex: %@"), v4);

  }
  v5 = (void *)sg_decodeEncodedWords__pasExprOnceResult;
  sg_decodeEncodedWords__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sg_decodeEncodedWords__pasExprOnceResult_10;
  sg_decodeEncodedWords__pasExprOnceResult_10 = v2;

  objc_autoreleasePoolPop(v0);
}

@end
