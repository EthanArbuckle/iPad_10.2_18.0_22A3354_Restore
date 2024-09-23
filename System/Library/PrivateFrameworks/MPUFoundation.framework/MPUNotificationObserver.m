@implementation MPUNotificationObserver

+ (id)observerWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:object:queue:observationHandler:", v13, v12, v11, v10);

  return v14;
}

- (MPUNotificationObserver)initWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPUNotificationObserver *v14;
  void *v15;
  uint64_t v16;
  id notificationObservationToken;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPUNotificationObserver;
  v14 = -[MPUNotificationObserver init](&v19, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", v10, v11, v12, v13);
    v16 = objc_claimAutoreleasedReturnValue();
    notificationObservationToken = v14->_notificationObservationToken;
    v14->_notificationObservationToken = (id)v16;

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUNotificationObserver notificationObservationToken](self, "notificationObservationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  v5.receiver = self;
  v5.super_class = (Class)MPUNotificationObserver;
  -[MPUNotificationObserver dealloc](&v5, sel_dealloc);
}

- (id)notificationObservationToken
{
  return self->_notificationObservationToken;
}

- (void)setNotificationObservationToken:(id)a3
{
  objc_storeStrong(&self->_notificationObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObservationToken, 0);
}

@end
