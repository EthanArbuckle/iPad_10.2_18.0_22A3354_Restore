@implementation NSDate

uint64_t __58__NSDate_FCAdditions___fr_sharedYearAndMonthDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F8720;
  qword_1ED0F8720 = v0;

  return objc_msgSend((id)qword_1ED0F8720, "setDateFormat:", CFSTR("yyyy-MM"));
}

@end
