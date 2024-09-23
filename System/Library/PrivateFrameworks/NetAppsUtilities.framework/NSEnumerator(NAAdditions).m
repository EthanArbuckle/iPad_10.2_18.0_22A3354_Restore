@implementation NSEnumerator(NAAdditions)

- (void)na_each:()NAAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, void *);

  v7 = a3;
  objc_msgSend(a1, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      objc_msgSend(a1, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }

}

- (id)na_firstObjectPassingTest:()NAAdditions
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = 0;
  while (1)
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    if (v4[2](v4, v5))
    {
      v7 = v5;
      break;
    }
  }

  return v5;
}

- (NAFilterEnumerator)na_filter:()NAAdditions
{
  id v4;
  NAFilterEnumerator *v5;

  v4 = a3;
  v5 = -[NAFilterEnumerator initWithEnumerator:filter:]([NAFilterEnumerator alloc], "initWithEnumerator:filter:", a1, v4);

  return v5;
}

- (NAFlatMapEnumerator)na_map:()NAAdditions
{
  id v4;
  NAFlatMapEnumerator *v5;

  v4 = a3;
  v5 = -[NAFlatMapEnumerator initWithEnumerator:map:]([NAFlatMapEnumerator alloc], "initWithEnumerator:map:", a1, v4);

  return v5;
}

- (BOOL)na_any:()NAAdditions
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = a3;
  v5 = 0;
  do
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v5 && !v4[2](v4, v5));

  return v5 != 0;
}

- (BOOL)na_all:()NAAdditions
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = a3;
  v5 = 0;
  do
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v5 && (v4[2](v4, v5) & 1) != 0);

  return v5 == 0;
}

@end
