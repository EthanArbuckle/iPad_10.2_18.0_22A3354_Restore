@implementation NSArray(DiffBuilding)

- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = v6;
  v8 = objc_msgSend(a1, "count");
  v9 = objc_msgSend(v15, "count");
  if (v8 <= v9)
    v10 = v9;
  else
    v10 = v8;
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      if (objc_msgSend(a1, "count") <= i)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v15, "count") <= i)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "diffObject:againstObject:withDescription:", v12, v13, v14);

    }
  }

}

@end
