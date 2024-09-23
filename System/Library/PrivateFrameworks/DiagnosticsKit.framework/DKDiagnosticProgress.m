@implementation DKDiagnosticProgress

- (DKDiagnosticProgress)initWithProgress:(id)a3
{
  id v4;
  DKDiagnosticProgress *v5;
  void *v6;
  uint64_t v7;
  NSNumber *fractionCompleted;
  uint64_t v9;
  NSNumber *estimatedTimeRemaining;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DKDiagnosticProgress;
  v5 = -[DKDiagnosticProgress init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "fractionCompleted");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();
    fractionCompleted = v5->_fractionCompleted;
    v5->_fractionCompleted = (NSNumber *)v7;

    objc_msgSend(v4, "estimatedTimeRemaining");
    v9 = objc_claimAutoreleasedReturnValue();
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v9;

    v5->_isIndeterminate = objc_msgSend(v4, "isIndeterminate");
    -[DKDiagnosticProgress _validateProperties](v5, "_validateProperties");
  }

  return v5;
}

- (DKDiagnosticProgress)initWithCoder:(id)a3
{
  id v4;
  DKDiagnosticProgress *v5;
  uint64_t v6;
  NSNumber *fractionCompleted;
  uint64_t v8;
  NSNumber *estimatedTimeRemaining;
  void *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  DKDiagnosticProgress *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKDiagnosticProgress;
  v5 = -[DKDiagnosticProgress init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fractionCompleted"));
    v6 = objc_claimAutoreleasedReturnValue();
    fractionCompleted = v5->_fractionCompleted;
    v5->_fractionCompleted = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedTimeRemaining"));
    v8 = objc_claimAutoreleasedReturnValue();
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isIndeterminate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isIndeterminate = objc_msgSend(v10, "BOOLValue");

    DiagnosticsKitLogHandleForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_22DE4C000, v11, OS_LOG_TYPE_DEFAULT, "Doing decode of DKDiagnosticProgress: %@", buf, 0xCu);
    }

    -[DKDiagnosticProgress _validateProperties](v5, "_validateProperties");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  DKDiagnosticProgress *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "Doing encode of DKDiagnosticProgress: %@", (uint8_t *)&v9, 0xCu);
  }

  -[DKDiagnosticProgress fractionCompleted](self, "fractionCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fractionCompleted"));

  -[DKDiagnosticProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("estimatedTimeRemaining"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DKDiagnosticProgress isIndeterminate](self, "isIndeterminate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isIndeterminate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DKDiagnosticProgress fractionCompleted](self, "fractionCompleted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Fraction Completed: %@, Estimated Time Remaining: %@ Indeterminate: %d"), v4, v5, -[DKDiagnosticProgress isIndeterminate](self, "isIndeterminate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)fractionCompleted
{
  return self->_fractionCompleted;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_fractionCompleted, 0);
}

@end
