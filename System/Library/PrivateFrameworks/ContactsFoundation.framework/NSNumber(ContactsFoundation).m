@implementation NSNumber(ContactsFoundation)

- (void)_cn_times:()ContactsFoundation
{
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);

  v6 = a3;
  if ((objc_msgSend(a1, "integerValue") & 0x8000000000000000) == 0)
  {
    v4 = objc_msgSend(a1, "integerValue");
    if (v4)
    {
      v5 = v4;
      do
      {
        v6[2]();
        --v5;
      }
      while (v5);
    }
  }

}

@end
