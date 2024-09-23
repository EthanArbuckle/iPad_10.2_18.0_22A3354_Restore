@implementation MapsSuggestionsLoggingIsVerbose

uint64_t __MapsSuggestionsLoggingIsVerbose_block_invoke()
{
  uint64_t result;

  result = GEOConfigGetBOOL();
  s_verbose = result;
  return result;
}

@end
