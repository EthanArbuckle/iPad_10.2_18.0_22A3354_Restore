@implementation MSUnsubscribeTriageAction

- (id)_changeAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D1E3B0]);
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithMessageListItems:origin:actor:", v5, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));

  return v6;
}

@end
