@implementation AXUIReachabilityAnimationBehaviorSettings

- (AXUIReachabilityAnimationBehaviorSettings)initWithPayload:(id)a3
{
  id v4;
  AXUIReachabilityAnimationBehaviorSettings *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXUIReachabilityAnimationBehaviorSettings;
  v5 = -[AXUIReachabilityAnimationBehaviorSettings init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackingDampingRatio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_trackingDampingRatio = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dampingRatio"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_dampingRatio = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackingResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_trackingResponse = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("response"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_response = v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackingRetargetImpulse"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_trackingRetargetImpulse = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retargetImpulse"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_retargetImpulse = v17;

  }
  return v5;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  retstr->var9 = 0.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v5 = 16;
  v6 = 32;
  if (a5 == 1)
    v6 = 24;
  v7 = 48;
  if (a5 == 1)
    v7 = 40;
  v8 = *(double *)((char *)&self->var0 + v7);
  v9 = *(double *)((char *)&self->var0 + v6);
  if (a5 == 1)
    v5 = 8;
  retstr->var0 = *(double *)((char *)&self->var0 + v5);
  retstr->var1 = v9;
  retstr->var10 = v8;
  return self;
}

@end
