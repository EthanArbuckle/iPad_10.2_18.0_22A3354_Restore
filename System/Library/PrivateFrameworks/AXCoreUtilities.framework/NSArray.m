@implementation NSArray

void __48__NSArray_AXExtensions__axMapObjectsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (!v2)
  {
    _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSArray+AXExtensions.m", (void *)0x6B, (uint64_t)"-[NSArray(AXExtensions) axMapObjectsUsingBlock:]_block_invoke", CFSTR("Result was nil in mapping block!"), v3, v4, v5, v6);
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObject:", v2);

}

void __51__NSArray_AXExtensions__axFilterObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __50__NSArray_AXExtensions__axFirstObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
