@implementation MCFormattedStringForTimeInterval

uint64_t __MCFormattedStringForTimeInterval_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)MCFormattedStringForTimeInterval_numericFormatter;
  MCFormattedStringForTimeInterval_numericFormatter = v0;

  objc_msgSend((id)MCFormattedStringForTimeInterval_numericFormatter, "setAllowedUnits:", 112);
  objc_msgSend((id)MCFormattedStringForTimeInterval_numericFormatter, "setUnitsStyle:", 3);
  return objc_msgSend((id)MCFormattedStringForTimeInterval_numericFormatter, "setFormattingContext:", 1);
}

@end
