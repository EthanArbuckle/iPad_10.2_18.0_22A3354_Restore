@implementation UIView(WKUIViewUtilities)

- (void)_web_setSubviews:()WKUIViewUtilities
{
  unint64_t v5;
  unint64_t v6;
  unint64_t i;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend(a1, "subviews"), "count");
  v6 = objc_msgSend(a3, "count");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = objc_msgSend(a3, "objectAtIndex:", i);
      if (i >= v5 || objc_msgSend((id)objc_msgSend(a1, "subviews"), "objectAtIndex:", i) != v8)
        objc_msgSend(a1, "insertSubview:atIndex:", v8, i);
    }
  }
  v9 = objc_msgSend((id)objc_msgSend(a1, "subviews"), "count");
  if (v6 < v9)
  {
    v10 = 0;
    do
    {
      v11 = (void *)objc_msgSend((id)objc_msgSend(a1, "subviews"), "objectAtIndex:", v6);
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE351978))
      {
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "addObject:", v11);
      }
      ++v6;
    }
    while (v9 != v6);
    if (v10)
    {
      objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromSuperview);
      CFRelease(v10);
    }
  }
}

@end
