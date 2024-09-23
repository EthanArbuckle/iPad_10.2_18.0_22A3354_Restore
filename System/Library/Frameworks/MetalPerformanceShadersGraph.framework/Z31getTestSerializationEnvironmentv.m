@implementation Z31getTestSerializationEnvironmentv

char *___Z31getTestSerializationEnvironmentv_block_invoke()
{
  char *result;

  result = getenv("MPSGRAPH_EMIT_OBJC_TEST_PATH");
  if (result)
  {
    _MergedGlobals_69 = 1;
    qword_1EDC0BF18 = (uint64_t)result;
  }
  return result;
}

@end
