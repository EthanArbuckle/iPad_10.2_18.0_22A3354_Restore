@implementation CRNextCardCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "cardViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE154A8]);
    objc_msgSend(v4, "card");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nextCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBaseCard:", v8);
    objc_msgSend(v7, "setRequestedCard:", v9);
    objc_msgSend(v4, "cardViewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "controllerForCard:didRequestAsyncCard:withAsyncCardRequestFeedback:", v8, v9, v7);

  }
  v15.receiver = a1;
  v15.super_class = (Class)&off_25505DFA0;
  v11 = objc_msgSendSuper2(&v15, sel_handleForCardViewController_, v4);
  objc_msgSend(v4, "cardViewControllerDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(v12, "performNextCardCommand:forCardViewController:", a1, v4);
  else
    v13 = 0;

  return v13;
}

@end
