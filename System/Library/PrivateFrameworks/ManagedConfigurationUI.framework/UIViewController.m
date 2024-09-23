@implementation UIViewController

void __98__UIViewController_MCUI__MCUIReturnToSender_returnToAccountSettings_viewControllerDismissalBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    NSLog(CFSTR("MCUIViewController failed to swizzle user back to app %@ with error %@"), *(_QWORD *)(a1 + 32), a3);
}

@end
