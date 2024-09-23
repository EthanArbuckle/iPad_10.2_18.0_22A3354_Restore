@implementation NSMutableDictionary(CoreDAVExtensions)

- (void)CDVAddObjectsAndKeys:()CoreDAVExtensions
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  id *v19;

  v12 = a3;
  if (v12)
  {
    objc_msgSend(a1, "setObject:forKey:", v12, a9);
    v19 = (id *)&a11;
    v13 = a10;
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      do
      {
        v16 = v15;
        v15 = *v19;

        objc_msgSend(a1, "setObject:forKey:", v14, v15);
        v17 = v19 + 1;
        v19 += 2;
        v18 = *v17;

        v14 = v18;
      }
      while (v18);

    }
  }

}

@end
