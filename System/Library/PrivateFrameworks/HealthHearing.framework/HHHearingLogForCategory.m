@implementation HHHearingLogForCategory

void __HHHearingLogForCategory_block_invoke()
{
  unint64_t i;
  const char *v1;
  const char *v2;
  os_log_t v3;
  id v4;

  for (i = 0; i != 14; ++i)
  {
    v1 = (const char *)HHHearingLogSubsystem;
    v2 = HHHearingLogCategoryForCategory(i);
    v3 = os_log_create(v1, v2);
    v4 = HHHearingLogForCategory_logObjects[i];
    HHHearingLogForCategory_logObjects[i] = v3;

  }
}

@end
