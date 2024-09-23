@implementation ASFAssistantMetrics

+ (id)sharedMetrics
{
  if (sharedMetrics_onceToken != -1)
    dispatch_once(&sharedMetrics_onceToken, &__block_literal_global);
  return (id)sharedMetrics_sSharedMetrics;
}

void __36__ASFAssistantMetrics_sharedMetrics__block_invoke()
{
  ASFAssistantMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(ASFAssistantMetrics);
  v1 = (void *)sharedMetrics_sSharedMetrics;
  sharedMetrics_sSharedMetrics = (uint64_t)v0;

}

+ (void)didVisit
{
  id v2;

  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logVisit");

}

+ (void)didEnableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEnableSiriConfirmed:source:", v4, v5);

}

+ (void)didDisableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logDisableSiriConfirmed:source:", v4, v5);

}

+ (void)didStartEnrollment:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logStartEnrollment:", v3);

}

+ (void)didToggle:(id)a3 on:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logToggle:on:", v5, v4);

}

+ (void)didDetailVisit:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logDetailVisit:", v3);

}

+ (void)didDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[ASFAssistantMetrics sharedMetrics](ASFAssistantMetrics, "sharedMetrics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logDetailToggle:bundleId:on:", v8, v7, v5);

}

- (id)__onOffProperty
{
  PETEventProperty *onOffProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  onOffProperty = self->_onOffProperty;
  if (!onOffProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("on");
    v9[1] = CFSTR("off");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("val"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_onOffProperty;
    self->_onOffProperty = v6;

    onOffProperty = self->_onOffProperty;
  }
  return onOffProperty;
}

- (id)__confirmedTrueFalseProperty
{
  PETEventProperty *confirmedTrueFalseProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  confirmedTrueFalseProperty = self->_confirmedTrueFalseProperty;
  if (!confirmedTrueFalseProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("true");
    v9[1] = CFSTR("false");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("conf"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_confirmedTrueFalseProperty;
    self->_confirmedTrueFalseProperty = v6;

    confirmedTrueFalseProperty = self->_confirmedTrueFalseProperty;
  }
  return confirmedTrueFalseProperty;
}

- (id)__toggleTrackerNameProperty
{
  PETEventProperty *toggleTrackerNameProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  toggleTrackerNameProperty = self->_toggleTrackerNameProperty;
  if (!toggleTrackerNameProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("HeySiri");
    v9[1] = CFSTR("HardwareButton");
    v9[2] = CFSTR("Lockscreen");
    v9[3] = CFSTR("Search");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("name"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_toggleTrackerNameProperty;
    self->_toggleTrackerNameProperty = v6;

    toggleTrackerNameProperty = self->_toggleTrackerNameProperty;
  }
  return toggleTrackerNameProperty;
}

- (id)__detailToggleTrackerNameProperty
{
  PETEventProperty *detailToggleTrackerNameProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  detailToggleTrackerNameProperty = self->_detailToggleTrackerNameProperty;
  if (!detailToggleTrackerNameProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("sirisearch");
    v9[1] = CFSTR("sirikit");
    v9[2] = CFSTR("foundinapps");
    v9[3] = CFSTR("portraittopics");
    v9[4] = CFSTR("inAppShow");
    v9[5] = CFSTR("inAppLearn");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("name"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_detailToggleTrackerNameProperty;
    self->_detailToggleTrackerNameProperty = v6;

    detailToggleTrackerNameProperty = self->_detailToggleTrackerNameProperty;
  }
  return detailToggleTrackerNameProperty;
}

- (id)__siriSourceProperty
{
  PETEventProperty *siriSourceProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  siriSourceProperty = self->_siriSourceProperty;
  if (!siriSourceProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("HeySiri");
    v9[1] = CFSTR("HardwareButton");
    v9[2] = CFSTR("Unknown");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("source"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_siriSourceProperty;
    self->_siriSourceProperty = v6;

    siriSourceProperty = self->_siriSourceProperty;
  }
  return siriSourceProperty;
}

- (id)__foundInAppsProperty
{
  PETEventProperty *foundInAppsProperty;
  id PETEventPropertyClass;
  void *v5;
  PETEventProperty *v6;
  PETEventProperty *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  foundInAppsProperty = self->_foundInAppsProperty;
  if (!foundInAppsProperty)
  {
    PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = CFSTR("com.apple.Maps");
    v9[1] = CFSTR("com.apple.mobilemail");
    v9[2] = CFSTR("com.apple.MobileSMS");
    v9[3] = CFSTR("com.apple.news");
    v9[4] = CFSTR("com.apple.MobileAddressBook");
    v9[5] = CFSTR("com.apple.mobilecal");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PETEventPropertyClass, "propertyWithName:possibleValues:", CFSTR("bundleId"), v5);
    v6 = (PETEventProperty *)objc_claimAutoreleasedReturnValue();
    v7 = self->_foundInAppsProperty;
    self->_foundInAppsProperty = v6;

    foundInAppsProperty = self->_foundInAppsProperty;
  }
  return foundInAppsProperty;
}

- (id)__visitTracker
{
  PETScalarEventTracker *visitTracker;
  PETScalarEventTracker *v4;
  PETScalarEventTracker *v5;

  visitTracker = self->_visitTracker;
  if (!visitTracker)
  {
    v4 = (PETScalarEventTracker *)objc_msgSend(objc_alloc((Class)getPETScalarEventTrackerClass()), "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("Visit"), MEMORY[0x24BDBD1A8]);
    v5 = self->_visitTracker;
    self->_visitTracker = v4;

    visitTracker = self->_visitTracker;
  }
  return visitTracker;
}

- (id)__enableSiriTracker
{
  PETScalarEventTracker *enableSiriTracker;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PETScalarEventTracker *v8;
  PETScalarEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  enableSiriTracker = self->_enableSiriTracker;
  if (!enableSiriTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __siriSourceProperty](self, "__siriSourceProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[ASFAssistantMetrics __confirmedTrueFalseProperty](self, "__confirmedTrueFalseProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("EnableSiri"), v7);
    v9 = self->_enableSiriTracker;
    self->_enableSiriTracker = v8;

    enableSiriTracker = self->_enableSiriTracker;
  }
  return enableSiriTracker;
}

- (id)__disableSiriTracker
{
  PETScalarEventTracker *disableSiriTracker;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PETScalarEventTracker *v8;
  PETScalarEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  disableSiriTracker = self->_disableSiriTracker;
  if (!disableSiriTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __siriSourceProperty](self, "__siriSourceProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[ASFAssistantMetrics __confirmedTrueFalseProperty](self, "__confirmedTrueFalseProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DisableSiri"), v7);
    v9 = self->_disableSiriTracker;
    self->_disableSiriTracker = v8;

    disableSiriTracker = self->_disableSiriTracker;
  }
  return disableSiriTracker;
}

- (id)__toggleTracker
{
  PETScalarEventTracker *toggleTracker;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PETScalarEventTracker *v8;
  PETScalarEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  toggleTracker = self->_toggleTracker;
  if (!toggleTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __toggleTrackerNameProperty](self, "__toggleTrackerNameProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[ASFAssistantMetrics __onOffProperty](self, "__onOffProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("Toggle"), v7);
    v9 = self->_toggleTracker;
    self->_toggleTracker = v8;

    toggleTracker = self->_toggleTracker;
  }
  return toggleTracker;
}

- (id)__startEnrollmentTracker
{
  PETScalarEventTracker *startEnrollmentTracker;
  id v4;
  void *v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  startEnrollmentTracker = self->_startEnrollmentTracker;
  if (!startEnrollmentTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __confirmedTrueFalseProperty](self, "__confirmedTrueFalseProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("VoiceEnroll"), v6);
    v8 = self->_startEnrollmentTracker;
    self->_startEnrollmentTracker = v7;

    startEnrollmentTracker = self->_startEnrollmentTracker;
  }
  return startEnrollmentTracker;
}

- (id)__detailVisitTracker
{
  PETScalarEventTracker *detailVisitTracker;
  PETScalarEventTracker *v4;
  PETScalarEventTracker *v5;

  detailVisitTracker = self->_detailVisitTracker;
  if (!detailVisitTracker)
  {
    v4 = (PETScalarEventTracker *)objc_msgSend(objc_alloc((Class)getPETScalarEventTrackerClass()), "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DetailVisit"), MEMORY[0x24BDBD1A8]);
    v5 = self->_detailVisitTracker;
    self->_detailVisitTracker = v4;

    detailVisitTracker = self->_detailVisitTracker;
  }
  return detailVisitTracker;
}

- (id)__detailVisitFoundInAppsTracker
{
  PETScalarEventTracker *detailVisitFoundInAppsTracker;
  id v4;
  void *v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  detailVisitFoundInAppsTracker = self->_detailVisitFoundInAppsTracker;
  if (!detailVisitFoundInAppsTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __foundInAppsProperty](self, "__foundInAppsProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DetailVisitFIA"), v6);
    v8 = self->_detailVisitFoundInAppsTracker;
    self->_detailVisitFoundInAppsTracker = v7;

    detailVisitFoundInAppsTracker = self->_detailVisitFoundInAppsTracker;
  }
  return detailVisitFoundInAppsTracker;
}

- (id)__detailToggleFoundInAppsTracker
{
  PETScalarEventTracker *detailToggleFoundInAppsTracker;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PETScalarEventTracker *v9;
  PETScalarEventTracker *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  detailToggleFoundInAppsTracker = self->_detailToggleFoundInAppsTracker;
  if (!detailToggleFoundInAppsTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __detailToggleTrackerNameProperty](self, "__detailToggleTrackerNameProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASFAssistantMetrics __foundInAppsProperty](self, "__foundInAppsProperty", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    -[ASFAssistantMetrics __onOffProperty](self, "__onOffProperty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DetailToggleFIA"), v8);
    v10 = self->_detailToggleFoundInAppsTracker;
    self->_detailToggleFoundInAppsTracker = v9;

    detailToggleFoundInAppsTracker = self->_detailToggleFoundInAppsTracker;
  }
  return detailToggleFoundInAppsTracker;
}

- (id)__detailToggleSearchTracker
{
  PETScalarEventTracker *detailToggleSearchTracker;
  id v4;
  void *v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  detailToggleSearchTracker = self->_detailToggleSearchTracker;
  if (!detailToggleSearchTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __onOffProperty](self, "__onOffProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DetailToggleSearch"), v6);
    v8 = self->_detailToggleSearchTracker;
    self->_detailToggleSearchTracker = v7;

    detailToggleSearchTracker = self->_detailToggleSearchTracker;
  }
  return detailToggleSearchTracker;
}

- (id)__detailToggleSiriKitTracker
{
  PETScalarEventTracker *detailToggleSiriKitTracker;
  id v4;
  void *v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  detailToggleSiriKitTracker = self->_detailToggleSiriKitTracker;
  if (!detailToggleSiriKitTracker)
  {
    v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    -[ASFAssistantMetrics __onOffProperty](self, "__onOffProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("SiriSettings"), CFSTR("DetailToggleSiriKit"), v6);
    v8 = self->_detailToggleSiriKitTracker;
    self->_detailToggleSiriKitTracker = v7;

    detailToggleSiriKitTracker = self->_detailToggleSiriKitTracker;
  }
  return detailToggleSiriKitTracker;
}

- (void)logVisit
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __31__ASFAssistantMetrics_logVisit__block_invoke;
  v2[3] = &unk_2508182C0;
  v2[4] = self;
  doAsync(v2);
}

void __31__ASFAssistantMetrics_logVisit__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "__visitTracker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trackEventWithPropertyValues:", MEMORY[0x24BDBD1A8]);

}

- (void)logEnableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ASFAssistantMetrics_logEnableSiriConfirmed_source___block_invoke;
  v8[3] = &unk_2508182E8;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  doAsync(v8);

}

void __53__ASFAssistantMetrics_logEnableSiriConfirmed_source___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__siriSourceProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidValue:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__enableSiriTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
    v7[0] = *(_QWORD *)(a1 + 40);
    v7[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackEventWithPropertyValues:", v6);

  }
}

- (void)logDisableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ASFAssistantMetrics_logDisableSiriConfirmed_source___block_invoke;
  v8[3] = &unk_2508182E8;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  doAsync(v8);

}

void __54__ASFAssistantMetrics_logDisableSiriConfirmed_source___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__siriSourceProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidValue:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__disableSiriTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
    v7[0] = *(_QWORD *)(a1 + 40);
    v7[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackEventWithPropertyValues:", v6);

  }
}

- (void)logStartEnrollment:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__ASFAssistantMetrics_logStartEnrollment___block_invoke;
  v3[3] = &unk_250818310;
  v3[4] = self;
  v4 = a3;
  doAsync(v3);
}

void __42__ASFAssistantMetrics_logStartEnrollment___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__startEnrollmentTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("true");
  if (!*(_BYTE *)(a1 + 40))
    v3 = CFSTR("false");
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEventWithPropertyValues:", v4);

}

- (void)logToggle:(id)a3 on:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__ASFAssistantMetrics_logToggle_on___block_invoke;
  v8[3] = &unk_2508182E8;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  doAsync(v8);

}

void __36__ASFAssistantMetrics_logToggle_on___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__toggleTrackerNameProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidValue:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__toggleTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
      v5 = CFSTR("on");
    else
      v5 = CFSTR("off");
    v7[0] = *(_QWORD *)(a1 + 40);
    v7[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackEventWithPropertyValues:", v6);

  }
}

- (void)logDetailVisit:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__ASFAssistantMetrics_logDetailVisit___block_invoke;
  v6[3] = &unk_250818338;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  doAsync(v6);

}

void __38__ASFAssistantMetrics_logDetailVisit___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__foundInAppsProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidValue:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "__detailVisitFoundInAppsTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackEventWithPropertyValues:", v6);

  }
  else
  {
    objc_msgSend(v4, "__detailVisitTracker");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackEventWithPropertyValues:", MEMORY[0x24BDBD1A8]);

  }
}

- (void)logDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__ASFAssistantMetrics_logDetailToggle_bundleId_on___block_invoke;
  v12[3] = &unk_250818360;
  v12[4] = self;
  v13 = v9;
  v14 = v8;
  v15 = a5;
  v10 = v8;
  v11 = v9;
  doAsync(v12);

}

void __51__ASFAssistantMetrics_logDetailToggle_bundleId_on___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  const __CFString **v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "__foundInAppsProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidValue:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__detailToggleFoundInAppsTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = v5;
    v6 = CFSTR("on");
    if (!*(_BYTE *)(a1 + 56))
      v6 = CFSTR("off");
    v17 = v6;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = (const __CFString **)&v15;
    v9 = 3;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("sirikit")))
    {
      objc_msgSend(*(id *)(a1 + 32), "__detailToggleSiriKitTracker");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("on");
      if (!*(_BYTE *)(a1 + 56))
        v10 = CFSTR("off");
      v14 = v10;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = &v14;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("sirisearch")))
        return;
      objc_msgSend(*(id *)(a1 + 32), "__detailToggleSearchTracker");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("on");
      if (!*(_BYTE *)(a1 + 56))
        v11 = CFSTR("off");
      v13 = v11;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = &v13;
    }
    v9 = 1;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailToggleSearchTracker, 0);
  objc_storeStrong((id *)&self->_detailToggleSiriKitTracker, 0);
  objc_storeStrong((id *)&self->_detailToggleFoundInAppsTracker, 0);
  objc_storeStrong((id *)&self->_detailVisitFoundInAppsTracker, 0);
  objc_storeStrong((id *)&self->_detailVisitTracker, 0);
  objc_storeStrong((id *)&self->_toggleTracker, 0);
  objc_storeStrong((id *)&self->_startEnrollmentTracker, 0);
  objc_storeStrong((id *)&self->_disableSiriTracker, 0);
  objc_storeStrong((id *)&self->_enableSiriTracker, 0);
  objc_storeStrong((id *)&self->_visitTracker, 0);
  objc_storeStrong((id *)&self->_foundInAppsProperty, 0);
  objc_storeStrong((id *)&self->_siriSourceProperty, 0);
  objc_storeStrong((id *)&self->_confirmedTrueFalseProperty, 0);
  objc_storeStrong((id *)&self->_onOffProperty, 0);
  objc_storeStrong((id *)&self->_detailToggleTrackerNameProperty, 0);
  objc_storeStrong((id *)&self->_toggleTrackerNameProperty, 0);
}

@end
