@implementation AKCAPiggybackReporter

- (AKCAPiggybackReporter)initWithRequestID:(id)a3
{
  id v4;
  AKCAPiggybackReporter *v5;
  AKCAPiggybackReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCAPiggybackReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, sel_initWithEvent_, CFSTR("com.apple.AuthKit.Piggyback"));
  v6 = v5;
  if (v5)
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestID"));

  return v6;
}

- (void)didCircleTimeout
{
  void *v3;

  -[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, CFSTR("piggybackResult"));

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didFinishAccepting
{
  void *v3;

  -[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, CFSTR("piggybackResult"));

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didCancelRequesting
{
  void *v3;

  -[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, CFSTR("piggybackResult"));

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didEscapeRequesting
{
  void *v3;

  -[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, CFSTR("piggybackResult"));

  -[AKCAReporter sendReport](self, "sendReport");
}

- (id)piggybackResultString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("circleTimeout");
  else
    return off_1E7679008[a3 - 1];
}

@end
