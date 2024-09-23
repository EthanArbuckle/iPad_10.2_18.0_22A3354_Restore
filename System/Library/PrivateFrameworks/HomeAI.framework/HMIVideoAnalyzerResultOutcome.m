@implementation HMIVideoAnalyzerResultOutcome

- (HMIVideoAnalyzerResultOutcome)initWithCode:(unint64_t)a3 analysisFPS:(double)a4 message:(id)a5
{
  id v9;
  HMIVideoAnalyzerResultOutcome *v10;
  HMIVideoAnalyzerResultOutcome *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerResultOutcome;
  v10 = -[HMIVideoAnalyzerResultOutcome init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_code = a3;
    v10->_analysisFPS = a4;
    objc_storeStrong((id *)&v10->_message, a5);
  }

  return v11;
}

- (BOOL)isSkipped
{
  return -[HMIVideoAnalyzerResultOutcome code](self, "code") == 0;
}

- (BOOL)isSuccess
{
  return -[HMIVideoAnalyzerResultOutcome code](self, "code") == 1;
}

+ (HMIVideoAnalyzerResultOutcome)success
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HMIVideoAnalyzerResultOutcome_success__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (success_onceToken != -1)
    dispatch_once(&success_onceToken, block);
  return (HMIVideoAnalyzerResultOutcome *)(id)success_outcome;
}

void __40__HMIVideoAnalyzerResultOutcome_success__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCode:analysisFPS:message:", 1, 0, 1.0);
  v2 = (void *)success_outcome;
  success_outcome = v1;

}

+ (HMIVideoAnalyzerResultOutcome)skipped
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HMIVideoAnalyzerResultOutcome_skipped__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (skipped_onceToken != -1)
    dispatch_once(&skipped_onceToken, block);
  return (HMIVideoAnalyzerResultOutcome *)(id)skipped_outcome;
}

void __40__HMIVideoAnalyzerResultOutcome_skipped__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCode:analysisFPS:message:", 0, CFSTR("Unknown reason."), 0.0);
  v2 = (void *)skipped_outcome;
  skipped_outcome = v1;

}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = -[HMIVideoAnalyzerResultOutcome code](self, "code");
  v4 = CFSTR("Unknown");
  if (!v3)
    v4 = CFSTR("Skipped");
  if (v3 == 1)
    v5 = CFSTR("Success");
  else
    v5 = v4;
  -[HMIVideoAnalyzerResultOutcome message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerResultOutcome analysisFPS](self, "analysisFPS");
  v9 = v8;
  if (v6)
  {
    -[HMIVideoAnalyzerResultOutcome message](self, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("{code: %@, analysisFPS: %f, message: \"%@\"}"), v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("{code: %@, analysisFPS: %f}"), v5, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerResultOutcome)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerResultOutcome *v13;

  v4 = a3;
  NSStringFromSelector(sel_code);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_analysisFPS);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v7);
  v9 = v8;

  v10 = objc_opt_class();
  NSStringFromSelector(sel_message);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMIVideoAnalyzerResultOutcome initWithCode:analysisFPS:message:](self, "initWithCode:analysisFPS:message:", v6, v12, v9);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerResultOutcome code](self, "code");
  NSStringFromSelector(sel_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[HMIVideoAnalyzerResultOutcome analysisFPS](self, "analysisFPS");
  v8 = v7;
  NSStringFromSelector(sel_analysisFPS);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v9, v8);

  -[HMIVideoAnalyzerResultOutcome message](self, "message");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_message);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (unint64_t)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
