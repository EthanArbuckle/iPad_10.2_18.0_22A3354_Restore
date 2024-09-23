@implementation NSObject(EmojiCompare)

- (uint64_t)_emojiCompare:()EmojiCompare
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  id location[2];
  id v13;
  uint64_t v14;
  double v15;

  v13 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_msgSend(v13, "frame");
  v10 = v3;
  v11 = v4;
  objc_msgSend(location[0], "frame");
  v8 = v5;
  v9 = v6;
  NSClassFromString(CFSTR("UIKeyboardEmojiSectionHeader"));
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = v10 - v8;
      if (fabs(v10 - v8) >= 1.0)
      {
        if (v10 - v8 >= 0.0)
          v14 = 1;
        else
          v14 = -1;
      }
      else if (v11 >= v9)
      {
        v14 = 1;
      }
      else
      {
        v14 = -1;
      }
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = -1;
  }
  objc_storeStrong(location, 0);
  return v14;
}

@end
