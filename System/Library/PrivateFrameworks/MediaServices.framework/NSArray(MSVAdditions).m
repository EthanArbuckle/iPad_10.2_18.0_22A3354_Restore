@implementation NSArray(MSVAdditions)

- (uint64_t)msv_compactDescription
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
}

- (id)msv_indexesOfObjectsEqualTo:()MSVAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NSArray_MSVAdditions__msv_indexesOfObjectsEqualTo___block_invoke;
  v8[3] = &unk_1E43E88D0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)msv_firstIndexOfObjectsPassingTest:()MSVAdditions
{
  uint64_t (**v4)(id, void *, uint64_t, _BYTE *);
  uint64_t v5;
  void *v6;
  int v7;
  char v9;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = 0;
    while (1)
    {
      v9 = 0;
      objc_msgSend(a1, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4[2](v4, v6, v5, &v9);

      if (v7)
        break;
      if (!v9 && ++v5 < (unint64_t)objc_msgSend(a1, "count"))
        continue;
      goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (uint64_t)msv_firstIndexOfObjectEqualTo:()MSVAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_MSVAdditions__msv_firstIndexOfObjectEqualTo___block_invoke;
  v8[3] = &unk_1E43E88D0;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "msv_firstIndexOfObjectsPassingTest:", v8);

  return v6;
}

- (uint64_t)msv_lastIndexOfObjectsPassingTest:()MSVAdditions
{
  uint64_t (**v4)(id, void *, uint64_t, _BYTE *);
  uint64_t v5;
  void *v6;
  int v7;
  char v9;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = objc_msgSend(a1, "count") - 1;
    do
    {
      if (v5 < 0)
        break;
      v9 = 0;
      objc_msgSend(a1, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4[2](v4, v6, v5, &v9);

      if (v7)
        goto LABEL_7;
      --v5;
    }
    while (!v9);
  }
  v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return v5;
}

- (uint64_t)msv_lastIndexOfObjectEqualTo:()MSVAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NSArray_MSVAdditions__msv_lastIndexOfObjectEqualTo___block_invoke;
  v8[3] = &unk_1E43E88D0;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "msv_lastIndexOfObjectsPassingTest:", v8);

  return v6;
}

- (id)msv_subarrayToIndex:()MSVAdditions
{
  id v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = a1;
  }
  else if ((a3 & 0x8000000000000000) != 0)
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)msv_subarrayFromIndex:()MSVAdditions
{
  id v3;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", a3 + 1, objc_msgSend(a1, "count") + ~a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
