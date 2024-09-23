@implementation BuddyTimestamp

+ (unint64_t)currentTimestamp
{
  return mach_continuous_time();
}

+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4
{
  id location;
  dispatch_once_t *v8;

  v8 = (dispatch_once_t *)&unk_1002EE8D0;
  location = 0;
  objc_storeStrong(&location, &stru_100281950);
  if (*v8 != -1)
    dispatch_once(v8, location);
  objc_storeStrong(&location, 0);
  return ((double)a4 - (double)a3)
       * (double)dword_1002EE8C8
       / (double)dword_1002EE8CC
       / 1000000000.0;
}

+ (double)intervalSinceTimestamp:(unint64_t)a3
{
  double result;

  objc_msgSend(a1, "intervalFromStart:toEnd:", a3, objc_msgSend(a1, "currentTimestamp"));
  return result;
}

@end
