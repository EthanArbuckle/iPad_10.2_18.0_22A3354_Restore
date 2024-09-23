@implementation DESSubmissionLogGarbageCollect

uint64_t __DESSubmissionLogGarbageCollect_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("submissionlog"));

  return v3;
}

@end
