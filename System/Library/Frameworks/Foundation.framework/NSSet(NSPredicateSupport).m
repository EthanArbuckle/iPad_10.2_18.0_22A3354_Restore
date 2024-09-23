@implementation NSSet(NSPredicateSupport)

- (uint64_t)filteredSetUsingPredicate:()NSPredicateSupport
{
  unint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  CFStringRef v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil is not a valid predicate for filtering"), 0));
  v5 = objc_msgSend(a1, "count");
  v16[0] = 0;
  if (v5 >> 60)
  {
    v13 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (v5 <= 1)
    v5 = 1;
  *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](v5).n128_u64[0];
  v8 = (char *)v15 - v7;
  v15[1] = 0;
  if (v9 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage();
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }
  _filterObjectsUsingPredicate((void *)objc_msgSend(a1, "allObjects", v6), a3, (uint64_t)v8, v16);
  v11 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", v8, v16[0]);
  free(v10);
  return v11;
}

@end
