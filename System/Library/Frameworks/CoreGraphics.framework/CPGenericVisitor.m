@implementation CPGenericVisitor

- (void)visitChunk:(id)a3
{
  int v5;
  int v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v7), "accept:", self);
      v7 = (v7 + 1);
    }
    while (v6 != (_DWORD)v7);
  }
}

@end
