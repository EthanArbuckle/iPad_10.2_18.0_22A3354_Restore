@implementation CHUISWatchComplicationsWidgetScene

- (int64_t)cornerPosition
{
  void *v2;
  int64_t v3;

  -[CHUISWatchComplicationsWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cornerPosition");

  return v3;
}

- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics
{
  void *v2;
  void *v3;

  -[CHUISWatchComplicationsWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "curvedLabelMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHSWatchComplicationsCurvedLabelMetrics *)v3;
}

- (CGPoint)bezelContentCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CHUISWatchComplicationsWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bezelContentCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)includeAccessoryViews
{
  void *v2;
  char v3;

  -[CHUISWatchComplicationsWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeAccessoryViews");

  return v3;
}

- (BOOL)generateSnapshotMetadata
{
  void *v2;
  char v3;

  -[CHUISWatchComplicationsWidgetScene _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "generateSnapshotMetadata");

  return v3;
}

- (id)_sceneSettings
{
  void *v2;
  void *v3;

  -[CHUISWatchComplicationsWidgetScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
