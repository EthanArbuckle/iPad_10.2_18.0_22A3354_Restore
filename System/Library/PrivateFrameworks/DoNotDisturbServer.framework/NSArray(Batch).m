@implementation NSArray(Batch)

- (void)enumerateBatchesOfSize:()Batch handler:
{
  void (**v6)(id, void *, _BYTE *);
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  unsigned __int8 v14;

  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  v8 = 0;
  v14 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 * a3;
    if (v8 * a3 + a3 >= v7)
      v11 = v7;
    else
      v11 = v8 * a3 + a3;
    while (v10 < v11)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    if (objc_msgSend(v9, "count"))
      v6[2](v6, v9, &v14);
    v13 = v14;

    if (v13)
      break;
    ++v8;
  }
  while (v8 <= v7 / a3);

}

@end
