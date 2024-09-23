@implementation EspressoHelper

+ (unint64_t)getBufferLength:(id *)a3
{
  uint64_t v3;
  unint64_t result;

  v3 = 0;
  result = 1;
  do
    result *= a3->var2[v3++];
  while (v3 != 4);
  return result;
}

@end
