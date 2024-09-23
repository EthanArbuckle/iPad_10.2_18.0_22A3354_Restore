@implementation CRKASMClassicAdHocSwitchReadingRosterProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKASMClassicAdHocSwitchReadingRosterProvider stopObservingCurrentUserProvider](self, "stopObservingCurrentUserProvider");
  v3.receiver = self;
  v3.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  -[CRKASMClassicAdHocSwitchReadingRosterProvider dealloc](&v3, sel_dealloc);
}

- (CRKASMClassicAdHocSwitchReadingRosterProvider)initWithClassKitFacade:(id)a3 rosterProviderGenerator:(id)a4
{
  id v6;
  id v7;
  CRKASMSuspendableRosterProvider *v8;
  CRKASMClassicAdHocSwitchReadingRosterProvider *v9;
  CRKASMClassicAdHocSwitchReadingRosterProvider *v10;
  CRKClassKitCurrentUserProvider *v11;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = -[CRKASMSuspendableRosterProvider initWithGenerator:]([CRKASMSuspendableRosterProvider alloc], "initWithGenerator:", v7);

  v14.receiver = self;
  v14.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  v9 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v14, sel_initWithRosterProvider_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suspendableProvider, v8);
    v11 = -[CRKClassKitCurrentUserProvider initWithClassKitFacade:]([CRKClassKitCurrentUserProvider alloc], "initWithClassKitFacade:", v6);
    currentUserProvider = v10->_currentUserProvider;
    v10->_currentUserProvider = v11;

    -[CRKASMClassicAdHocSwitchReadingRosterProvider startObservingCurrentUserProvider](v10, "startObservingCurrentUserProvider");
    -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserDidChange](v10, "currentUserDidChange");
  }

  return v10;
}

+ (id)currentUserProviderObservedKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("currentUser");
  v3[1] = CFSTR("currentUserFetched");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startObservingCurrentUserProvider
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserProvider](self, "currentUserProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 0, CFSTR("CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)stopObservingCurrentUserProvider
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserProvider](self, "currentUserProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext"))
  {
    -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserDidChange](self, "currentUserDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
    -[CRKASMClassicAdHocSwitchReadingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)currentUserDidChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;

  -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserProvider](self, "currentUserProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentUserFetched");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[CRKASMClassicAdHocSwitchReadingRosterProvider currentUserProvider](self, "currentUserProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithBool:", -[CRKASMClassicAdHocSwitchReadingRosterProvider isClassicAdHocModeEnabledForUser:](self, "isClassicAdHocModeEnabledForUser:", v7));
    v11 = objc_claimAutoreleasedReturnValue();

    -[CRKASMClassicAdHocSwitchReadingRosterProvider previousValueOfAdHocModeEnabled](self, "previousValueOfAdHocModeEnabled");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8 | v11)
    {
      -[CRKASMClassicAdHocSwitchReadingRosterProvider previousValueOfAdHocModeEnabled](self, "previousValueOfAdHocModeEnabled");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v11);

      if ((v10 & 1) == 0)
      {
        -[CRKASMClassicAdHocSwitchReadingRosterProvider setPreviousValueOfAdHocModeEnabled:](self, "setPreviousValueOfAdHocModeEnabled:", v11);
        -[CRKASMClassicAdHocSwitchReadingRosterProvider processAdHocModeEnabled:](self, "processAdHocModeEnabled:", objc_msgSend((id)v11, "BOOLValue"));
      }
    }

  }
}

- (BOOL)isClassicAdHocModeEnabledForUser:(id)a3
{
  void *v4;
  char v5;

  if ((objc_msgSend(a3, "classroomClassicAdHocModeEnabled") & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("CRKForceClassicAdHocModeInsteadOfASMMode"));

  return v5;
}

- (void)processAdHocModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  _CRKLogASM_13();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom classic ad-hoc mode is enabled in ASM. Suspending roster provider.", buf, 2u);
    }

    -[CRKASMClassicAdHocSwitchReadingRosterProvider suspendableProvider](self, "suspendableProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

    -[CRKASMClassicAdHocSwitchReadingRosterProvider overrideIsPopulatedToYES](self, "overrideIsPopulatedToYES");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom classic ad-hoc mode is NOT enabled in ASM. Resuming roster provider.", v9, 2u);
    }

    -[CRKASMClassicAdHocSwitchReadingRosterProvider suspendableProvider](self, "suspendableProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

  }
}

- (void)overrideIsPopulatedToYES
{
  if (!-[CRKASMClassicAdHocSwitchReadingRosterProvider overridingIsPopulatedToYES](self, "overridingIsPopulatedToYES"))
  {
    if (-[CRKASMClassicAdHocSwitchReadingRosterProvider isPopulated](self, "isPopulated"))
    {
      -[CRKASMClassicAdHocSwitchReadingRosterProvider setOverridingIsPopulatedToYES:](self, "setOverridingIsPopulatedToYES:", 1);
    }
    else
    {
      -[CRKASMClassicAdHocSwitchReadingRosterProvider willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("populated"));
      -[CRKASMClassicAdHocSwitchReadingRosterProvider setOverridingIsPopulatedToYES:](self, "setOverridingIsPopulatedToYES:", 1);
      -[CRKASMClassicAdHocSwitchReadingRosterProvider didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("populated"));
    }
  }
}

- (BOOL)isPopulated
{
  objc_super v4;

  if (-[CRKASMClassicAdHocSwitchReadingRosterProvider overridingIsPopulatedToYES](self, "overridingIsPopulatedToYES"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  return -[CRKASMRosterProviderDecoratorBase isPopulated](&v4, sel_isPopulated);
}

- (CRKASMSuspendableRosterProvider)suspendableProvider
{
  return self->_suspendableProvider;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (NSNumber)previousValueOfAdHocModeEnabled
{
  return self->_previousValueOfAdHocModeEnabled;
}

- (void)setPreviousValueOfAdHocModeEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_previousValueOfAdHocModeEnabled, a3);
}

- (BOOL)overridingIsPopulatedToYES
{
  return self->_overridingIsPopulatedToYES;
}

- (void)setOverridingIsPopulatedToYES:(BOOL)a3
{
  self->_overridingIsPopulatedToYES = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousValueOfAdHocModeEnabled, 0);
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
  objc_storeStrong((id *)&self->_suspendableProvider, 0);
}

@end
