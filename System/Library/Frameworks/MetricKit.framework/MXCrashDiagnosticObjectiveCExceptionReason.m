@implementation MXCrashDiagnosticObjectiveCExceptionReason

- (MXCrashDiagnosticObjectiveCExceptionReason)initWithComposedMessage:(id)a3 formatString:(id)a4 arguments:(id)a5 type:(id)a6 className:(id)a7 exceptionName:(id)a8
{
  id v15;
  id v16;
  id v17;
  MXCrashDiagnosticObjectiveCExceptionReason *v18;
  MXCrashDiagnosticObjectiveCExceptionReason *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MXCrashDiagnosticObjectiveCExceptionReason;
  v18 = -[MXCrashDiagnosticObjectiveCExceptionReason init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_composedMessage, a3);
    objc_storeStrong((id *)&v19->_formatString, a4);
    objc_storeStrong((id *)&v19->_arguments, a5);
    objc_storeStrong((id *)&v19->_exceptionType, a6);
    objc_storeStrong((id *)&v19->_className, a7);
    objc_storeStrong((id *)&v19->_exceptionName, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *composedMessage;
  id v5;

  composedMessage = self->_composedMessage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", composedMessage, CFSTR("composedMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatString, CFSTR("formatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exceptionType, CFSTR("exceptionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_className, CFSTR("className"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exceptionName, CFSTR("exceptionName"));

}

- (MXCrashDiagnosticObjectiveCExceptionReason)initWithCoder:(id)a3
{
  id v4;
  MXCrashDiagnosticObjectiveCExceptionReason *v5;
  uint64_t v6;
  NSString *composedMessage;
  uint64_t v8;
  NSString *formatString;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *arguments;
  uint64_t v15;
  NSString *exceptionType;
  uint64_t v17;
  NSString *className;
  uint64_t v19;
  NSString *exceptionName;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXCrashDiagnosticObjectiveCExceptionReason;
  v5 = -[MXCrashDiagnosticObjectiveCExceptionReason init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("composedMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatString"));
    v8 = objc_claimAutoreleasedReturnValue();
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("arguments"));
    v13 = objc_claimAutoreleasedReturnValue();
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exceptionType"));
    v15 = objc_claimAutoreleasedReturnValue();
    exceptionType = v5->_exceptionType;
    v5->_exceptionType = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v17 = objc_claimAutoreleasedReturnValue();
    className = v5->_className;
    v5->_className = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exceptionName"));
    v19 = objc_claimAutoreleasedReturnValue();
    exceptionName = v5->_exceptionName;
    v5->_exceptionName = (NSString *)v19;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  NSString *composedMessage;
  NSString *formatString;
  NSArray *arguments;
  NSString *exceptionType;
  NSString *className;
  NSString *exceptionName;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  composedMessage = self->_composedMessage;
  if (composedMessage)
    objc_msgSend(v3, "setObject:forKey:", composedMessage, CFSTR("composedMessage"));
  formatString = self->_formatString;
  if (formatString)
    objc_msgSend(v4, "setObject:forKey:", formatString, CFSTR("formatString"));
  arguments = self->_arguments;
  if (arguments)
    objc_msgSend(v4, "setObject:forKey:", arguments, CFSTR("arguments"));
  exceptionType = self->_exceptionType;
  if (exceptionType)
    objc_msgSend(v4, "setObject:forKey:", exceptionType, CFSTR("exceptionType"));
  className = self->_className;
  if (className)
    objc_msgSend(v4, "setObject:forKey:", className, CFSTR("className"));
  exceptionName = self->_exceptionName;
  if (exceptionName)
    objc_msgSend(v4, "setObject:forKey:", exceptionName, CFSTR("exceptionName"));
  return v4;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXCrashDiagnosticObjectiveCExceptionReason toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)composedMessage
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setComposedMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)formatString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)exceptionType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExceptionType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)className
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClassName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)exceptionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExceptionName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_exceptionType, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_composedMessage, 0);
}

@end
