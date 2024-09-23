@implementation CDPCAEscrowReporter

- (CDPCAEscrowReporter)initWithPreRecordIdentifier:(id)a3
{
  id v4;
  CDPCAEscrowReporter *v5;
  CDPCAEscrowReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CDPCAEscrowReporter;
  v5 = -[CDPCAReporter initWithEvent:](&v8, sel_initWithEvent_, CFSTR("com.apple.CoreCDP.EscrowPreRecord"));
  v6 = v5;
  if (v5)
    -[CDPCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("preRecordIdentifier"));

  return v6;
}

- (void)didAttemptEscrowPreRecord
{
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("didAttemptEscrowPreRecord"), CFSTR("EscrowPreRecordResult"));
  -[CDPCAReporter sendReport](self, "sendReport");
}

@end
