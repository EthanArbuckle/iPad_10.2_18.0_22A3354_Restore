@implementation UIApplication(SLUIApplicationAdditions)

+ (void)shouldShowNetworkActivityIndicatorInRemoteApplication:()SLUIApplicationAdditions
{
  _QWORD block[4];
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__UIApplication_SLUIApplicationAdditions__shouldShowNetworkActivityIndicatorInRemoteApplication___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

@end
