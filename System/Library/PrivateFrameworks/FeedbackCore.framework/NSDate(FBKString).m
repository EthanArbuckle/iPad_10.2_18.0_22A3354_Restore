@implementation NSDate(FBKString)

- (uint64_t)fba_toString
{
  if (LogDateFormatter_onceToken != -1)
    dispatch_once(&LogDateFormatter_onceToken, &__block_literal_global_45);
  return objc_msgSend((id)LogDateFormatter_dateFormatter, "stringFromDate:", a1);
}

@end
