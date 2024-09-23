@implementation UIImageView(MKAdditions)

- (unint64_t)imageContentMode
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "contentMode");
  if (v1 > 4)
    return 0x8000000000000000;
  else
    return qword_18B2A9460[v1];
}

- (void)setImageContentMode:()MKAdditions
{
  uint64_t v3;

  if (a3 > 1)
  {
    if (a3 == 2)
      v3 = 2;
    else
      v3 = 0;
    if (a3 != 4)
      a3 = v3;
  }
  else
  {
    if (a3 == 0x8000000000000000)
      return a1;
    if (a3 != 1)
      a3 = 0;
  }
  return (void *)objc_msgSend(a1, "setContentMode:", a3);
}

@end
