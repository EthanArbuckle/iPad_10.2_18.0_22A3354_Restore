@implementation CIFilter(DataAdditionsImpl)

- (uint64_t)extractDataToDictionary:()DataAdditionsImpl options:context:colorSpace:error:
{
  if (a7)
  {
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("extractDataToDictionary is not available"), a1);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
