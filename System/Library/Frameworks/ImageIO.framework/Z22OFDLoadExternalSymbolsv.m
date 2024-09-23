@implementation Z22OFDLoadExternalSymbolsv

void *___Z22OFDLoadExternalSymbolsv_block_invoke()
{
  void *result;
  void *v1;
  char v2[56];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  strcpy(v2, "/System/Library/Frameworks/CoreText.framework/CoreText");
  result = dlopen(v2, 257);
  if (result)
  {
    v1 = result;
    gIIO_kCTFontAttributeName = (uint64_t)dlsym(result, "kCTFontAttributeName");
    gIIO_kCTFontNameAttribute = (uint64_t)dlsym(v1, "kCTFontNameAttribute");
    gIIO_kCTForegroundColorAttributeName = (uint64_t)dlsym(v1, "kCTForegroundColorAttributeName");
    gFunc_CTFontCopyPostScriptName = dlsym(v1, "CTFontCopyPostScriptName");
    gFunc_CTFontCreateWithName = dlsym(v1, "CTFontCreateWithName");
    gFunc_CTFramesetterCreateWithAttributedString = dlsym(v1, "CTFramesetterCreateWithAttributedString");
    gFunc_CTFramesetterSuggestFrameSizeWithConstraints = dlsym(v1, "CTFramesetterSuggestFrameSizeWithConstraints");
    gFunc_CTLineCreateWithAttributedString = dlsym(v1, "CTLineCreateWithAttributedString");
    gFunc_CTLineDraw = dlsym(v1, "CTLineDraw");
    gFunc_CTFontDescriptorCreateWithAttributes = dlsym(v1, "CTFontDescriptorCreateWithAttributes");
    result = dlsym(v1, "CTFontDescriptorMatchFontDescriptorsWithProgressHandler");
    gFunc_CTFontDescriptorMatchFontDescriptorsWithProgressHandler = result;
  }
  return result;
}

@end
