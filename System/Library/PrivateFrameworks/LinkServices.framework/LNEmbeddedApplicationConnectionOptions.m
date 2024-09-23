@implementation LNEmbeddedApplicationConnectionOptions

- (LNEmbeddedApplicationConnectionOptions)init
{
  LNEmbeddedApplicationConnectionOptions *v2;
  LNEmbeddedApplicationConnectionOptions *v3;
  LNEmbeddedApplicationConnectionOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
  v2 = -[LNEmbeddedApplicationConnectionOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sceneless = 1;
    v2->_openApplicationPriority = 1;
    v2->_allowsForegroundAppLaunchWhileInCarPlay = 1;
    v2->_actionSource = 0;
    v4 = v2;
  }

  return v3;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unsigned int v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v26;

  v26 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy");
  v6 = CFSTR("Force Unlock");
  if (!v5)
    v6 = CFSTR("Default");
  v7 = v6;
  v8 = -[LNEmbeddedApplicationConnectionOptions sceneless](self, "sceneless");
  v9 = -[LNEmbeddedApplicationConnectionOptions activateSuspended](self, "activateSuspended");
  v10 = -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority");
  if ((unint64_t)(v10 - 1) > 2)
    v11 = CFSTR("None");
  else
    v11 = off_1E45DC068[v10 - 1];
  v12 = v11;
  v13 = -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](self, "allowsForegroundAppLaunchWhileInCarPlay");
  v14 = -[LNConnectionOptions initiatesAudioSession](self, "initiatesAudioSession");
  v15 = -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction");
  v16 = -[LNEmbeddedApplicationConnectionOptions actionSource](self, "actionSource");
  if (v16 > 0xA)
    v17 = CFSTR("Application");
  else
    v17 = *(&off_1E45DBE20 + v16);
  if (v15)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (v14)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (v13)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  if (v9)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (v8)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  v23 = v17;
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p, authenticationPolicy: %@, sceneless: %@, activateSuspended: %@, openApplicationPriority: %@, allowsForegroundAppLaunchWhileInCarPlay: %@, initiatesAudioSession: %@, isCameraCapture:%@, actionSource: %@>"), v4, self, v7, v22, v21, v12, v20, v19, v18, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (BOOL)allowsForegroundAppLaunchWhileInCarPlay
{
  return self->_allowsForegroundAppLaunchWhileInCarPlay;
}

- (unsigned)actionSource
{
  return self->_actionSource;
}

- (BOOL)sceneless
{
  return self->_sceneless;
}

- (int64_t)openApplicationPriority
{
  return self->_openApplicationPriority;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
  v4 = -[LNConnectionOptions copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSceneless:", -[LNEmbeddedApplicationConnectionOptions sceneless](self, "sceneless"));
  objc_msgSend(v4, "setOpenApplicationPriority:", -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority"));
  objc_msgSend(v4, "setAllowsForegroundAppLaunchWhileInCarPlay:", -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](self, "allowsForegroundAppLaunchWhileInCarPlay"));
  objc_msgSend(v4, "setActionSource:", -[LNEmbeddedApplicationConnectionOptions actionSource](self, "actionSource"));
  objc_msgSend(v4, "setIsCameraCaptureAction:", -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction"));
  -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOneShotActionForSpringBoardOnly:", v5);

  -[LNEmbeddedApplicationConnectionOptions oneShotActionExecutorOptionsForSpringBoardOnly](self, "oneShotActionExecutorOptionsForSpringBoardOnly");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOneShotActionExecutorOptionsForSpringBoardOnly:", v6);

  return v4;
}

- (BOOL)isForeground
{
  return 0;
}

- (id)newConnectionAction
{
  void *v3;
  LNOneShotConnectionAction *v4;
  void *v5;
  void *v6;
  void *v7;
  LNOneShotConnectionAction *v8;
  objc_super v10;

  -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [LNOneShotConnectionAction alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEmbeddedApplicationConnectionOptions oneShotActionExecutorOptionsForSpringBoardOnly](self, "oneShotActionExecutorOptionsForSpringBoardOnly");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LNOneShotConnectionAction initWithIdentifier:action:executorOptions:](v4, "initWithIdentifier:action:executorOptions:", v5, v6, v7);

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
    return -[LNConnectionOptions newConnectionAction](&v10, sel_newConnectionAction);
  }
}

- (BOOL)activateSuspended
{
  void *v3;

  -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority") != 2;
  else
    return !-[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction");
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[LNEmbeddedApplicationConnectionOptions sceneless](self, "sceneless");
  v4 = -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority") ^ v3;
  v5 = -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](self, "allowsForegroundAppLaunchWhileInCarPlay");
  v6 = v4 ^ v5 ^ -[LNEmbeddedApplicationConnectionOptions actionSource](self, "actionSource");
  v7 = -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction");
  -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNEmbeddedApplicationConnectionOptions *v4;
  LNEmbeddedApplicationConnectionOptions *v5;
  LNEmbeddedApplicationConnectionOptions *v6;
  _BOOL4 v7;
  int64_t v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  objc_super v19;

  v4 = (LNEmbeddedApplicationConnectionOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    v17 = 1;
    goto LABEL_18;
  }
  v6 = v4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19.receiver = self;
    v19.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
    if (-[LNConnectionOptions isEqual:](&v19, sel_isEqual_, v6))
    {
      v7 = -[LNEmbeddedApplicationConnectionOptions sceneless](self, "sceneless");
      if (v7 == -[LNEmbeddedApplicationConnectionOptions sceneless](v6, "sceneless"))
      {
        v8 = -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority");
        if (v8 == -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](v6, "openApplicationPriority"))
        {
          v9 = -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](self, "allowsForegroundAppLaunchWhileInCarPlay");
          if (v9 == -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](v6, "allowsForegroundAppLaunchWhileInCarPlay"))
          {
            v10 = -[LNEmbeddedApplicationConnectionOptions actionSource](self, "actionSource");
            if (v10 == -[LNEmbeddedApplicationConnectionOptions actionSource](v6, "actionSource"))
            {
              v11 = -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction");
              if (v11 == -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](v6, "isCameraCaptureAction"))
              {
                -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](self, "oneShotActionForSpringBoardOnly");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNEmbeddedApplicationConnectionOptions oneShotActionForSpringBoardOnly](v6, "oneShotActionForSpringBoardOnly");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v12;
                v15 = v13;
                v16 = v15;
                if (v14 == v15)
                {
                  v17 = 1;
                }
                else
                {
                  v17 = 0;
                  if (v14 && v15)
                    v17 = objc_msgSend(v14, "isEqual:", v15);
                }

                goto LABEL_16;
              }
            }
          }
        }
      }
    }
  }
  else
  {

    v6 = 0;
  }
  v17 = 0;
LABEL_16:

LABEL_18:
  return v17;
}

- (void)setSceneless:(BOOL)a3
{
  self->_sceneless = a3;
}

- (void)setOpenApplicationPriority:(int64_t)a3
{
  self->_openApplicationPriority = a3;
}

- (void)setAllowsForegroundAppLaunchWhileInCarPlay:(BOOL)a3
{
  self->_allowsForegroundAppLaunchWhileInCarPlay = a3;
}

- (void)setActionSource:(unsigned __int16)a3
{
  self->_actionSource = a3;
}

- (NSString)actionSourceOverride
{
  return self->_actionSourceOverride;
}

- (void)setActionSourceOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isCameraCaptureAction
{
  return self->_isCameraCaptureAction;
}

- (void)setIsCameraCaptureAction:(BOOL)a3
{
  self->_isCameraCaptureAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSourceOverride, 0);
  objc_storeStrong((id *)&self->_oneShotActionExecutorOptionsForSpringBoardOnly, 0);
  objc_storeStrong((id *)&self->_oneShotActionForSpringBoardOnly, 0);
}

- (void)setOneShotActionForSpringBoardOnly:(id)a3
{
  objc_storeStrong((id *)&self->_oneShotActionForSpringBoardOnly, a3);
}

- (LNAction)oneShotActionForSpringBoardOnly
{
  return self->_oneShotActionForSpringBoardOnly;
}

- (void)setOneShotActionExecutorOptionsForSpringBoardOnly:(id)a3
{
  objc_storeStrong((id *)&self->_oneShotActionExecutorOptionsForSpringBoardOnly, a3);
}

- (LNActionExecutorOptions)oneShotActionExecutorOptionsForSpringBoardOnly
{
  return self->_oneShotActionExecutorOptionsForSpringBoardOnly;
}

@end
