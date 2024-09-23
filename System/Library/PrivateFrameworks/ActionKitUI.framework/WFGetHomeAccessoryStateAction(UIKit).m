@implementation WFGetHomeAccessoryStateAction(UIKit)

- (id)localizedFooter
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEC3DE0], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  WFFooterTextForHomeAction();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
