@implementation NSMutableOrderedSet(IC)

- (void)ic_addNonNilObject:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (uint64_t)ic_sortUsingSelector:()IC
{
  _QWORD v6[5];

  if (!a3)
    objc_msgSend(a1, "doesNotRecognizeSelector:");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__NSMutableOrderedSet_IC__ic_sortUsingSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v6[4] = a3;
  return objc_msgSend(a1, "sortWithOptions:usingComparator:", 0, v6);
}

@end
