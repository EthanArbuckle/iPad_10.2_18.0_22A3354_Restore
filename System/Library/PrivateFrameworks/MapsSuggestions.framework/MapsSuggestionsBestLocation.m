@implementation MapsSuggestionsBestLocation

uint64_t __MapsSuggestionsBestLocation_block_invoke()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  GEOConfigGetDouble();
  qword_1ED22F170 = v0;
  result = GEOConfigGetDouble();
  qword_1ED22F178 = v2;
  return result;
}

@end
