@implementation NPKIsRunningInCarousel

void __NPKIsRunningInCarousel_block_invoke()
{
  id v0;

  NPKGetMyProcessName();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  NPKIsRunningInCarousel_isRunningInCarousel = objc_msgSend(v0, "isEqualToString:", CFSTR("Carousel"));

}

@end
