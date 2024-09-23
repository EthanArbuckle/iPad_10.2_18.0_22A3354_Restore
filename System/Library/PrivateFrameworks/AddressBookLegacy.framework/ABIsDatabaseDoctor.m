@implementation ABIsDatabaseDoctor

id __ABIsDatabaseDoctor_block_invoke()
{
  id result;

  result = +[ABUtils processName](ABUtils, "processName");
  if (result)
    result = (id)objc_msgSend(result, "isEqualToString:", CFSTR("ABDatabaseDoctor"));
  ABIsDatabaseDoctor_result = (char)result;
  return result;
}

@end
