@implementation LNConnectionPolicySignals

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBundleIdentifier, 0);
}

- (LNConnectionPolicySignals)init
{
  LNConnectionPolicySignals *v2;
  LNConnectionPolicySignals *v3;
  LNConnectionPolicySignals *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNConnectionPolicySignals;
  v2 = -[LNConnectionPolicySignals init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldExecuteActionOnApplicationBasedOnMetadata = 1;
    v4 = v2;
  }

  return v3;
}

- (NSString)preferredBundleIdentifier
{
  return self->_preferredBundleIdentifier;
}

- (void)setPreferredBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldExecuteActionOnApplicationBasedOnMetadata
{
  return self->_shouldExecuteActionOnApplicationBasedOnMetadata;
}

- (void)setShouldExecuteActionOnApplicationBasedOnMetadata:(BOOL)a3
{
  self->_shouldExecuteActionOnApplicationBasedOnMetadata = a3;
}

@end
