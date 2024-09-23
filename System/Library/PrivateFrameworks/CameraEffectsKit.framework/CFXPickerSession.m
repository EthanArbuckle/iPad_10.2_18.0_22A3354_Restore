@implementation CFXPickerSession

- (CFXPickerSession)initWithIdentifier:(id)a3 isCompact:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CFXPickerSession *v8;
  CFXPickerSession *v9;
  uint64_t v10;
  NSDate *sessionStartTime;
  uint64_t v12;
  objc_super v14;

  v4 = a4;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CFXPickerSession;
  v8 = -[CFXPickerSession init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pickerBundleIdentifier, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = objc_claimAutoreleasedReturnValue();
    sessionStartTime = v9->_sessionStartTime;
    v9->_sessionStartTime = (NSDate *)v10;

    if (v4)
      v12 = 48;
    else
      v12 = 56;
    v9->_isCompactPresentation = v4;
    *(Class *)((char *)&v9->super.isa + v12) = (Class)(id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
    *(_WORD *)&v9->_didModifyEffectsStack = 0;
    v9->_typeOfRemovedEffect = 0;
  }

  return v9;
}

- (double)sessionDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPickerSession sessionStartTime](self, "sessionStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)isExpandedPresentation
{
  return !-[CFXPickerSession isCompactPresentation](self, "isCompactPresentation");
}

- (NSDictionary)effectChangesDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CFXPickerSession didModifyEffectsStack](self, "didModifyEffectsStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DidChangeEffectsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CFXPickerSession didRemoveEffect](self, "didRemoveEffect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DidRemoveEffectsKey"));

  -[CFXPickerSession typeOfRemovedEffect](self, "typeOfRemovedEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CFXPickerSession typeOfRemovedEffect](self, "typeOfRemovedEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RemovedEffectTypeKey"));

  }
  return (NSDictionary *)v3;
}

- (void)didChangePresentationMode
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;

  v3 = -[CFXPickerSession isCompactPresentation](self, "isCompactPresentation");
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CFXPickerSession lastCompactPresentationTime](self, "lastCompactPresentationTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    self->_compactPresentationDuration = v6 + self->_compactPresentationDuration;

    -[CFXPickerSession setLastCompactPresentationTime:](self, "setLastCompactPresentationTime:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPickerSession setLastExpandedPresentationTime:](self, "setLastExpandedPresentationTime:", v7);
    v8 = 0;
  }
  else
  {
    -[CFXPickerSession lastExpandedPresentationTime](self, "lastExpandedPresentationTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v9);
    self->_expandedPresentationDuration = v10 + self->_expandedPresentationDuration;

    -[CFXPickerSession setLastExpandedPresentationTime:](self, "setLastExpandedPresentationTime:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPickerSession setLastCompactPresentationTime:](self, "setLastCompactPresentationTime:", v7);
    v8 = 1;
  }

  self->_isCompactPresentation = v8;
}

- (void)didModifyEffectOfType:(id)a3 wasRemoval:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[CFXPickerSession setDidModifyEffectsStack:](self, "setDidModifyEffectsStack:", 1);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Filter")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("Animoji")))
  {
    -[CFXPickerSession setDidRemoveEffect:](self, "setDidRemoveEffect:", v4);
    if (v4)
      v6 = v7;
    else
      v6 = 0;
    -[CFXPickerSession setTypeOfRemovedEffect:](self, "setTypeOfRemovedEffect:", v6);
  }

}

- (void)didDismiss
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;

  v3 = -[CFXPickerSession isCompactPresentation](self, "isCompactPresentation");
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CFXPickerSession lastCompactPresentationTime](self, "lastCompactPresentationTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 24;
  }
  else
  {
    -[CFXPickerSession lastExpandedPresentationTime](self, "lastExpandedPresentationTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 32;
  }
  objc_msgSend(v7, "timeIntervalSinceDate:", v4);
  *(double *)((char *)&self->super.isa + v5) = v6 + *(double *)((char *)&self->super.isa + v5);

}

- (NSString)pickerBundleIdentifier
{
  return self->_pickerBundleIdentifier;
}

- (BOOL)isCompactPresentation
{
  return self->_isCompactPresentation;
}

- (double)compactPresentationDuration
{
  return self->_compactPresentationDuration;
}

- (double)expandedPresentationDuration
{
  return self->_expandedPresentationDuration;
}

- (BOOL)didScroll
{
  return self->_didScroll;
}

- (void)setDidScroll:(BOOL)a3
{
  self->_didScroll = a3;
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (NSDate)lastCompactPresentationTime
{
  return self->_lastCompactPresentationTime;
}

- (void)setLastCompactPresentationTime:(id)a3
{
  self->_lastCompactPresentationTime = (NSDate *)a3;
}

- (NSDate)lastExpandedPresentationTime
{
  return self->_lastExpandedPresentationTime;
}

- (void)setLastExpandedPresentationTime:(id)a3
{
  self->_lastExpandedPresentationTime = (NSDate *)a3;
}

- (double)totalCompactPresentationDuration
{
  return self->_totalCompactPresentationDuration;
}

- (void)setTotalCompactPresentationDuration:(double *)a3
{
  self->_totalCompactPresentationDuration = a3;
}

- (double)totalExpandedPresentationDuration
{
  return self->_totalExpandedPresentationDuration;
}

- (void)setTotalExpandedPresentationDuration:(double *)a3
{
  self->_totalExpandedPresentationDuration = a3;
}

- (BOOL)didModifyEffectsStack
{
  return self->_didModifyEffectsStack;
}

- (void)setDidModifyEffectsStack:(BOOL)a3
{
  self->_didModifyEffectsStack = a3;
}

- (BOOL)didRemoveEffect
{
  return self->_didRemoveEffect;
}

- (void)setDidRemoveEffect:(BOOL)a3
{
  self->_didRemoveEffect = a3;
}

- (NSString)typeOfRemovedEffect
{
  return self->_typeOfRemovedEffect;
}

- (void)setTypeOfRemovedEffect:(id)a3
{
  self->_typeOfRemovedEffect = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_pickerBundleIdentifier, 0);
}

@end
