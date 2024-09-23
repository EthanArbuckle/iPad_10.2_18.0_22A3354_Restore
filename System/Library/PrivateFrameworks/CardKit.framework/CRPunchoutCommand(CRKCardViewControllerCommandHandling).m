@implementation CRPunchoutCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&off_255057FE8;
  v5 = objc_msgSendSuper2(&v9, sel_handleForCardViewController_, v4);
  objc_msgSend(v4, "cardViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "performPunchoutCommand:forCardViewController:", a1, v4);
  else
    v7 = 0;

  return v7;
}

@end
