@implementation HMDRemoteMessageExceedBudgetLogEvent

- (HMDRemoteMessageExceedBudgetLogEvent)initWithBudgetRate:(_HMFRate)a3
{
  double period;
  unint64_t value;
  HMDRemoteMessageExceedBudgetLogEvent *result;
  objc_super v6;

  period = a3.period;
  value = a3.value;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteMessageExceedBudgetLogEvent;
  result = -[HMMLogEvent init](&v6, sel_init);
  if (result)
  {
    result->_budgetRate.value = value;
    result->_budgetRate.period = period;
  }
  return result;
}

- (_HMFRate)budgetRate
{
  _HMFRate *p_budgetRate;
  unint64_t value;
  double period;
  _HMFRate result;

  p_budgetRate = &self->_budgetRate;
  value = self->_budgetRate.value;
  period = p_budgetRate->period;
  result.period = period;
  result.value = value;
  return result;
}

+ (id)eventWithBudgetRate:(_HMFRate)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBudgetRate:", a3.value, *(_QWORD *)&a3.period);
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;

  v4 = *MEMORY[0x24BEB3588];
  v5 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Remote Send Threshold"), v4);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[HMDRemoteMessageExceedBudgetLogEvent budgetRate](self, "budgetRate");
  -[HMDRemoteMessageExceedBudgetLogEvent budgetRate](self, "budgetRate");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%tu,%u"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BEB3590]);

}

@end
