@implementation HMDLogEventCoreDataSignificantEvent

- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3
{
  HMDLogEventCoreDataSignificantEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDLogEventCoreDataSignificantEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_reason = a3;
  return result;
}

- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3 author:(unint64_t)a4
{
  HMDLogEventCoreDataSignificantEvent *v5;
  HMDLogEventCoreDataSignificantEvent *v6;
  __CFString *v7;

  v5 = -[HMDLogEventCoreDataSignificantEvent initWithReason:](self, "initWithReason:", a3);
  v6 = v5;
  if (a4 - 2 > 9)
    v7 = CFSTR("HMD.Unknown");
  else
    v7 = off_24E790D20[a4 - 2];
  objc_storeStrong((id *)&v5->_context, v7);

  return v6;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)extraContext
{
  return self->_extraContext;
}

- (void)setExtraContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[HMDLogEventCoreDataSignificantEvent reason](self, "reason");
  if (v4 > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = off_24E79BB00[v4];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEB3578]);
  -[HMDLogEventCoreDataSignificantEvent context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BEB3588]);
  -[HMDLogEventCoreDataSignificantEvent extraContext](self, "extraContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BEB3568]);

}

- (NSString)diagnosticReportEventType
{
  return (NSString *)CFSTR("CoreData");
}

@end
