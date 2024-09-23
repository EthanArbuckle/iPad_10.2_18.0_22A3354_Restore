@implementation NotPatternSet

id ___NotPatternSet_block_invoke()
{
  id result;

  if (qword_1ECD09500 != -1)
    dispatch_once(&qword_1ECD09500, &__block_literal_global_7);
  result = (id)objc_msgSend((id)_MergedGlobals_5, "invertedSet");
  qword_1ECD09508 = (uint64_t)result;
  return result;
}

@end
