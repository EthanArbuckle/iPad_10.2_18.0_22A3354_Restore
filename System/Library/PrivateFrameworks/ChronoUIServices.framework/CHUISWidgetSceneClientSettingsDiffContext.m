@implementation CHUISWidgetSceneClientSettingsDiffContext

- (CHUISWidgetSceneClientSettingsDiffContext)initWithPreviousClientSettings:(id)a3 currentClientSettings:(id)a4 transitionContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHUISWidgetSceneClientSettingsDiffContext *v12;
  CHUISWidgetSceneClientSettingsDiffContext *v13;
  uint64_t v14;
  FBSSceneTransitionContext *transitionContext;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CHUISWidgetSceneClientSettingsDiffContext;
  v12 = -[CHUISWidgetSceneClientSettingsDiffContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_prevClientSettings, a3);
    objc_storeStrong((id *)&v13->_currClientSettings, a4);
    v14 = objc_msgSend(v11, "copy");
    transitionContext = v13->_transitionContext;
    v13->_transitionContext = (FBSSceneTransitionContext *)v14;

  }
  return v13;
}

- (CHUISWidgetSceneClientSettings)prevClientSettings
{
  return self->_prevClientSettings;
}

- (CHUISWidgetSceneClientSettings)currClientSettings
{
  return self->_currClientSettings;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_currClientSettings, 0);
  objc_storeStrong((id *)&self->_prevClientSettings, 0);
}

@end
