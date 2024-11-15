@implementation CBAppClientSettingObserverContext

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (UIApplicationSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (UIApplicationSceneClientSettings)oldClientSettings
{
  return self->_oldClientSettings;
}

- (void)setOldClientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_oldClientSettings, a3);
}

- (UIApplicationSceneClientSettings)updatedClientSettings
{
  return self->_updatedClientSettings;
}

- (void)setUpdatedClientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_updatedClientSettings, a3);
}

- (FBSSceneTransitionContext)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_updatedClientSettings, 0);
  objc_storeStrong((id *)&self->_oldClientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
