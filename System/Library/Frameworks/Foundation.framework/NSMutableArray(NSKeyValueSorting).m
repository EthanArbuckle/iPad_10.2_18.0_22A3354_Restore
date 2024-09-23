@implementation NSMutableArray(NSKeyValueSorting)

- (void)sortUsingDescriptors:()NSKeyValueSorting
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  CFStringRef v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(a3, "count");
  if (v6 && v5 >= 2)
  {
    if (v5 >> 60)
    {
      v16 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v16, 0);
      CFRelease(v16);
      objc_exception_throw(v17);
    }
    if (v5 >= 0x101)
      v7 = 1;
    else
      v7 = v5;
    v8 = 8 * v7;
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
    v11 = (char *)v18 - v10;
    v18[2] = 0;
    if (v5 >= 0x101)
    {
      v11 = (char *)_CFCreateArrayStorage();
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    v13 = objc_msgSend(a1, "getObjects:range:", v11, 0, v5, v9);
    MEMORY[0x1E0C80A78](v13);
    v14 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = 0;
    v18[1] = 0;
    if (v5 >= 0x101)
    {
      v15 = (char *)_CFCreateArrayStorage();
      v14 = v15;
    }
    _sortedObjectsUsingDescriptors((uint64_t)v11, v5, a3, (uint64_t)v14);
    objc_msgSend(a1, "replaceObjectsInRange:withObjects:count:", 0, v5, v14, v5);
    free(v15);
    free(v12);
  }
}

@end
