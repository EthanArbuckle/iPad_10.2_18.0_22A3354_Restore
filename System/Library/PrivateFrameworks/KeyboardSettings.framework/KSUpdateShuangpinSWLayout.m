@implementation KSUpdateShuangpinSWLayout

uint64_t __KSUpdateShuangpinSWLayout_block_invoke()
{
  return KSInputModeIsChineseShuangpin();
}

uint64_t __KSUpdateShuangpinSWLayout_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *SWLayout;
  void *v5;
  uint64_t result;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  SWLayout = (void *)TIInputModeGetSWLayout();
  v5 = SWLayout;
  if (*(_BYTE *)(a1 + 40))
  {
    result = objc_msgSend(SWLayout, "hasPrefix:", CFSTR("Pinyin-"));
    if (!(_DWORD)result)
      return result;
    v7 = CFSTR("Pinyin-");
    v8 = objc_msgSend(CFSTR("Pinyin-"), "length");
    v9 = CFSTR("Shuangpin-with-Semicolon-");
  }
  else
  {
    result = objc_msgSend(SWLayout, "hasPrefix:", CFSTR("Shuangpin-with-Semicolon-"));
    if (!(_DWORD)result)
      return result;
    v7 = CFSTR("Shuangpin-with-Semicolon-");
    v8 = objc_msgSend(CFSTR("Shuangpin-with-Semicolon-"), "length");
    v9 = CFSTR("Pinyin-");
  }
  result = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v9, 0, 0, v8);
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a2, UIKeyboardInputModeWithNewSWLayout());
  return result;
}

@end
