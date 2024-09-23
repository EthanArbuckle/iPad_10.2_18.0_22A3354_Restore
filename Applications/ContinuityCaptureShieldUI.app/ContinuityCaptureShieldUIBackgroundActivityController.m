@implementation ContinuityCaptureShieldUIBackgroundActivityController

- (ContinuityCaptureShieldUIBackgroundActivityController)initWithBackgroundActivityIdentifier:(id)a3
{
  id v5;
  ContinuityCaptureShieldUIBackgroundActivityController *v6;
  ContinuityCaptureShieldUIBackgroundActivityController *v7;
  NSString *v8;
  NSString *backgroundActivityIdentifier;
  STBackgroundActivitiesStatusDomainPublisher *v10;
  STBackgroundActivitiesStatusDomainPublisher *publisher;
  void *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ContinuityCaptureShieldUIBackgroundActivityController;
  v6 = -[ContinuityCaptureShieldUIBackgroundActivityController init](&v14, "init");
  v7 = v6;
  if (!v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("ContinuityCaptureShieldUIBackgroundActivityController.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundActivityIdentifier"));

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    v8 = (NSString *)objc_msgSend(v5, "copy");
    backgroundActivityIdentifier = v7->_backgroundActivityIdentifier;
    v7->_backgroundActivityIdentifier = v8;

    v10 = (STBackgroundActivitiesStatusDomainPublisher *)objc_alloc_init((Class)STBackgroundActivitiesStatusDomainPublisher);
    publisher = v7->_publisher;
    v7->_publisher = v10;

  }
LABEL_4:

  return v7;
}

- (void)activateBackgroundActivityWithUserInteractionHandler:(id)a3
{
  if (!self->_backgroundActivityActive)
  {
    self->_backgroundActivityActive = 1;
    -[ContinuityCaptureShieldUIBackgroundActivityController publishNewDataWithUserInteractionHandler:](self, "publishNewDataWithUserInteractionHandler:", a3);
  }
}

- (void)deactivateBackgroundActivity
{
  if (self->_backgroundActivityActive)
  {
    self->_backgroundActivityActive = 0;
    -[ContinuityCaptureShieldUIBackgroundActivityController publishNewDataWithUserInteractionHandler:](self, "publishNewDataWithUserInteractionHandler:", 0);
  }
}

- (void)publishNewDataWithUserInteractionHandler:(id)a3
{
  id v4;
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v5;
  void *v6;
  id v7;
  STBackgroundActivitiesStatusDomainPublisher *publisher;
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v18;
  id v19;
  id location;
  _QWORD v21[4];

  v4 = a3;
  v5 = self->_currentAttribution;
  if (self->_backgroundActivityActive)
  {
    BSAuditTokenForCurrentProcess(v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[STActivityAttribution attributionWithAuditToken:](STActivityAttribution, "attributionWithAuditToken:", v21));
    v7 = objc_msgSend(objc_alloc((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution), "initWithBackgroundActivityIdentifier:activityAttribution:", self->_backgroundActivityIdentifier, v6);

  }
  else
  {
    v7 = 0;
  }
  objc_initWeak(&location, self);
  publisher = self->_publisher;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000016A4;
  v17[3] = &unk_1000184B8;
  v9 = v5;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100001710;
  v13[3] = &unk_100018508;
  objc_copyWeak(&v16, &location);
  v11 = v10;
  v14 = v11;
  v12 = v4;
  v15 = v12;
  -[STBackgroundActivitiesStatusDomainPublisher updateVolatileData:completion:](publisher, "updateVolatileData:completion:", v17, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (BOOL)isBackgroundActivityActive
{
  return self->_backgroundActivityActive;
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)currentAttribution
{
  return self->_currentAttribution;
}

- (void)setCurrentAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_currentAttribution, a3);
}

- (STBackgroundActivitiesStatusDomainPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_currentAttribution, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end
