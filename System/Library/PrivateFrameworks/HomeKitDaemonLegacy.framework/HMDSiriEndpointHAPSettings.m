@implementation HMDSiriEndpointHAPSettings

- (NSNumber)siriEnable
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSiriEnable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)siriListening
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSiriListening:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)siriTouchToUse
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSiriTouchToUse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)siriLightOnUse
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSiriLightOnUse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)siriEndpointVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSiriEndpointVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)siriEngineVersion
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSiriEngineVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)activeIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActiveIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)manuallyDisabled
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setManuallyDisabled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)multifunctionButton
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMultifunctionButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)assistantsUpdated
{
  return self->_assistantsUpdated;
}

- (void)setAssistantsUpdated:(BOOL)a3
{
  self->_assistantsUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multifunctionButton, 0);
  objc_storeStrong((id *)&self->_manuallyDisabled, 0);
  objc_storeStrong((id *)&self->_activeIdentifier, 0);
  objc_storeStrong((id *)&self->_siriEngineVersion, 0);
  objc_storeStrong((id *)&self->_siriEndpointVersion, 0);
  objc_storeStrong((id *)&self->_siriLightOnUse, 0);
  objc_storeStrong((id *)&self->_siriTouchToUse, 0);
  objc_storeStrong((id *)&self->_siriListening, 0);
  objc_storeStrong((id *)&self->_siriEnable, 0);
}

@end
