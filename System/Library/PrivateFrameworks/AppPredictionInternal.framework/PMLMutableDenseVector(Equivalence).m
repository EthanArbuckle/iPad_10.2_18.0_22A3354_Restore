@implementation PMLMutableDenseVector(Equivalence)

- (uint64_t)isEqual:()Equivalence
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(a1, "isEqualToPMLMutableDenseVector:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToPMLMutableDenseVector:()Equivalence
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(a1, "count"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(a1, "valueAt:", v6);
        v8 = v7;
        objc_msgSend(v4, "valueAt:", v6);
        v10 = v8 == v9;
        if (v8 != v9)
          break;
        ++v6;
      }
      while (v6 < objc_msgSend(a1, "count"));
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
