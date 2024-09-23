@implementation NSArray(BWGraphAdditions)

- (uint64_t)bw_intersectWithArray:()BWGraphAdditions
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", a1);
  objc_msgSend(v4, "intersectOrderedSet:", objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a3));
  return objc_msgSend(v4, "array");
}

@end
