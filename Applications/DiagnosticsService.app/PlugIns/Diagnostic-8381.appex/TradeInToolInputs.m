@implementation TradeInToolInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  id v5;
  objc_super v7;
  char v8;

  v7.receiver = self;
  v7.super_class = (Class)TradeInToolInputs;
  v4 = a3;
  v8 = !-[DisplayViewInputs validateAndInitializeParameters:](&v7, "validateAndInitializeParameters:", v4);
  v5 = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("autoAdvanceImages"), 0, &v8);

  -[TradeInToolInputs setUseAutoAdvance:](self, "setUseAutoAdvance:", v5);
  return v8 == 0;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (BOOL)useAutoAdvance
{
  return self->_useAutoAdvance;
}

- (void)setUseAutoAdvance:(BOOL)a3
{
  self->_useAutoAdvance = a3;
}

@end
