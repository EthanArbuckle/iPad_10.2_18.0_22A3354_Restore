@implementation EventsSortedByAnchor

uint64_t ___EventsSortedByAnchor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "anchor");
  if (v6 >= objc_msgSend(v5, "anchor"))
  {
    v8 = objc_msgSend(v4, "anchor");
    if (v8 <= objc_msgSend(v5, "anchor"))
    {
      objc_msgSend(v4, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end
