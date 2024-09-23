@implementation CKFiltersBySortingFilters

uint64_t __CKFiltersBySortingFilters_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  unsigned int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v4 = a2;
  v5 = a3;
  if (v4)
    v6 = (void *)*((_QWORD *)v4 + 1);
  else
    v6 = 0;
  v7 = v6;
  if ((objc_msgSend(v7, "hasName") & 1) == 0)
  {

LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (v5)
    v8 = (void *)*((_QWORD *)v5 + 1);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "hasName");

  if (!v10)
    goto LABEL_16;
  if (v4)
    v11 = (void *)*((_QWORD *)v4 + 1);
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v14 = (void *)*((_QWORD *)v5 + 1);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "compare:", v16);

  if (!v17)
  {
    if (v4)
    {
      if ((*((_BYTE *)v4 + 28) & 1) != 0)
        v18 = *((_DWORD *)v4 + 6);
      else
        v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    v20 = CKQueryFilterTypeSortedValue(v18);
    if (v5)
    {
      if ((*((_BYTE *)v5 + 28) & 1) != 0)
        v21 = *((_DWORD *)v5 + 6);
      else
        v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    v22 = CKQueryFilterTypeSortedValue(v21);
    if (v20 >= v22)
      v23 = 0;
    else
      v23 = -1;
    if (v20 > v22)
      v17 = 1;
    else
      v17 = v23;
  }
LABEL_17:

  return v17;
}

@end
