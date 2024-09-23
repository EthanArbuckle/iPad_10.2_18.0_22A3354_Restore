@implementation ZN8Espresso28is

char *___ZN8Espresso28is_espresso_os_log_requestedENS_20espresso_os_log_flagE_block_invoke()
{
  uint64_t i;
  char *result;

  for (i = 0; i != 5; ++i)
  {
    result = getenv(Espresso::is_espresso_os_log_requested(Espresso::espresso_os_log_flag)::log_env_vars[i]);
    if (result)
    {
      if (*result == 49)
        Espresso::is_espresso_os_log_requested(Espresso::espresso_os_log_flag)::logs_requested[i] = 1;
    }
  }
  return result;
}

@end
