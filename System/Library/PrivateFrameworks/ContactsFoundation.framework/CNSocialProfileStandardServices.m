@implementation CNSocialProfileStandardServices

void __CNSocialProfileStandardServices_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Twitter"), CFSTR("Facebook"), CFSTR("Flickr"), CFSTR("LinkedIn"), CFSTR("MySpace"), CFSTR("SinaWeibo"), CFSTR("TencentWeibo"), CFSTR("Yelp"), 0);
  v1 = (void *)CNSocialProfileStandardServices_services;
  CNSocialProfileStandardServices_services = v0;

}

@end
