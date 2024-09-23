@implementation CBRecordingIndicatorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CBRecordingIndicatorSettings;
  -[CBRecordingIndicatorSettings setDefaultValues](&v3, "setDefaultValues");
  -[CBRecordingIndicatorSettings setSensorType:](self, "setSensorType:", 0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  void *v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PTChoiceRow rowWithTitle:valueKeyPath:](PTChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Sensor Type"), CFSTR("sensorType")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "possibleValues:titles:", &off_100078F40, &off_100078F28));

  v15 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v4, CFSTR("Override Sensor State")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:](PTRestoreDefaultSettingsRowAction, "actionWithSettingsKeyPath:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PTButtonRow rowWithTitle:action:](PTButtonRow, "rowWithTitle:action:", CFSTR("Restore Defaults"), v6));

  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v8));

  v13[0] = v5;
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", 0, v10));

  return v11;
}

- (int64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int64_t)a3
{
  self->_sensorType = a3;
}

@end
