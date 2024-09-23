@implementation MDCopyTokensFromString

uint64_t ____MDCopyTokensFromString_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = _CFBundleGetBundleWithIdentifierAndLibraryName();
  if (result)
  {
    v1 = result;
    _locAndToken = (uint64_t)copyNonDefaultLocalizedString(result, CFSTR("SEARCH_SYNTAX_AND"), CFSTR("AND"));
    _locOrToken = (uint64_t)copyNonDefaultLocalizedString(v1, CFSTR("SEARCH_SYNTAX_OR"), CFSTR("OR"));
    result = (uint64_t)copyNonDefaultLocalizedString(v1, CFSTR("SEARCH_SYNTAX_NOT"), CFSTR("NOT"));
    _locNotToken = result;
  }
  return result;
}

@end
