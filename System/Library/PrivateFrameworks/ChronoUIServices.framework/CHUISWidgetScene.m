@implementation CHUISWidgetScene

- (CHSWidget)widget
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWidget *)v3;
}

- (CHSWidget)nullableWidget
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWidget *)v3;
}

- (CHSWidgetMetrics)metrics
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWidgetMetrics *)v3;
}

- (unint64_t)contentType
{
  void *v2;
  unint64_t v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentType");

  return v3;
}

- (unint64_t)colorScheme
{
  void *v2;
  unint64_t v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorScheme");

  return v3;
}

- (unint64_t)widgetPriority
{
  void *v2;
  unint64_t v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "widgetPriority");

  return v3;
}

- (NSString)widgetConfigurationIdentifier
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetConfigurationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)hostIdentifier
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CHUISWidgetVisibilitySettings)visibility
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHUISWidgetVisibilitySettings *)v3;
}

- (BOOL)areAnimationsPaused
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnimationsPaused");

  return v3;
}

- (BOOL)isContentPaused
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentPaused");

  return v3;
}

- (BOOL)shouldVisibleEntrySnapshot
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldVisibleEntrySnapshot");

  return v3;
}

- (BOOL)canAppearInSecureEnvironment
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAppearInSecureEnvironment");

  return v3;
}

- (int64_t)keybagLockPolicy
{
  void *v2;
  int64_t v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keybagLockPolicy");

  return v3;
}

- (BOOL)supportsLowLuminance
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsLowLuminance");

  return v3;
}

- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersUnredactedContentInLowLuminanceEnvironment");

  return v3;
}

- (NSString)additionalSnapshotPresentationContext
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalSnapshotPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)remoteViewControllerClassName
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CHSWidgetTintParameters)tintParameters
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWidgetTintParameters *)v3;
}

- (CHSInlineTextParameters)inlineTextParameters
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineTextParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSInlineTextParameters *)v3;
}

- (BOOL)showsWidgetLabel
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsWidgetLabel");

  return v3;
}

- (BOOL)isInteractionDisabled
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractionDisabled");

  return v3;
}

- (CHSWidgetRenderScheme)renderScheme
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWidgetRenderScheme *)v3;
}

- (unint64_t)clipBehavior
{
  void *v2;
  unint64_t v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clipBehavior");

  return v3;
}

- (BOOL)wantsBaseContentTouchEvents
{
  void *v2;
  char v3;

  -[CHUISWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsBaseContentTouchEvents");

  return v3;
}

- (id)_sceneSettings
{
  void *v2;
  void *v3;

  -[CHUISWidgetScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
