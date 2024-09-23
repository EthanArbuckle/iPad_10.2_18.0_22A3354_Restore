@implementation NSSet(NSKeyValueSorting)

- (id)sortedArrayUsingDescriptors:()NSKeyValueSorting
{
  unint64_t v5;
  unint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  id *v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  CFStringRef v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = v5;
  if (v5 >> 60)
  {
    v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v23, 0);
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  *(_QWORD *)&v7 = MEMORY[0x1E0C80A78](v5).n128_u64[0];
  v9 = (char *)v25 - v8;
  v25[2] = 0;
  if (v6 >= 0x101)
  {
    v9 = (char *)_CFCreateArrayStorage();
    v10 = (id *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1, "getObjects:", v9, v7);
  v11 = objc_msgSend(a3, "count");
  if (v6 >= 2 && v11)
  {
    v25[1] = 0;
    v12 = _CFCreateArrayStorage();
    _sortedObjectsUsingDescriptors((uint64_t)v9, v6, a3, v12);
    if (v12)
    {
      for (i = 0; i != v6; ++i)
        v14 = *(id *)(v12 + 8 * i);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v12, v6, v6);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0, v6);
    }
    v20 = v15;
  }
  else
  {
    if (v10)
    {
      if (v6)
      {
        v16 = v10;
        v17 = v6;
        do
        {
          v18 = *v16++;
          --v17;
        }
        while (v17);
      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v10, v6, v6);
    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v9, v6);
    }
    v10 = 0;
    v20 = v19;
  }
  v21 = v20;
  free(v10);
  return v21;
}

@end
