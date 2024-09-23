@implementation GetNLPFrameworkInfo

void ___GetNLPFrameworkInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *v2;
  _QWORD *DataPointerForName;
  void *FunctionPointerForName;
  _QWORD *v5;

  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/NLP.framework"), kCFURLPOSIXPathStyle, 1u);
  if (v0)
  {
    v1 = v0;
    v2 = CFBundleCreate(0, v0);
    CFRelease(v1);
    if (v2)
    {
      if (!CFBundleIsExecutableLoaded(v2))
        CFBundleLoadExecutable(v2);
      if (CFBundleIsExecutableLoaded(v2))
      {
        _GetNLPFrameworkInfo__InfoPtr = (uint64_t)malloc_type_calloc(1uLL, 0x18uLL, 0xE00409BBF8FE8uLL);
        DataPointerForName = CFBundleGetDataPointerForName(v2, CFSTR("kNLMorphologicalAnalyzerLocaleKey"));
        if (DataPointerForName)
          *(_QWORD *)(_GetNLPFrameworkInfo__InfoPtr + 16) = *DataPointerForName;
        *(_QWORD *)_GetNLPFrameworkInfo__InfoPtr = CFBundleGetFunctionPointerForName(v2, CFSTR("NLMorphologicalAnalyzerCreate"));
        FunctionPointerForName = CFBundleGetFunctionPointerForName(v2, CFSTR("NLMorphologicalAnalyzerEnumerateLemmasForToken"));
        v5 = (_QWORD *)_GetNLPFrameworkInfo__InfoPtr;
        *(_QWORD *)(_GetNLPFrameworkInfo__InfoPtr + 8) = FunctionPointerForName;
        if (!v5[2] || !*v5 || !FunctionPointerForName)
        {
          free(v5);
          _GetNLPFrameworkInfo__InfoPtr = 0;
        }
      }
    }
  }
}

@end
