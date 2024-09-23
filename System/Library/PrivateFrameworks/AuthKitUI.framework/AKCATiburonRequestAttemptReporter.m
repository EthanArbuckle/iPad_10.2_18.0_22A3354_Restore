@implementation AKCATiburonRequestAttemptReporter

- (AKCATiburonRequestAttemptReporter)initWithRequestID:(id)a3
{
  id v4;
  AKCATiburonRequestAttemptReporter *v5;
  AKCATiburonRequestAttemptReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCATiburonRequestAttemptReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, sel_initWithEvent_, CFSTR("com.apple.AuthKit.TiburonAttempt"));
  v6 = v5;
  if (v5)
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestID"));

  return v6;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "authorizedRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v7, "authorizedRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isKindOfClass & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v11, CFSTR("authorizationRequestSuccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v12, CFSTR("passwordRequestSuccess"));

  objc_msgSend(v6, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v13, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, CFSTR("errorCode"));

  AKErrorUnderlyingError();
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v15, CFSTR("underlyingErrorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v16, CFSTR("underlyingErrorCode"));

  }
}

@end
