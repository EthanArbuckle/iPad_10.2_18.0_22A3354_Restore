@implementation NSArray(VNAdditions)

- (void)vn_enumerateObjectsAsSubarraysOfCount:()VNAdditions usingBlock:
{
  void (**v6)(id, void *, unint64_t, unint64_t, _BYTE *);
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  unsigned __int8 v13;

  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  if (v7 < a3)
    a3 = v7;
  if (a3)
  {
    v8 = v7;
    v9 = 0;
    v13 = 0;
    do
    {
      if (a3 + v9 > v8)
        a3 = v8 - v9;
      objc_msgSend(a1, "subarrayWithRange:", v9, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v10, v9, a3, &v13);
      v11 = v13;

      v9 += a3;
      if (v11)
        v12 = 1;
      else
        v12 = v9 >= v8;
    }
    while (!v12);
  }

}

@end
