@implementation DMFInstalledApplicationInstallProgress

- (Class)classForCoder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFInstalledApplicationInstallProgress;
  -[DMFInstalledApplicationInstallProgress classForCoder](&v3, sel_classForCoder);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
