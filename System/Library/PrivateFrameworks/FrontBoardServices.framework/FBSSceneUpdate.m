@implementation FBSSceneUpdate

- (id)settingsDiff
{
  return self->_diff;
}

- (id)transitionContext
{
  return self->_context;
}

- (id)settings
{
  return self->_settings;
}

- (id)previousSettings
{
  return self->_previousSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instigatingUpdate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_previousSettings, 0);
  objc_storeStrong((id *)&self->_mutableSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (id)mutableSettings
{
  return self->_mutableSettings;
}

- (void)inspect:(id)a3
{
  (*((void (**)(id, FBSSettings *, FBSSettings *, FBSSettingsDiff *, FBSSceneTransitionContext *))a3 + 2))(a3, self->_settings, self->_previousSettings, self->_diff, self->_context);
}

- (id)parentUpdate
{
  return self->_instigatingUpdate;
}

@end
