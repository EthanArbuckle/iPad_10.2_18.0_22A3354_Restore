@implementation CPObjectUtility

+ (float)complexityOfPage:(id)a3
{
  float v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;

  v4 = 1.0;
  if (objc_msgSend((id)objc_msgSend(a3, "imagesOnPage"), "count") <= 0x3E8)
  {
    v5 = (void *)objc_msgSend(a3, "shapesOnPage");
    v6 = objc_msgSend(v5, "count");
    v7 = v6;
    if (v6 <= 0x3E8)
    {
      if (v6)
      {
        v8 = 0;
        v9 = 0;
        v10 = v6 - 1;
        do
          v9 += objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v8), "pathElementCount");
        while (v9 >> 4 <= 0x270 && v10 != v8++);
      }
      else
      {
        v9 = 0;
      }
      v12 = v9 + v7;
      if (v9 + v7 >= 0x2710)
        v12 = 10000;
      return (float)v12 / 10000.0;
    }
  }
  return v4;
}

@end
