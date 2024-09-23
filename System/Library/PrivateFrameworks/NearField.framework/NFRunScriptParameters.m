@implementation NFRunScriptParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *seid;
  id v5;

  seid = self->_seid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seid, CFSTR("seid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_checkAIDAllowList, CFSTR("checkAIDAllowList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_AIDAllowList, CFSTR("AIDAllowList"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_initialSelectBeforeRun, CFSTR("initialSelectBeforeRun"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeAPDUDuration, CFSTR("includeAPDUDuration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deactivateAllApps, CFSTR("deactivateAllApps"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("outTotalAPDUExecutionDuration"), self->_outTotalAPDUExecutionDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outFinalSWStatus, CFSTR("outFinalSWStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_toSystemOS, CFSTR("systemOS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableCompletionNotification, CFSTR("disableCompletionNotification"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_outIncompleteExecution, CFSTR("outIncompleteExecution"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_outFailureResponseDetected, CFSTR("outFailureResponseDetected"));

}

- (NFRunScriptParameters)initWithCoder:(id)a3
{
  id v4;
  NFRunScriptParameters *v5;
  uint64_t v6;
  NSString *seid;
  uint64_t v8;
  NSArray *AIDAllowList;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NFRunScriptParameters;
  v5 = -[NFRunScriptParameters init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seid"));
    v6 = objc_claimAutoreleasedReturnValue();
    seid = v5->_seid;
    v5->_seid = (NSString *)v6;

    v5->_checkAIDAllowList = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkAIDAllowList"));
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("AIDAllowList"));
    v8 = objc_claimAutoreleasedReturnValue();
    AIDAllowList = v5->_AIDAllowList;
    v5->_AIDAllowList = (NSArray *)v8;

    v5->_initialSelectBeforeRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initialSelectBeforeRun"));
    v5->_includeAPDUDuration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAPDUDuration"));
    v5->_deactivateAllApps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deactivateAllApps"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("outTotalAPDUExecutionDuration"));
    v5->_outTotalAPDUExecutionDuration = v10;
    v5->_outFinalSWStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outFinalSWStatus"));
    v5->_toSystemOS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemOS"));
    v5->_disableCompletionNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableCompletionNotification"));
    v5->_outIncompleteExecution = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("outIncompleteExecution"));
    v5->_outFailureResponseDetected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("outFailureResponseDetected"));
  }

  return v5;
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (BOOL)checkAIDAllowList
{
  return self->_checkAIDAllowList;
}

- (void)setCheckAIDAllowList:(BOOL)a3
{
  self->_checkAIDAllowList = a3;
}

- (NSArray)AIDAllowList
{
  return self->_AIDAllowList;
}

- (void)setAIDAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_AIDAllowList, a3);
}

- (BOOL)initialSelectBeforeRun
{
  return self->_initialSelectBeforeRun;
}

- (void)setInitialSelectBeforeRun:(BOOL)a3
{
  self->_initialSelectBeforeRun = a3;
}

- (BOOL)includeAPDUDuration
{
  return self->_includeAPDUDuration;
}

- (void)setIncludeAPDUDuration:(BOOL)a3
{
  self->_includeAPDUDuration = a3;
}

- (BOOL)deactivateAllApps
{
  return self->_deactivateAllApps;
}

- (void)setDeactivateAllApps:(BOOL)a3
{
  self->_deactivateAllApps = a3;
}

- (double)outTotalAPDUExecutionDuration
{
  return self->_outTotalAPDUExecutionDuration;
}

- (void)setOutTotalAPDUExecutionDuration:(double)a3
{
  self->_outTotalAPDUExecutionDuration = a3;
}

- (unint64_t)outFinalSWStatus
{
  return self->_outFinalSWStatus;
}

- (void)setOutFinalSWStatus:(unint64_t)a3
{
  self->_outFinalSWStatus = a3;
}

- (BOOL)toSystemOS
{
  return self->_toSystemOS;
}

- (void)setToSystemOS:(BOOL)a3
{
  self->_toSystemOS = a3;
}

- (BOOL)disableCompletionNotification
{
  return self->_disableCompletionNotification;
}

- (void)setDisableCompletionNotification:(BOOL)a3
{
  self->_disableCompletionNotification = a3;
}

- (BOOL)outIncompleteExecution
{
  return self->_outIncompleteExecution;
}

- (void)setOutIncompleteExecution:(BOOL)a3
{
  self->_outIncompleteExecution = a3;
}

- (BOOL)outFailureResponseDetected
{
  return self->_outFailureResponseDetected;
}

- (void)setOutFailureResponseDetected:(BOOL)a3
{
  self->_outFailureResponseDetected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AIDAllowList, 0);
  objc_storeStrong((id *)&self->_seid, 0);
}

+ (id)internalParameterWithParameter:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0DE78E0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "seid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeid:", v6);

  objc_msgSend(v5, "setCheckAIDAllowList:", objc_msgSend(v4, "checkAIDAllowList"));
  objc_msgSend(v4, "AIDAllowList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAIDAllowList:", v7);

  objc_msgSend(v5, "setInitialSelectBeforeRun:", objc_msgSend(v4, "initialSelectBeforeRun"));
  objc_msgSend(v5, "setIncludeAPDUDuration:", objc_msgSend(v4, "includeAPDUDuration"));
  objc_msgSend(v5, "setDeactivateAllApps:", objc_msgSend(v4, "deactivateAllApps"));
  v8 = objc_msgSend(v4, "toSystemOS");

  objc_msgSend(v5, "setToSystemOS:", v8);
  return v5;
}

@end
