@implementation AKCATiburonInputUIReporter

- (AKCATiburonInputUIReporter)initWithRequestID:(id)a3
{
  id v4;
  AKCATiburonInputUIReporter *v5;
  AKCATiburonInputUIReporter *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKCATiburonInputUIReporter;
  v5 = -[AKCAReporter initWithEvent:](&v9, sel_initWithEvent_, CFSTR("com.apple.AuthKit.TiburonAuthorizationUI"));
  v6 = v5;
  if (v5)
  {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestID"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_1E769A938, CFSTR("passwordCredentialCount"));
    v7 = MEMORY[0x1E0C9AAA0];
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("didShowAppleID"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("useAnonymous"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("useAppleID"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("usePasswordCredential"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("modifiedName"));
    -[AKCAReporter setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("didCancel"));
  }

  return v6;
}

- (void)setPasswordCredentialCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("passwordCredentialCount"));

}

- (void)didShowAppleID:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("didShowAppleID"));

}

- (void)didSelectAnonymousEmail:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("useAnonymous"));

}

- (void)didSelectAppleID:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("useAppleID"));

}

- (void)didSelectPasswordCredential:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("usePasswordCredential"));

}

- (void)didModifyName:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("modifiedName"));

}

- (void)didComplete:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("didCancel"));

}

- (void)_clearMutuallyExclusiveProperties:(BOOL)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = MEMORY[0x1E0C9AAA0];
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("useAppleID"));
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("usePasswordCredential"));
  }
}

@end
