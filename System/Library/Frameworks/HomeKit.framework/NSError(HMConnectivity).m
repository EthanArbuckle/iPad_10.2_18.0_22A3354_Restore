@implementation NSError(HMConnectivity)

+ (CFErrorRef)hm_errorWithNWError:()HMConnectivity
{
  if (error)
    return nw_error_copy_cf_error(error);
  else
    return (CFErrorRef)0;
}

@end
