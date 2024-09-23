@implementation FPIgnoreItemsOperation

- (FPIgnoreItemsOperation)initWithItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPIgnoreItemsOperation;
  return -[FPUpdateIgnoreStateOperation initWithItems:ignoreState:action:](&v4, sel_initWithItems_ignoreState_action_, a3, 1, CFSTR("ExcludeFromSync"));
}

@end
