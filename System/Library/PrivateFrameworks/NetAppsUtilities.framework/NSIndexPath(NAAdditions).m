@implementation NSIndexPath(NAAdditions)

- (id)na_indexPathStartingAtPosition:()NAAdditions
{
  unint64_t v5;
  size_t v6;
  void *v7;
  void *v8;
  id v10;

  v5 = objc_msgSend(a1, "length");
  v6 = v5 - a3;
  if (v5 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("position argument is > length"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v7 = malloc_type_calloc(8uLL, v6, 0x1BC209C3uLL);
  objc_msgSend(a1, "getIndexes:range:", v7, a3, v6);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(v7);
  return v8;
}

+ (id)na_indexPathForItem:()NAAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)na_each:()NAAdditions
{
  size_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  void (**v8)(id, _QWORD);

  v8 = a3;
  v4 = objc_msgSend(a1, "length");
  v5 = (uint64_t *)malloc_type_calloc(8uLL, v4, 0xDC0EA1EAuLL);
  objc_msgSend(a1, "getIndexes:range:", v5, 0, v4);
  if (v4)
  {
    v6 = v5;
    do
    {
      v7 = *v6++;
      v8[2](v8, v7);
      --v4;
    }
    while (v4);
  }
  free(v5);

}

+ (id)na_indexPathForRow:()NAAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)na_section
{
  return objc_msgSend(a1, "indexAtPosition:", 0);
}

- (uint64_t)na_row
{
  return objc_msgSend(a1, "indexAtPosition:", 1);
}

- (uint64_t)na_item
{
  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(a1, "indexAtPosition:", 1);
}

@end
