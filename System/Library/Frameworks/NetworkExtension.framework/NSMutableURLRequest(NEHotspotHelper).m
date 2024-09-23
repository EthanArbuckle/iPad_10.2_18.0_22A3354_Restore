@implementation NSMutableURLRequest(NEHotspotHelper)

- (void)bindToHotspotHelperCommand:()NEHotspotHelper
{
  void *v4;
  void *v5;

  -[NEHotspotHelperCommand interfaceName](a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "setBoundInterfaceIdentifier:", v4);
    v4 = v5;
  }

}

@end
