@implementation CSPreciseDateProvider

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x1E0DAC618], "now");
}

- (CSPreciseDateProvider)init
{
  CSPreciseDateProvider *v2;
  uint64_t v3;
  SBUIPreciseClockTimer *preciseClockTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPreciseDateProvider;
  v2 = -[CSPreciseDateProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DAC618], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    preciseClockTimer = v2->_preciseClockTimer;
    v2->_preciseClockTimer = (SBUIPreciseClockTimer *)v3;

  }
  return v2;
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  return (id)-[SBUIPreciseClockTimer startMinuteUpdatesWithHandler:](self->_preciseClockTimer, "startMinuteUpdatesWithHandler:", a3);
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  -[SBUIPreciseClockTimer stopMinuteUpdatesForToken:](self->_preciseClockTimer, "stopMinuteUpdatesForToken:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preciseClockTimer, 0);
}

@end
