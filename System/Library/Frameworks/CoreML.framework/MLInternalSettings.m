@implementation MLInternalSettings

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1)
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_25445);
  return (id)globalSettings_globalSettings;
}

- (BOOL)restrictNeuralNetworksToUseCPUOnly
{
  return self->_restrictNeuralNetworksToUseCPUOnly;
}

- (BOOL)restrictNeuralNetworksFromUsingANE
{
  return self->_restrictNeuralNetworksFromUsingANE;
}

void __36__MLInternalSettings_globalSettings__block_invoke()
{
  MLInternalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(MLInternalSettings);
  v1 = (void *)globalSettings_globalSettings;
  globalSettings_globalSettings = (uint64_t)v0;

}

- (MLInternalSettings)init
{
  MLInternalSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLInternalSettings;
  result = -[MLInternalSettings init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_restrictNeuralNetworksToUseCPUOnly = 0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MLInternalSettings restrictNeuralNetworksToUseCPUOnly](self, "restrictNeuralNetworksToUseCPUOnly"), CFSTR("restrictNeuralNetworksToUseCPUOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MLInternalSettings restrictNeuralNetworksFromUsingANE](self, "restrictNeuralNetworksFromUsingANE"), CFSTR("restrictNeuralNetworksFromUsingANE"));

}

- (MLInternalSettings)initWithCoder:(id)a3
{
  id v4;
  MLInternalSettings *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLInternalSettings;
  v5 = -[MLInternalSettings init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictNeuralNetworksToUseCPUOnly"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictNeuralNetworksFromUsingANE"));
    -[MLInternalSettings setRestrictNeuralNetworksToUseCPUOnly:](v5, "setRestrictNeuralNetworksToUseCPUOnly:", v6);
    -[MLInternalSettings setRestrictNeuralNetworksFromUsingANE:](v5, "setRestrictNeuralNetworksFromUsingANE:", v7);
  }

  return v5;
}

- (void)setRestrictNeuralNetworksToUseCPUOnly:(BOOL)a3
{
  self->_restrictNeuralNetworksToUseCPUOnly = a3;
}

- (void)setRestrictNeuralNetworksFromUsingANE:(BOOL)a3
{
  self->_restrictNeuralNetworksFromUsingANE = a3;
}

- (BOOL)isNeuralNetworkGPUPathForbidden
{
  return self->_isNeuralNetworkGPUPathForbidden;
}

+ (id)globalSettingsFromSettings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestrictNeuralNetworksFromUsingANE:", objc_msgSend(v3, "restrictNeuralNetworksFromUsingANE"));
  v5 = objc_msgSend(v3, "restrictNeuralNetworksToUseCPUOnly");

  objc_msgSend(v4, "setRestrictNeuralNetworksToUseCPUOnly:", v5);
  return v4;
}

+ (BOOL)deviceHasANE
{
  if (deviceHasANE_onceToken != -1)
    dispatch_once(&deviceHasANE_onceToken, &__block_literal_global_1);
  return deviceHasANE_deviceHasANE;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __34__MLInternalSettings_deviceHasANE__block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    deviceHasANE_deviceHasANE = result;
  }
  return result;
}

@end
