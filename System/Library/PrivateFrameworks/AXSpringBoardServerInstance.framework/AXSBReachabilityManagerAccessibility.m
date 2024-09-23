@implementation AXSBReachabilityManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBReachabilityManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBPrototypeController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("rootSettings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBReachabilityDomain"), CFSTR("rootSettings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilitySettings"), CFSTR("animationSettings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilitySettings"), CFSTR("yOffsetFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("trackingDampingRatio"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("dampingRatio"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("trackingResponse"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("response"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("trackingRetargetImpulse"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFFluidBehaviorSettings"), CFSTR("retargetImpulse"), "d", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("reachabilityEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("reachabilityModeActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("_notifyObserversReachabilityModeActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("_setKeepAliveTimer"), "v", 0);

}

- (void)_notifyObserversReachabilityModeActive:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  objc_super v22;

  v3 = a3;
  if (a3)
    v5 = ReachableActiveInProgress + 1;
  else
    v5 = ReachableActiveInProgress - 1;
  ReachableActiveInProgress = v5;
  v22.receiver = self;
  v22.super_class = (Class)AXSBReachabilityManagerAccessibility;
  -[AXSBReachabilityManagerAccessibility _notifyObserversReachabilityModeActive:](&v22, sel__notifyObserversReachabilityModeActive_);
  if (v3)
  {
    if (ReachableActiveInProgress >= 1)
    {
      if (-[AXSBReachabilityManagerAccessibility _axReachabilityEnabled](self, "_axReachabilityEnabled"))
      {
        +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "shouldSendReachabilityToggled");

        if (v7)
        {
          -[AXSBReachabilityManagerAccessibility _axDictionaryOfAnimationProperties](self, "_axDictionaryOfAnimationProperties");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x24BDD16E0];
          -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityManager")), "safeValueForKey:", CFSTR("sharedInstance"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "safeBoolForKey:", CFSTR("reachabilityModeActive")));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("enabled"));

          -[AXSBReachabilityManagerAccessibility _axReachabilitySettings](self, "_axReachabilitySettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "safeValueForKey:", CFSTR("yOffsetFactor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bounds");
          objc_msgSend(v13, "numberWithDouble:", v16 * v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("offset"));

          -[AXSBReachabilityManagerAccessibility _axSendReachabilityToggledActionWithPayload:](self, "_axSendReachabilityToggledActionWithPayload:", v8);
LABEL_13:

        }
      }
    }
  }
  else if (ReachabilityActive)
  {
    if (-[AXSBReachabilityManagerAccessibility _axReachabilityEnabled](self, "_axReachabilityEnabled"))
    {
      +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "shouldSendReachabilityToggled");

      if (v21)
      {
        -[AXSBReachabilityManagerAccessibility _axDictionaryOfAnimationProperties](self, "_axDictionaryOfAnimationProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("enabled"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24DDF4EA0, CFSTR("offset"));
        -[AXSBReachabilityManagerAccessibility _axSendReachabilityToggledActionWithPayload:](self, "_axSendReachabilityToggledActionWithPayload:", v8);
        goto LABEL_13;
      }
    }
  }
  ReachabilityActive = v3;
}

- (id)_axReachabilitySettings
{
  return (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityDomain")), "safeValueForKey:", CFSTR("rootSettings"));
}

- (void)_axAddReachabilityProperty:(id)a3 toDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[AXSBReachabilityManagerAccessibility _axReachabilitySettings](self, "_axReachabilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("animationSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

}

- (id)_axDictionaryOfAnimationProperties
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("trackingDampingRatio"), v3);
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("dampingRatio"), v3);
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("trackingResponse"), v3);
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("response"), v3);
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("trackingRetargetImpulse"), v3);
  -[AXSBReachabilityManagerAccessibility _axAddReachabilityProperty:toDictionary:](self, "_axAddReachabilityProperty:toDictionary:", CFSTR("retargetImpulse"), v3);
  return v3;
}

- (void)_axSendReachabilityToggledActionWithPayload:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  int v8;

  v3 = (void *)MEMORY[0x24BEBDB58];
  v4 = a3;
  v5 = objc_msgSend(v3, "_synchronizeDrawingAcrossProcesses");
  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__AXSBReachabilityManagerAccessibility__axSendReachabilityToggledActionWithPayload___block_invoke;
  v7[3] = &__block_descriptor_36_e5_v8__0l;
  v8 = v5;
  objc_msgSend(v6, "reachabilityToggledWithPayload:synchronizationPort:completion:", v4, v5, v7);

}

uint64_t __84__AXSBReachabilityManagerAccessibility__axSendReachabilityToggledActionWithPayload___block_invoke(uint64_t result)
{
  mach_port_name_t v1;

  v1 = *(_DWORD *)(result + 32);
  if (v1)
    return mach_port_deallocate(*MEMORY[0x24BDAEC58], v1);
  return result;
}

- (BOOL)_axReachabilityEnabled
{
  void *v2;
  char v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("reachabilityEnabled"));

  return v3;
}

- (void)_setKeepAliveTimer
{
  objc_super v3;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = self;
    v3.super_class = (Class)AXSBReachabilityManagerAccessibility;
    -[AXSBReachabilityManagerAccessibility _setKeepAliveTimer](&v3, sel__setKeepAliveTimer);
  }
}

@end
