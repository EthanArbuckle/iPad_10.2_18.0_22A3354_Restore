@implementation UIScrollView(PKAdditions)

- (double)_pk_minimumContentOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "contentInset");
  v3 = -v2;
  objc_msgSend(a1, "contentInset");
  return v3;
}

- (double)_pk_maximumContentOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "contentSize");
  v3 = v2;
  objc_msgSend(a1, "bounds");
  v5 = v3 - v4;
  objc_msgSend(a1, "contentInset");
  v7 = v6 + v5;
  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "contentInset");
  return v7;
}

- (double)_pk_closestContentOffsetFromOffset:()PKAdditions
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a1, "_pk_minimumContentOffset");
  if (a2 <= v6)
  {
    objc_msgSend(a1, "_pk_minimumContentOffset");
    if (a3 <= v7)
    {
      objc_msgSend(a1, "_pk_minimumContentOffset");
      return v10;
    }
  }
  objc_msgSend(a1, "_pk_maximumContentOffset");
  if (a2 >= v8)
  {
    objc_msgSend(a1, "_pk_maximumContentOffset");
    if (a3 >= v9)
    {
      objc_msgSend(a1, "_pk_maximumContentOffset");
      return v10;
    }
  }
  return a2;
}

@end
