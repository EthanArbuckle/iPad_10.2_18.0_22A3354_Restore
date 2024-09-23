@implementation BuddyPasscodeFlow

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BuddyMiscState *v2;
  char v3;

  v2 = -[BuddyPasscodeFlow miscState](self, "miscState", a2, self);
  v3 = !-[BuddyMiscState hasPresentedPasscodeFlow](v2, "hasPresentedPasscodeFlow");

  return v3 & 1;
}

- (void)startFlowAnimated:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyPasscodeFlow *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  -[BuddyPasscodeFlow setHasPreviouslyEnrolledBiometrics:](self, "setHasPreviouslyEnrolledBiometrics:", -[BuddyPasscodeFlow _hasBiometricEnrollment](self, "_hasBiometricEnrollment"));
  v3.receiver = v6;
  v3.super_class = (Class)BuddyPasscodeFlow;
  -[BuddyPasscodeFlow startFlowAnimated:](&v3, "startFlowAnimated:", v4);
}

- (id)classList
{
  id v2;
  BYCapabilities *v3;
  char v4;
  NSArray *v5;
  BYCapabilities *v6;
  unsigned __int8 v7;
  NSArray *v8;
  id v9;
  BOOL v10;
  NSArray *v11;
  objc_super v13;
  objc_super v14;
  char v15;
  id v16;
  objc_super v17;
  objc_super v18;
  SEL v19;
  BuddyPasscodeFlow *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyPasscodeFlow;
  v2 = -[BuddyPasscodeFlow classList](&v18, "classList");

  if (v2)
  {
    v17.receiver = v20;
    v17.super_class = (Class)BuddyPasscodeFlow;
    v21 = -[BuddyPasscodeFlow classList](&v17, "classList");
  }
  else
  {
    v3 = -[BuddyPasscodeFlow capabilities](v20, "capabilities");
    v15 = 0;
    v4 = 0;
    if ((-[BYCapabilities supportsTouchID](v3, "supportsTouchID") & 1) != 0)
    {
      v16 = -[BuddyPasscodeFlow capabilities](v20, "capabilities");
      v15 = 1;
      v4 = objc_msgSend(v16, "isTouchIDEnrolled") ^ 1;
    }
    if ((v15 & 1) != 0)

    if ((v4 & 1) != 0)
    {
      v24 = objc_opt_class(BuddyMesaEnrollmentController);
      v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1);
      -[BuddyPasscodeFlow setClassList:](v20, "setClassList:", v5);

    }
    else
    {
      v6 = -[BuddyPasscodeFlow capabilities](v20, "capabilities");
      v7 = -[BYCapabilities supportsPearl](v6, "supportsPearl");

      if ((v7 & 1) != 0)
      {
        v23 = objc_opt_class(PearlSplashController);
        v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1);
        -[BuddyPasscodeFlow setClassList:](v20, "setClassList:", v8);

      }
    }
    v14.receiver = v20;
    v14.super_class = (Class)BuddyPasscodeFlow;
    v9 = -[BuddyPasscodeFlow classList](&v14, "classList");
    v10 = v9 == 0;

    if (v10)
    {
      v22 = objc_opt_class(BuddyPasscodeController);
      v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1);
      -[BuddyPasscodeFlow setClassList:](v20, "setClassList:", v11);

    }
    v13.receiver = v20;
    v13.super_class = (Class)BuddyPasscodeFlow;
    v21 = -[BuddyPasscodeFlow classList](&v13, "classList");
  }
  return v21;
}

- (id)firstItem
{
  BOOL v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;
  objc_super v9;
  char v10;
  id v11;
  objc_super v12;
  id location[2];
  BuddyPasscodeFlow *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v14 = self;
  location[1] = (id)a2;
  v12.receiver = self;
  v12.super_class = (Class)BuddyPasscodeFlow;
  location[0] = -[BuddyPasscodeFlow firstItem](&v12, "firstItem");
  v10 = 0;
  v2 = 0;
  if (!location[0])
  {
    v11 = -[BuddyPasscodeFlow classList](v14, "classList");
    v10 = 1;
    v3 = objc_msgSend(v11, "firstObject");
    v2 = v3 != (id)objc_opt_class(BuddyPasscodeController);
  }
  if ((v10 & 1) != 0)

  if (v2)
  {
    v4 = -[BuddyPasscodeFlow hasPreviouslyEnrolledBiometrics](v14, "hasPreviouslyEnrolledBiometrics");
    if (!v4 || (BYSetupAssistantHasCompletedInitialRun(v4, v5) & 1) != 0)
    {
      v16 = objc_opt_class(BuddyPasscodeController);
      v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1);
      -[BuddyPasscodeFlow setClassList:](v14, "setClassList:", v7);

    }
    else
    {
      v17 = objc_opt_class(BuddyPasscodeMesaController);
      v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1);
      -[BuddyPasscodeFlow setClassList:](v14, "setClassList:", v6);

    }
    v9.receiver = v14;
    v9.super_class = (Class)BuddyPasscodeFlow;
    v15 = -[BuddyPasscodeFlow firstItem](&v9, "firstItem");
  }
  else
  {
    v15 = location[0];
  }
  objc_storeStrong(location, 0);
  return v15;
}

+ (id)allowedFlowItems
{
  _QWORD v3[4];

  v3[0] = objc_opt_class(BuddyMesaEnrollmentController);
  v3[1] = objc_opt_class(BuddyPasscodeController);
  v3[2] = objc_opt_class(BuddyPasscodeMesaController);
  v3[3] = objc_opt_class(PearlSplashController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4);
}

- (void)flowItemDone:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  char v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  objc_super v16;
  id v17;
  char v18;
  char v19;
  char v20;
  id location[2];
  BuddyPasscodeFlow *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  v3 = location[0];
  v4 = objc_opt_class(BuddyMesaEnrollmentController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = 1;
  if ((isKindOfClass & 1) == 0)
  {
    v7 = location[0];
    v8 = objc_opt_class(PearlSplashController);
    v6 = objc_opt_isKindOfClass(v7, v8);
  }
  v20 = v6 & 1;
  if ((v6 & 1) != 0)
  {
    v19 = 0;
    v9 = -[BuddyPasscodeFlow hasPreviouslyEnrolledBiometrics](v22, "hasPreviouslyEnrolledBiometrics");
    v10 = 0;
    if ((v9 & 1) == 0)
      v10 = -[BuddyPasscodeFlow _hasBiometricEnrollment](v22, "_hasBiometricEnrollment");
    v19 = v10 & 1;
    v18 = 0;
    v11 = -[BuddyPasscodeFlow _hasBiometricEnrollment](v22, "_hasBiometricEnrollment");
    v13 = 0;
    if (v11)
      v13 = BYSetupAssistantHasCompletedInitialRun(v11, v12) ^ 1;
    v18 = v13 & 1;
    v14 = -[BuddyPasscodeFlow classList](v22, "classList");
    v17 = objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v17, "removeObject:", objc_opt_class(BuddyPasscodeMesaController));
    objc_msgSend(v17, "removeObject:", objc_opt_class(BuddyPasscodeController));
    if ((v19 & 1) != 0 || (v18 & 1) != 0)
      objc_msgSend(v17, "addObject:", objc_opt_class(BuddyPasscodeMesaController));
    else
      objc_msgSend(v17, "addObject:", objc_opt_class(BuddyPasscodeController));
    v15 = objc_msgSend(v17, "copy");
    -[BuddyPasscodeFlow setClassList:](v22, "setClassList:", v15);

    objc_storeStrong(&v17, 0);
  }
  v16.receiver = v22;
  v16.super_class = (Class)BuddyPasscodeFlow;
  -[BuddyPasscodeFlow flowItemDone:](&v16, "flowItemDone:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)_hasBiometricEnrollment
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  BYCapabilities *v7;
  char v9;

  v2 = -[BuddyPasscodeFlow capabilities](self, "capabilities");
  v3 = -[BYCapabilities isTouchIDEnrolled](v2, "isTouchIDEnrolled");
  v6 = 0;
  v4 = 1;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyPasscodeFlow capabilities](self, "capabilities");
    v6 = 1;
    v4 = -[BYCapabilities isPearlEnrolled](v7, "isPearlEnrolled");
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BOOL)hasPreviouslyEnrolledBiometrics
{
  return self->_hasPreviouslyEnrolledBiometrics;
}

- (void)setHasPreviouslyEnrolledBiometrics:(BOOL)a3
{
  self->_hasPreviouslyEnrolledBiometrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
