@implementation IRRuleSystemState

- (IRRuleSystemState)initWithAttributeKey:(id)a3
{
  id v5;
  IRRuleSystemState *v6;
  IRRuleSystemState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRRuleSystemState;
  v6 = -[IRRuleSystemState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributeKey, a3);

  return v7;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  id v10;
  id v11;
  IRRuleOutputSystemState *v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = -[IRRuleOutput initWithRule:]([IRRuleOutputSystemState alloc], "initWithRule:", self);
  -[IRRuleSystemState _attributeValueForAttributeKey:systemState:miloPrediction:](self, "_attributeValueForAttributeKey:systemState:miloPrediction:", self->_attributeKey, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRRuleOutputSystemState setValue:](v12, "setValue:", v13);
  return v12;
}

- (id)_attributeValueForAttributeKey:(id)a3 systemState:(id)a4 miloPrediction:(id)a5
{
  id v8;
  id v9;
  id v10;
  IRRuleOutputEvaluation *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(IRRuleOutputEvaluation);
  if (!objc_msgSend(v8, "isEqual:", CFSTR("kIRRuleSystemStateHeadsetRoutedOrAirPodsPredictedToBeRoutedKey")))
  {
    if (objc_msgSend(v8, "isEqual:", CFSTR("kIRRuleSystemStateOutsideOfAppInFocusWindow")))
    {
      -[IRRuleOutputEvaluation setHasBoolean:](v11, "setHasBoolean:", 1);
      v13 = objc_msgSend(v9, "appInFocusWindowValid") ^ 1;
    }
    else if (objc_msgSend(v8, "isEqual:", CFSTR("kIRRuleSystemStateMiLoAvailableKey")))
    {
      -[IRRuleOutputEvaluation setHasBoolean:](v11, "setHasBoolean:", 1);
      v13 = objc_msgSend(v10, "canUse");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqual:", CFSTR("kIRRuleSystemStateHomeLOIKey")))
        goto LABEL_10;
      -[IRRuleOutputEvaluation setHasBoolean:](v11, "setHasBoolean:", 1);
      v13 = objc_msgSend(v9, "locationSemanticUserSpecificPlaceType") == 1;
    }
    -[IRRuleOutputEvaluation setBoolean:](v11, "setBoolean:", v13);
    goto LABEL_10;
  }
  -[IRRuleSystemState _headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:](self, "_headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:", v9);
  v12 = objc_claimAutoreleasedReturnValue();

  v11 = (IRRuleOutputEvaluation *)v12;
LABEL_10:

  return v11;
}

- (id)_headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:(id)a3
{
  id v3;
  IRRuleOutputEvaluation *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(IRRuleOutputEvaluation);
  objc_msgSend(v3, "outputDeviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IRRuleOutputEvaluation setHasBoolean:](v4, "setHasBoolean:", 1);
  }
  else
  {
    objc_msgSend(v3, "predictedOutputDeviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleOutputEvaluation setHasBoolean:](v4, "setHasBoolean:", v6 != 0);

  }
  if (objc_msgSend(v3, "outputDeviceType") == 1
    && (objc_msgSend(v3, "outputDeviceSubType") == 3 || objc_msgSend(v3, "outputDeviceSubType") == 2)
    || objc_msgSend(v3, "predictedOutputDeviceType") == 1)
  {
    -[IRRuleOutputEvaluation setBoolean:](v4, "setBoolean:", 1);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeKey, 0);
}

@end
