@implementation UIView(ContentView)

- (id)_bottomVisibleView
{
  void *v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = 0;
  if (v3)
  {
    v5 = 0;
    do
    {
      objc_msgSend(a1, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "isHidden");
      if (v4 <= (uint64_t)v5)
        v9 = v5;
      else
        v9 = v4;
      if (!v8)
        v4 = v9;

      ++v5;
      objc_msgSend(a1, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v5 < v11);
  }
  objc_msgSend(a1, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
