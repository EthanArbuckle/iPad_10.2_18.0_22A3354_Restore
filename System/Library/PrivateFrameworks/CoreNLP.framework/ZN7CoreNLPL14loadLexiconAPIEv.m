@implementation ZN7CoreNLPL14loadLexiconAPIEv

void *___ZN7CoreNLPL14loadLexiconAPIEv_block_invoke(CoreNLP *a1)
{
  void *result;
  void *v2;
  BOOL v3;
  char v4;

  result = (void *)CoreNLP::loadLexicon(a1);
  if (result)
  {
    v2 = result;
    CoreNLP::_LXLemmatizerCreate = dlsym(result, "LXLemmatizerCreate");
    result = dlsym(v2, "LXLemmatizerEnumerateLemmasforString");
    CoreNLP::_LXLemmatizerEnumerateLemmasforString = result;
    if (CoreNLP::_LXLemmatizerCreate)
      v3 = result == 0;
    else
      v3 = 1;
    v4 = !v3;
    CoreNLP::loadLexiconAPI(void)::isSoftlinked = v4;
  }
  return result;
}

@end
