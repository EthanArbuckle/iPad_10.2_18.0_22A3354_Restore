@implementation MKFirstPartyRatingFormatter

+ (id)stringFromCount:(unint64_t)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  if (unum_open())
  {
    unum_setAttribute();
    unum_formatInt64();
    unum_close();
  }

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", 0, strlen(0), 4, 1);
}

@end
