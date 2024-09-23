@implementation NSURL(CalendarUIKit)

- (id)cal_ShortDisplayStringForURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "formattedStringForTelURL:", a1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "cal_hostAfterGoogleRedirects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v2 = v4;
      objc_msgSend(v4, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("www."));

      if (v6)
      {
        objc_msgSend(v2, "substringFromIndex:", 4);
        v7 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v7;
      }
      v8 = v2;
    }
    else
    {
      objc_msgSend(a1, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v8;
    }
    objc_msgSend(v8, "stringByURLUnescapingAllReservedCharacters");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v3;

  return v9;
}

@end
