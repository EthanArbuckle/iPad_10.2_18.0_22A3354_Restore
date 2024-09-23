@implementation HMMTRAccessoryServerDiagnosticsEvent

- (HMMTRAccessoryServerDiagnosticsEvent)initWithValues:(id)a3
{
  id v5;
  HMMTRAccessoryServerDiagnosticsEvent *v6;
  HMMTRAccessoryServerDiagnosticsEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRAccessoryServerDiagnosticsEvent;
  v6 = -[HMMTRAccessoryServerDiagnosticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_values, a3);

  return v7;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
