@implementation ZN2CA6RenderL29should

const char *___ZN2CA6RenderL29should_abort_on_send_failuresEv_block_invoke()
{
  const char *result;

  result = getenv("CA_IGNORE_MACH_SEND_ERRORS");
  if (result)
  {
    result = (const char *)atoi(result);
    if ((_DWORD)result)
      CA::Render::should_abort_on_send_failures(void)::ignore_mach_send_errors = 1;
  }
  return result;
}

@end
