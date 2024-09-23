@implementation ZN2CI11PerspectiveL24CI

char *___ZN2CI11PerspectiveL24CI_AUTOPERSPECTIVE_DEBUGEv_block_invoke()
{
  char *result;

  result = getenv("CI_AUTOPERSPECTIVE_DEBUG");
  CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump = result != 0;
  return result;
}

char *___ZN2CI11PerspectiveL24CI_AUTOPERSPECTIVE_DEBUGEv_block_invoke_0()
{
  char *result;

  result = getenv("CI_AUTOPERSPECTIVE_DEBUG");
  CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump = result != 0;
  return result;
}

@end
