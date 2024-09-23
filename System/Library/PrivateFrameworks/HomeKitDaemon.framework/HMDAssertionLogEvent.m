@implementation HMDAssertionLogEvent

- (HMDAssertionLogEvent)initWithReason:(id)a3
{
  id v4;
  HMDAssertionLogEvent *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSString *description;
  objc_super v11;
  uint64_t v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAssertionLogEvent;
  v5 = -[HMMLogEvent init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v4, &v12);
    description = v5->_description;
    v5->_description = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAssertionLogEvent reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEB3588]);

  -[HMDAssertionLogEvent description](self, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BEB3568]);

}

@end
