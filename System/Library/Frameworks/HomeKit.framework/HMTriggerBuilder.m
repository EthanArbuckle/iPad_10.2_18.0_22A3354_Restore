@implementation HMTriggerBuilder

uint64_t __40___HMTriggerBuilder___indexOfActionSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (*(void **)(a1 + 32) == a2)
    return 1;
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

+ (id)alloc
{
  return 0;
}

@end
