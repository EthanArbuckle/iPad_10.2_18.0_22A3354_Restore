@implementation MSReadTriageAction

- (BOOL)flagState
{
  void *v3;
  char v4;
  void *v5;

  -[MSTriageAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "shouldOverrideFlageStateForTriageAction:", self))
  {
    v4 = objc_msgSend(v3, "overrideFlagStateForTriageAction:", self);
  }
  else
  {
    -[MSReadTriageAction messageFlags](self, "messageFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "read");

  }
  return v4;
}

- (id)messageFlags
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D1E1E8];
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageListItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "combinedFlagsForMessageListItems:forDisplay:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "changesReadTo:", -[MSReadTriageAction flagState](self, "flagState") ^ 1);

}

@end
