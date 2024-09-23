@implementation NLStringTokenizerCopyPossibleStringLanguages

dispatch_queue_t ___NLStringTokenizerCopyPossibleStringLanguages_block_invoke()
{
  CoreNLP::NLLangid *v0;
  dispatch_queue_t result;

  v0 = (CoreNLP::NLLangid *)operator new();
  CoreNLP::NLLangid::NLLangid(v0);
  _NLStringTokenizerCopyPossibleStringLanguages::nlLangid = (uint64_t)v0;
  result = dispatch_queue_create("com.apple.CoreNLP.CopyPossibleStringLanguages", 0);
  _NLStringTokenizerCopyPossibleStringLanguages::queue = (uint64_t)result;
  return result;
}

__CFArray *___NLStringTokenizerCopyPossibleStringLanguages_block_invoke_2(uint64_t a1)
{
  __CFArray *result;

  result = CoreNLP::NLLangid::copyPossibleLanguageStrings((int **)_NLStringTokenizerCopyPossibleStringLanguages::nlLangid, *(const __CFString **)(a1 + 40), *(CFRange *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
