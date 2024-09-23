@implementation AKCATiburonAuthorizationUIReporter

- (AKCATiburonAuthorizationUIReporter)initWithRequestID:(id)a3
{
  id v4;
  AKCATiburonAuthorizationUIReporter *v5;
  AKCATiburonAuthorizationUIReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCATiburonAuthorizationUIReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, sel_initWithEvent_, CFSTR("com.apple.AuthKit.TiburonAuthorizationUI"));
  v6 = v5;
  if (v5)
  {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestID"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("modifiedName"));
  }

  return v6;
}

- (void)setModifiedName
{
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("modifiedName"));
}

- (void)didSelectAnonymousEmail:(BOOL)a3 didCancel:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("useAnonymous"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("didCancel"));

}

@end
