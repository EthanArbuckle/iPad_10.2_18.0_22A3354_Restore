@implementation HMDUsersSortedByPrivilege

uint64_t __HMDUsersSortedByPrivilege_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "privilege");
  v6 = objc_msgSend(v4, "privilege");

  if (v5 == v6)
    return 0;
  if (v5 == 3 || v6 == 3)
  {
    v8 = v5 == 3;
  }
  else if (v5 == 4 || v6 == 4)
  {
    v8 = v5 == 4;
  }
  else if (v5 == 1 || v6 == 1)
  {
    v8 = v5 == 1;
  }
  else
  {
    if (v5 && v6)
    {
      if (v5 == 2)
        return -1;
      else
        return v6 == 2;
    }
    v8 = v5 == 0;
  }
  if (v8)
    return -1;
  else
    return 1;
}

@end
