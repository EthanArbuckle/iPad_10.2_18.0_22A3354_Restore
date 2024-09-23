@implementation SSSScreenshotItemProvider

- (SSSScreenshotItemProvider)initWithScreenshot:(id)a3
{
  id v4;
  void *v5;
  SSSScreenshotItemProvider *v6;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider placeholderItemForScreenshot:](self, "placeholderItemForScreenshot:", v4));
  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotItemProvider;
  v6 = -[SSSScreenshotItemProvider initWithPlaceholderItem:](&v8, "initWithPlaceholderItem:", v5);
  -[SSSScreenshotItemProvider setScreenshot:](v6, "setScreenshot:", v4);

  return v6;
}

- (id)placeholderItemForScreenshot:(id)a3
{
  id v3;

  v3 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Subclass must override -[SSSScreenshotItemProvider placeholderItemForScreenshot:]"), 0);
  return 0;
}

- (id)item
{
  id v2;

  v2 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Subclass must override -[SSSScreenshotItemProvider item]"), 0);
  return &stru_1000937C8;
}

- (id)nameForScreenshot
{
  NSString *overrideName;
  NSString *v3;
  void *v4;

  overrideName = self->_overrideName;
  if (overrideName)
  {
    v3 = overrideName;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filename"));

  }
  return v3;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider placeholderItemForScreenshot:](self, "placeholderItemForScreenshot:", v4));

  return v5;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Subclass must override -[SSSScreenshotItemProvider activityViewController:subjectForActivityType]"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filename"));

  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Subclass must override -[SSSScreenshotItemProvider activityViewController:attachmentNameForActivityType]"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filename"));

  return v7;
}

- (SSSScreenshot)screenshot
{
  return (SSSScreenshot *)objc_loadWeakRetained((id *)&self->_screenshot);
}

- (void)setScreenshot:(id)a3
{
  objc_storeWeak((id *)&self->_screenshot, a3);
}

- (NSString)overrideName
{
  return self->_overrideName;
}

- (void)setOverrideName:(id)a3
{
  objc_storeStrong((id *)&self->_overrideName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideName, 0);
  objc_destroyWeak((id *)&self->_screenshot);
}

@end
