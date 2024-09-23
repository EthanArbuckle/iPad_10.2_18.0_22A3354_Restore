@implementation FPUnignoreItemsOperation

- (FPUnignoreItemsOperation)initWithItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPUnignoreItemsOperation;
  return -[FPUpdateIgnoreStateOperation initWithItems:ignoreState:action:](&v4, sel_initWithItems_ignoreState_action_, a3, 0, CFSTR("Unignore"));
}

@end
