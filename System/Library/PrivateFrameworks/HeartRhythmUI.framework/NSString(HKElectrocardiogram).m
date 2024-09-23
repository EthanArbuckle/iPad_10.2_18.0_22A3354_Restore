@implementation NSString(HKElectrocardiogram)

- (id)hrui_appendForSharing:()HKElectrocardiogram
{
  id v3;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("_SHARED"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

@end
