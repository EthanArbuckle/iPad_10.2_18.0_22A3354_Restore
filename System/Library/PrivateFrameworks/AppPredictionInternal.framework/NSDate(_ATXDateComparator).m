@implementation NSDate(_ATXDateComparator)

- (BOOL)atx_isBeforeDate:()_ATXDateComparator
{
  return a3 && objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)atx_isAfterDate:()_ATXDateComparator
{
  return a3 && objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)atx_isOnOrAfterDate:()_ATXDateComparator
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "compare:", v4) == 1 || objc_msgSend(a1, "compare:", v4) == 0;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)atx_isInclusiveBetweenDate:()_ATXDateComparator andDate:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    if ((objc_msgSend(a1, "atx_isBeforeDate:", a3) & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(a1, "atx_isAfterDate:", v7) ^ 1;
  }

  return v8;
}

@end
