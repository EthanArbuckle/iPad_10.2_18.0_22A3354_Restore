@implementation MDPlistBytes

__MDPlistBytes *__37___MDPlistBytes_emptyArrayPlistBytes__block_invoke()
{
  __MDPlistBytes *result;

  result = +[_MDPlistBytes createArrayPlistBytesUsingBlock:](_MDPlistBytes, "createArrayPlistBytesUsingBlock:", &__block_literal_global_3);
  _MergedGlobals = (uint64_t)result;
  return result;
}

__MDPlistBytes *__42___MDPlistBytes_emptyDictionaryPlistBytes__block_invoke()
{
  __MDPlistBytes *result;

  result = +[_MDPlistBytes createDictionaryPlistBytesUsingBlock:](_MDPlistBytes, "createDictionaryPlistBytesUsingBlock:", &__block_literal_global_5);
  qword_1EE5C9490 = (uint64_t)result;
  return result;
}

void __37___MDPlistBytes_nullObjectPlistBytes__block_invoke()
{
  _MDMutablePlistBytes *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = -[_MDMutablePlistBytes initWithCapacity:useMalloc:]([_MDMutablePlistBytes alloc], "initWithCapacity:useMalloc:", 0, 0);
  if (!v0)
    +[_MDPlistBytes createPlistBytes:].cold.1(0, v1, v2);
  v3 = (uint64_t)v0;
  CFRetain(v0);

  _MDPlistBytesBeginPlist(v3);
  __MDPlistBytesAddObject(v3, (const __CFString *)*MEMORY[0x1E0C9B0D0]);
  _MDPlistBytesEndPlist(v3);
  if (*(_WORD *)(v3 + 32))
  {
    CFRelease((CFTypeRef)v3);
    v3 = 0;
  }
  else
  {
    *(_BYTE *)(v3 + 34) &= ~1u;
  }
  qword_1EE5C94A0 = v3;
}

@end
