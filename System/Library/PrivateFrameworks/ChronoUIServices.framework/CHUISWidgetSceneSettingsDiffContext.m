@implementation CHUISWidgetSceneSettingsDiffContext

- (CHUISWidgetSceneSettingsDiffContext)initWithPreviousSettings:(id)a3 currentSettings:(id)a4 transitionContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHUISWidgetSceneSettingsDiffContext *v12;
  CHUISWidgetSceneSettingsDiffContext *v13;
  uint64_t v14;
  FBSSceneTransitionContext *transitionContext;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CHUISWidgetSceneSettingsDiffContext;
  v12 = -[CHUISWidgetSceneSettingsDiffContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_prevSettings, a3);
    objc_storeStrong((id *)&v13->_currSettings, a4);
    v14 = objc_msgSend(v11, "copy");
    transitionContext = v13->_transitionContext;
    v13->_transitionContext = (FBSSceneTransitionContext *)v14;

  }
  return v13;
}

- (CHUISWidgetSceneSettings)prevSettings
{
  return self->_prevSettings;
}

- (CHUISWidgetSceneSettings)currSettings
{
  return self->_currSettings;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_currSettings, 0);
  objc_storeStrong((id *)&self->_prevSettings, 0);
}

@end
