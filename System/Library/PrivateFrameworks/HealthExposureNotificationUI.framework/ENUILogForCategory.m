@implementation ENUILogForCategory

void __ENUILogForCategory_block_invoke()
{
  unint64_t i;
  const char *v1;
  const char *v2;
  os_log_t v3;
  id v4;

  for (i = 0; i != 4; ++i)
  {
    v1 = (const char *)ENUILogSubsystem;
    v2 = ENUILogCategoryForCategory(i);
    v3 = os_log_create(v1, v2);
    v4 = ENUILogForCategory_logObjects[i];
    ENUILogForCategory_logObjects[i] = v3;

  }
}

@end
