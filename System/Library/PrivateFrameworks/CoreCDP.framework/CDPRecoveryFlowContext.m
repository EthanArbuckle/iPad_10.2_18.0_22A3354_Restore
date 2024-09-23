@implementation CDPRecoveryFlowContext

- (CDPRecoveryFlowContext)initWithCoder:(id)a3
{
  id v4;
  CDPRecoveryFlowContext *v5;
  uint64_t v6;
  CDPContext *context;
  float v8;

  v4 = a3;
  v5 = -[CDPRecoveryFlowContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (CDPContext *)v6;

    v5->_hasPeersForRemoteApproval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasPeersForRemoteApproval"));
    v5->_isWalrusEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isWalrusEnabled"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_rpdProbationDuration"));
    v5->_rpdProbationDuration = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CDPContext *context;
  double rpdProbationDuration;
  id v6;

  context = self->_context;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", context, CFSTR("_context"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasPeersForRemoteApproval, CFSTR("_hasPeersForRemoteApproval"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isWalrusEnabled, CFSTR("_isWalrusEnabled"));
  rpdProbationDuration = self->_rpdProbationDuration;
  *(float *)&rpdProbationDuration = rpdProbationDuration;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("_rpdProbationDuration"), rpdProbationDuration);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CDPRecoveryFlowContext *v4;
  uint64_t v5;
  CDPContext *context;

  v4 = objc_alloc_init(CDPRecoveryFlowContext);
  v5 = -[CDPContext copy](self->_context, "copy");
  context = v4->_context;
  v4->_context = (CDPContext *)v5;

  v4->_hasPeersForRemoteApproval = self->_hasPeersForRemoteApproval;
  v4->_isWalrusEnabled = self->_isWalrusEnabled;
  v4->_rpdProbationDuration = self->_rpdProbationDuration;
  return v4;
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)hasPeersForRemoteApproval
{
  return self->_hasPeersForRemoteApproval;
}

- (void)setHasPeersForRemoteApproval:(BOOL)a3
{
  self->_hasPeersForRemoteApproval = a3;
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (double)rpdProbationDuration
{
  return self->_rpdProbationDuration;
}

- (void)setRpdProbationDuration:(double)a3
{
  self->_rpdProbationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
