@implementation GDFutureLifeEventUpdateNotificationSubscription

- (GDFutureLifeEventUpdateNotificationSubscription)initWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  GDFutureLifeEventUpdateNotificationSubscription *v11;
  GDInternalViewUpdateNotificationSubscription *v12;
  const char *v13;
  uint64_t updated;
  GDInternalViewUpdateNotificationSubscription *viewUpdateNotificationSubscription;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GDFutureLifeEventUpdateNotificationSubscription;
  v11 = -[GDFutureLifeEventUpdateNotificationSubscription init](&v17, sel_init);
  if (v11)
  {
    v12 = [GDInternalViewUpdateNotificationSubscription alloc];
    updated = objc_msgSend_initForViewName_systemwideUniqueSubscriptionIdentifier_useCase_targetQueue_onReceiveUpdateNotificationBlock_(v12, v13, (uint64_t)CFSTR("futureLifeEventMap"), v8, CFSTR("FutureLifeEvent"), v9, v10);
    viewUpdateNotificationSubscription = v11->_viewUpdateNotificationSubscription;
    v11->_viewUpdateNotificationSubscription = (GDInternalViewUpdateNotificationSubscription *)updated;

  }
  return v11;
}

- (void)cancelSubscription
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_viewUpdateNotificationSubscription(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelSubscription(v5, v3, v4);

}

- (GDInternalViewUpdateNotificationSubscription)viewUpdateNotificationSubscription
{
  return self->_viewUpdateNotificationSubscription;
}

- (void)setViewUpdateNotificationSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_viewUpdateNotificationSubscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewUpdateNotificationSubscription, 0);
}

@end
