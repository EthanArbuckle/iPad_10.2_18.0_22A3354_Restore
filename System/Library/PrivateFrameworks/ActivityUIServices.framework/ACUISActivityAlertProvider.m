@implementation ACUISActivityAlertProvider

- (ACUISActivityAlertProvider)initWithActivityAlertProviding:(id)a3
{
  id v4;
  ACUISActivityAlertProvider *v5;
  uint64_t v6;
  NSString *activityIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *payloadIdentifier;
  ACUISActivityAlertOptions *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ACUISActivityAlertOptions *options;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *body;
  uint64_t v21;
  NSString *deviceIdentifier;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACUISActivityAlertProvider;
  v5 = -[ACUISActivityAlertProvider init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v6;

    objc_msgSend(v4, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "payloadIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    payloadIdentifier = v5->_payloadIdentifier;
    v5->_payloadIdentifier = (NSString *)v10;

    v5->_action = -[ACUISActivityAlertProvider _activityAlertAction:](v5, "_activityAlertAction:", objc_msgSend(v4, "action"));
    v12 = [ACUISActivityAlertOptions alloc];
    objc_msgSend(v4, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ACUISActivityAlertOptions initWithAlertConfiguration:presentationOptions:](v12, "initWithAlertConfiguration:presentationOptions:", v13, v14);
    options = v5->_options;
    v5->_options = (ACUISActivityAlertOptions *)v15;

    objc_msgSend(v4, "title");
    v17 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v17;

    objc_msgSend(v4, "body");
    v19 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v19;

    objc_msgSend(v4, "deviceIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v21;

  }
  return v5;
}

- (int64_t)_activityAlertAction:(int64_t)a3
{
  return a3 != 0;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (int64_t)action
{
  return self->_action;
}

- (ACUISActivityAlertOptions)options
{
  return self->_options;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end
