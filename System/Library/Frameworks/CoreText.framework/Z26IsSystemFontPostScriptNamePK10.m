@implementation Z26IsSystemFontPostScriptNamePK10

const void *___Z26IsSystemFontPostScriptNamePK10__CFString_block_invoke()
{
  const void *result;

  if (qword_1ECDE7DD8 != -1)
    dispatch_once(&qword_1ECDE7DD8, &__block_literal_global_80);
  result = (const void *)qword_1ECDE7DD0;
  if (qword_1ECDE7DD0)
    result = CFDictionaryGetValue((CFDictionaryRef)qword_1ECDE7DD0, CFSTR("Attrs"));
  qword_1ECDE7DA0 = (uint64_t)result;
  return result;
}

@end
