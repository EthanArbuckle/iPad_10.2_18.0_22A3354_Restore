@implementation NSMutableArray(NSMutableArray)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)initWithContentsOfURL:()NSMutableArray error:
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "newWithContentsOf:immutable:error:", a3, 0, a4);

  return v5;
}

- (void)removeObjectsFromIndices:()NSMutableArray numIndices:
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  void *v12;
  size_t v13;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(a1, v4, *MEMORY[0x1E0C9AA08]);
  if (a4 < 2)
  {
LABEL_7:
    if (a4)
    {
      v11 = a3 - 1;
      do
        objc_msgSend(a1, "removeObjectAtIndex:", v11[a4--]);
      while (a4);
    }
  }
  else
  {
    v8 = *a3;
    v9 = 1;
    while (1)
    {
      v10 = a3[v9];
      if (v8 > v10)
        break;
      ++v9;
      v8 = v10;
      if (a4 == v9)
        goto LABEL_7;
    }
    v12 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
    memmove(v12, a3, 8 * a4);
    qsort(v12, a4, 8uLL, (int (__cdecl *)(const void *, const void *))int_sort);
    v13 = a4 - 1;
    do
      objc_msgSend(a1, "removeObjectAtIndex:", *((_QWORD *)v12 + v13--));
    while (v13 != -1);
    free(v12);
  }
}

- (uint64_t)initWithContentsOfFile:()NSMutableArray
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "newWithContentsOf:immutable:", a3, 0);

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableArray
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "newWithContentsOf:immutable:", a3, 0);

  return v4;
}

@end
