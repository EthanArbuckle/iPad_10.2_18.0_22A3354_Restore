@implementation UIViewController(MPUFoundationAdditions)

- (id)MPU_identifier
{
  return objc_getAssociatedObject(a1, CFSTR("_MPUViewControllerAdditionsIdentifierKey"));
}

- (void)MPU_setIdentifier:()MPUFoundationAdditions
{
  objc_setAssociatedObject(a1, CFSTR("_MPUViewControllerAdditionsIdentifierKey"), a3, (void *)3);
}

@end
