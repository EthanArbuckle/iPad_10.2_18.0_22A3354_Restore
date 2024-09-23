@implementation CNSensitiveContentAnalysisManager

- (BOOL)shouldShowUIForPosterWithSensitiveContent:(BOOL)a3 forContact:(id)a4
{
  if (!a3 || (objc_msgSend(a4, "overrideSensitiveContent") & 1) != 0)
    return 0;
  if (-[CNSensitiveContentAnalysisManager isEntitledForSensitiveContentUI](self, "isEntitledForSensitiveContentUI"))
    return -[CNSensitiveContentAnalysisManager isSensitiveContentAnalysisEnabled](self, "isSensitiveContentAnalysisEnabled");
  return 1;
}

+ (id)defaultManager
{
  id v2;
  CNSensitiveContentUIEntitlementVerifier *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(CNSensitiveContentUIEntitlementVerifier);
  v4 = (void *)objc_msgSend(v2, "initWithEntitlementVerifier:", v3);

  return v4;
}

- (CNSensitiveContentAnalysisManager)initWithEntitlementVerifier:(id)a3
{
  CNSensitiveContentAnalysisManager *v3;
  CNSensitiveContentUIEntitlementVerifier *v4;
  CNSensitiveContentUIEntitlementVerifier *entitlementVerifier;
  SCSensitivityAnalyzer *v6;
  SCSensitivityAnalyzer *sensitivityAnalyzer;
  CNSensitiveContentAnalysisManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentAnalysisManager;
  v3 = -[CNSensitiveContentAnalysisManager init](&v10, sel_init, a3);
  if (v3)
  {
    v4 = objc_alloc_init(CNSensitiveContentUIEntitlementVerifier);
    entitlementVerifier = v3->_entitlementVerifier;
    v3->_entitlementVerifier = v4;

    v6 = (SCSensitivityAnalyzer *)objc_alloc_init(MEMORY[0x1E0CD7378]);
    sensitivityAnalyzer = v3->_sensitivityAnalyzer;
    v3->_sensitivityAnalyzer = v6;

    v8 = v3;
  }

  return v3;
}

- (BOOL)shouldShowSensitiveContentUI
{
  _BOOL4 v3;

  v3 = -[CNSensitiveContentAnalysisManager isEntitledForSensitiveContentUI](self, "isEntitledForSensitiveContentUI");
  if (v3)
    LOBYTE(v3) = -[CNSensitiveContentAnalysisManager isSensitiveContentAnalysisEnabled](self, "isSensitiveContentAnalysisEnabled");
  return v3;
}

- (BOOL)isEntitledForSensitiveContentUI
{
  void *v2;
  char v3;

  -[CNSensitiveContentAnalysisManager entitlementVerifier](self, "entitlementVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowSensitiveContentUI");

  return v3;
}

- (BOOL)canShowBlockContactUI
{
  void *v2;
  char v3;

  -[CNSensitiveContentAnalysisManager entitlementVerifier](self, "entitlementVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processHasCommunicationFilterEntitlements");

  return v3;
}

- (BOOL)isSensitiveContentAnalysisEnabled
{
  void *v2;
  BOOL v3;

  -[CNSensitiveContentAnalysisManager sensitivityAnalyzer](self, "sensitivityAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "analysisPolicy") != 0;

  return v3;
}

- (BOOL)requiresDescriptiveInterventions
{
  void *v2;
  BOOL v3;

  -[CNSensitiveContentAnalysisManager sensitivityAnalyzer](self, "sensitivityAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "analysisPolicy") == 2;

  return v3;
}

- (CNSensitiveContentUIEntitlementVerifier)entitlementVerifier
{
  return self->_entitlementVerifier;
}

- (void)setEntitlementVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementVerifier, a3);
}

- (SCSensitivityAnalyzer)sensitivityAnalyzer
{
  return self->_sensitivityAnalyzer;
}

- (void)setSensitivityAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_sensitivityAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivityAnalyzer, 0);
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
}

@end
