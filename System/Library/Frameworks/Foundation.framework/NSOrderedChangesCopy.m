@implementation NSOrderedChangesCopy

id ___NSOrderedChangesCopy_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  size_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  id result;
  uint64_t v20;
  uint64_t v21;

  v9 = *(_QWORD **)(a1 + 32);
  if (a2 == 5 && a3 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void __NSOrderedChangeListAppend(NSOrderedChanges *, NSKeyValueChange, NSUInteger, NSUInteger, id)"), CFSTR("NSOrderedChanges.m"), 187, CFSTR("move sources not found"));
  v10 = v9[3];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (char *)v9[2];
    goto LABEL_16;
  }
  v11 = v9[4];
  if (v11)
  {
    v12 = malloc_good_size(40 * v11 + 40) / 0x28;
    if (v12 <= v9[4])
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void __NSOrderedChangeListGrowIfNeeded(NSOrderedChangeList *)"), CFSTR("NSOrderedChanges.m"), 154, CFSTR("capacity should be larger than previously requested"));
  }
  else
  {
    v12 = 32;
  }
  v14 = v9[2];
  if (!v14)
  {
    v13 = (char *)malloc_type_malloc(40 * v12, 0x1080040A84C04D1uLL);
    if (v13)
      goto LABEL_12;
LABEL_22:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("Unable to allocate underlying buffer for change list"), 0));
  }
  v13 = (char *)MEMORY[0x186DA80E4](v14, 40 * v12, 0x1080040A84C04D1, 0);
  if (!v13)
    goto LABEL_22;
LABEL_12:
  v15 = v9[4];
  if (v15 < v12)
  {
    v16 = (uint64_t *)&v13[40 * v15 + 32];
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      *(v16 - 1) = 0;
      *v16 = v17;
      v17 = v15++;
      v16 += 5;
    }
    while (v12 != v15);
  }
  v10 = v12 - 1;
  v9[2] = v13;
  v9[3] = v12 - 1;
  v9[4] = v12;
LABEL_16:
  v18 = &v13[40 * v10];
  *((_QWORD *)v18 + 1) = a3;
  *((_QWORD *)v18 + 2) = a4;
  result = a5;
  *(_QWORD *)v18 = a2;
  *((_QWORD *)v18 + 3) = result;
  *((_QWORD *)v18 + 4) = 0x7FFFFFFFFFFFFFFFLL;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  if (v9[5] == 0x7FFFFFFFFFFFFFFFLL)
    v9[5] = v10;
  v20 = v9[6];
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(v9[2] + 40 * v20 + 32) = v10;
  v21 = v9[7] + 1;
  v9[6] = v10;
  v9[7] = v21;
  return result;
}

@end
