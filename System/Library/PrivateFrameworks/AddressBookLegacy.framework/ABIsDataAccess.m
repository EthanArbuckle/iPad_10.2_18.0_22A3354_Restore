@implementation ABIsDataAccess

id __ABIsDataAccess_block_invoke()
{
  id result;
  BOOL v1;

  result = +[ABUtils mainBundleID](ABUtils, "mainBundleID");
  if (result)
  {
    result = (id)CFEqual(result, CFSTR("com.apple.dataaccess.dataaccessd"));
    v1 = (_DWORD)result != 0;
  }
  else
  {
    v1 = 0;
  }
  ABIsDataAccess_result = v1;
  return result;
}

@end
