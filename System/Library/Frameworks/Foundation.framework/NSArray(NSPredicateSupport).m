@implementation NSArray(NSPredicateSupport)

- (id)filteredArrayUsingPredicate:()NSPredicateSupport
{
  unint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  id *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id v13;
  void *v14;
  CFStringRef v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil is not a valid predicate for filtering"), 0));
  v5 = objc_msgSend(a1, "count");
  v19[0] = 0;
  if (v5 >> 60)
  {
    v16 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v16, 0);
    CFRelease(v16);
    objc_exception_throw(v17);
  }
  if (v5 <= 1)
    v5 = 1;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v18 - v6;
  v18[1] = 0;
  if (v8 >= 0x101)
  {
    v7 = (char *)_CFCreateArrayStorage();
    v9 = (id *)v7;
  }
  else
  {
    v9 = 0;
  }
  _filterObjectsUsingPredicate(a1, a3, (uint64_t)v7, v19);
  v10 = v19[0];
  if (v9)
  {
    if (v19[0] >= 1)
    {
      v11 = v9;
      v12 = v19[0];
      do
      {
        v13 = *v11++;
        --v12;
      }
      while (v12);
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v9, v10, v10);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v19[0]);
  }
  return v14;
}

@end
