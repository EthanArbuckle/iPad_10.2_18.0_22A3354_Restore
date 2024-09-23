@implementation CSVoiceTriggerSecondChanceContext

- (CSVoiceTriggerSecondChanceContext)initWithWindowStartTime:(unint64_t)a3
{
  CSVoiceTriggerSecondChanceContext *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSVoiceTriggerSecondChanceContext;
  v4 = -[CSVoiceTriggerSecondChanceContext init](&v7, sel_init);
  if (v4)
  {
    LODWORD(v5) = 8.0;
    v4->_secondChanceHotTillMachTime = objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v5) + a3;
  }
  return v4;
}

- (BOOL)shouldRunAsSecondChance
{
  return mach_absolute_time() <= self->_secondChanceHotTillMachTime;
}

- (unint64_t)secondChanceHotTillMachTime
{
  return self->_secondChanceHotTillMachTime;
}

- (void)setSecondChanceHotTillMachTime:(unint64_t)a3
{
  self->_secondChanceHotTillMachTime = a3;
}

@end
