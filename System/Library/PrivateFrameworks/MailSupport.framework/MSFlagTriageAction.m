@implementation MSFlagTriageAction

- (BOOL)flagState
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  if (!-[MSFlagTriageAction cachedFlagState](self, "cachedFlagState"))
  {
    -[MSTriageAction delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v3, "shouldOverrideFlageStateForTriageAction:", self))
    {
      if (!objc_msgSend(v3, "overrideFlagStateForTriageAction:", self))
      {
LABEL_10:
        v9 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSelectAll");

      if ((v5 & 1) != 0)
        goto LABEL_10;
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messageListItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_4);

      if ((v8 & 1) == 0)
        goto LABEL_10;
    }
    v9 = 1;
LABEL_11:
    -[MSFlagTriageAction setCachedFlagState:](self, "setCachedFlagState:", v9);

  }
  return -[MSFlagTriageAction cachedFlagState](self, "cachedFlagState") == 2;
}

uint64_t __31__MSFlagTriageAction_flagState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasUnflagged");
}

- (NSNumber)flagColor
{
  void *v3;
  NSNumber *v4;

  if (self->_flagColor || -[MSFlagTriageAction flagState](self, "flagState"))
    goto LABEL_6;
  -[MSTriageAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    v4 = self->_flagColor;
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "defaultFlagColorForTriageAction:", self));
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isFlagged
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MSFlagTriageAction flagColor](self, "flagColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "unsignedIntegerValue");
    v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") < 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_toggleCachedFlagState
{
  uint64_t v3;

  if (-[MSFlagTriageAction cachedFlagState](self, "cachedFlagState") == 2)
  {
    v3 = 1;
  }
  else
  {
    if (-[MSFlagTriageAction cachedFlagState](self, "cachedFlagState") != 1)
      return;
    v3 = 2;
  }
  -[MSFlagTriageAction setCachedFlagState:](self, "setCachedFlagState:", v3);
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[MSFlagTriageAction _isFlagged](self, "_isFlagged");
  objc_msgSend(v6, "changesFlaggedTo:", v4);
  if (v4)
  {
    -[MSFlagTriageAction flagColor](self, "flagColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changesFlagColorTo:", objc_msgSend(v5, "unsignedIntegerValue"));

  }
  -[MSFlagTriageAction _toggleCachedFlagState](self, "_toggleCachedFlagState");

}

- (void)setFlagColor:(id)a3
{
  objc_storeStrong((id *)&self->_flagColor, a3);
}

- (unint64_t)cachedFlagState
{
  return self->_cachedFlagState;
}

- (void)setCachedFlagState:(unint64_t)a3
{
  self->_cachedFlagState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagColor, 0);
}

@end
