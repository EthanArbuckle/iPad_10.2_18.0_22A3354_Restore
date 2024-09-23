@implementation NSMutableArray(MSArrayUtilities)

- (void)MSRemoveOneObject:()MSArrayUtilities
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", v7);

      if (v6)
        break;
      if (++v4 >= (unint64_t)objc_msgSend(a1, "count"))
        goto LABEL_7;
    }
    objc_msgSend(a1, "removeObjectAtIndex:", v4);
  }
LABEL_7:

}

- (void)MSRemoveOneObjectByPointerComparison:()MSArrayUtilities
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndex:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
        break;
      if (++v4 >= (unint64_t)objc_msgSend(a1, "count"))
        goto LABEL_7;
    }
    objc_msgSend(a1, "removeObjectAtIndex:", v4);
  }
LABEL_7:

}

@end
