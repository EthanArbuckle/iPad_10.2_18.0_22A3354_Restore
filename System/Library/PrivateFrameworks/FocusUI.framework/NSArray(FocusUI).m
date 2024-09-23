@implementation NSArray(FocusUI)

- (uint64_t)fcui_isEqualToActionArray:()FocusUI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  v6 = a1 == v4;
  if (v4 && a1 != v4)
  {
    v7 = objc_msgSend(a1, "count");
    if (v7 == objc_msgSend(v5, "count") && objc_msgSend(a1, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "fcui_isEqualToAction:", v10);

        if ((v6 & 1) == 0)
          break;
        ++v8;
      }
      while (v8 < objc_msgSend(a1, "count"));
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
