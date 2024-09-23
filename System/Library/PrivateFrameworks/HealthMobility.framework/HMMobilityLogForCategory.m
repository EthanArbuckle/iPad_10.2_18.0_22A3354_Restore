@implementation HMMobilityLogForCategory

void __HMMobilityLogForCategory_block_invoke()
{
  unint64_t i;
  const char *v1;
  const char *v2;
  os_log_t v3;
  id v4;

  for (i = 0; i != 15; ++i)
  {
    v1 = (const char *)HMMobilityLogSubsystem;
    v2 = HMMobilityLogCategoryForCategory(i);
    v3 = os_log_create(v1, v2);
    v4 = HMMobilityLogForCategory_logObjects[i];
    HMMobilityLogForCategory_logObjects[i] = v3;

  }
}

@end
