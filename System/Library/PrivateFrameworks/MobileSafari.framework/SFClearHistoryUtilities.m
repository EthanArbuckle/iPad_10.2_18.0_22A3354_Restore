@implementation SFClearHistoryUtilities

+ (id)clearHistoryTimeFrameStringFromItemType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E21E5E40[a3];
}

+ (int64_t)clearHistoryTimeFrameItemTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LastHour")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Today")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TodayAndYesterday")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("All")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
