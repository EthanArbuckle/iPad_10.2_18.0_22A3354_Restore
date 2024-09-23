@implementation NSPointerArray(HMFoundation)

- (BOOL)hmf_removePointer:()HMFoundation
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  v5 = objc_msgSend(a1, "count");
  if (!v5)
    return 0;
  v6 = v5;
  if (objc_msgSend(a1, "pointerAtIndex:", 0) != a3)
  {
    v7 = 1;
    while (v6 != v7)
    {
      v8 = objc_msgSend(a1, "pointerAtIndex:", v7++);
      if (v8 == a3)
      {
        v9 = v7 - 1;
        v10 = v7 - 1 < v6;
        goto LABEL_9;
      }
    }
    return 0;
  }
  v9 = 0;
  v10 = 1;
LABEL_9:
  objc_msgSend(a1, "removePointerAtIndex:", v9);
  return v10;
}

@end
