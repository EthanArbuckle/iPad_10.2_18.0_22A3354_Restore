@implementation AKCASatoriReporter

- (AKCASatoriReporter)initWithRequestID:(id)a3
{
  id v4;
  AKCASatoriReporter *v5;
  AKCASatoriReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCASatoriReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, sel_initWithEvent_, CFSTR("com.apple.AuthKit.TiburonSatori"));
  v6 = v5;
  if (v5)
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestID"));

  return v6;
}

- (void)didCompleteWithSuccess:(BOOL)a3 authorizationAlreadyComplete:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("availableLateAfterAuthComplete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("wasSuccess"));

}

- (void)didPerformVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("performVerificationSuccess"));

  -[AKCAReporter machAbsoluteTimeToTimeInterval:](self, "machAbsoluteTimeToTimeInterval:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("performVerificationDuration"));

}

- (void)didCompleteVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("verificationResults"));

  -[AKCAReporter machAbsoluteTimeToTimeInterval:](self, "machAbsoluteTimeToTimeInterval:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("verificationResultsDuration"));

}

@end
