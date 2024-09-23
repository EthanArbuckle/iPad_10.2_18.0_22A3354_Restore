@implementation NUEmbedData

- (unint64_t)autoPlayMediaWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("video")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("audio")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("all")) << 63 >> 63;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
