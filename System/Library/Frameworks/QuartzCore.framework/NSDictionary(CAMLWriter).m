@implementation NSDictionary(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("NSDictionary");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  result = objc_msgSend(v5, "count");
  if (result)
  {
    v7 = result;
    for (i = 0; i != v7; ++i)
    {
      v9 = objc_msgSend(v5, "objectAtIndex:", i);
      v10 = objc_msgSend(a1, "objectForKey:", v9);
      objc_msgSend(a3, "beginPropertyElement:", v9);
      objc_msgSend(a3, "encodeObject:", v10);
      result = objc_msgSend(a3, "endElement");
    }
  }
  return result;
}

@end
