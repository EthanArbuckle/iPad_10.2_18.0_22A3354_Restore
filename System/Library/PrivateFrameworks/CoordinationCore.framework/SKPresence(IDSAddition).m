@implementation SKPresence(IDSAddition)

- (id)co_IDSIdentifier
{
  return objc_getAssociatedObject(a1, sel_co_IDSIdentifier);
}

- (void)co_SetIDSIdentifier:()IDSAddition
{
  objc_setAssociatedObject(a1, sel_co_IDSIdentifier, a3, (void *)1);
}

@end
