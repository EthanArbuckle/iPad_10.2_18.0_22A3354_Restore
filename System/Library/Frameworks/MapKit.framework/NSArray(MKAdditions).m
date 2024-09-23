@implementation NSArray(MKAdditions)

- (id)_mapkit_arrayByRemovingObject:()MKAdditions
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v4 = a3;
  if (v4 && (v5 = objc_msgSend(a1, "indexOfObject:", v4), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = v5;
    if (objc_msgSend(a1, "count") == 1)
    {
      v6 = 0;
    }
    else
    {
      v6 = (id)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(v6, "removeObjectAtIndex:", v8);
    }
  }
  else
  {
    v6 = a1;
  }

  return v6;
}

- (CFIndex)_mapkit_indexForObject:()MKAdditions usingSortFunction:context:
{
  CFRange v10;

  v10.length = objc_msgSend(a1, "count");
  v10.location = 0;
  return CFArrayBSearchValues((CFArrayRef)a1, v10, a3, a4, a5);
}

- (id)_mapkit_componentsJoinedInCommaDelimitedList
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_commaListDelimiter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsJoinedByString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mapkit_joinedAddressComponents
{
  void *v2;
  void *v3;

  _MKLocalizedStringFromThisBundle(CFSTR("Address component delimiter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsJoinedByString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
