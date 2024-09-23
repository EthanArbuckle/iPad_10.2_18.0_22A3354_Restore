@implementation IAMMessageGroup

- (IAMMessageGroup)initWithGroupIdentifier:(id)a3
{
  id v4;
  IAMMessageGroup *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IAMMessageGroup;
  v5 = -[IAMMessageGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setMessageCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_messageCoordinator, a3);
}

- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)reportModalMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    v9 = (void *)objc_msgSend(v11, "copy");
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v8, "messageGroup:didReportModalMessageWithIdentifier:actionWasPerformedWithIdentifier:", self, v9, v10);

  }
}

- (void)receiveEvent:(id)a3
{
  IAMMessageCoordinator **p_messageCoordinator;
  id v5;
  IAMReceivedEventTriggerContext *v6;
  id WeakRetained;

  p_messageCoordinator = &self->_messageCoordinator;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  v6 = -[IAMReceivedEventTriggerContext initWithEvent:bundleIdentifier:]([IAMReceivedEventTriggerContext alloc], "initWithEvent:bundleIdentifier:", v5, self->_groupIdentifier);

  objc_msgSend(WeakRetained, "receiveTriggerEventContext:", v6);
}

- (void)reportContextPropertiesDidChange:(id)a3
{
  IAMMessageCoordinator **p_messageCoordinator;
  id v5;
  IAMChangedContextPropertiesTriggerContext *v6;
  id WeakRetained;

  p_messageCoordinator = &self->_messageCoordinator;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  v6 = -[IAMChangedContextPropertiesTriggerContext initWithContextPropertyNames:bundleIdentifier:]([IAMChangedContextPropertiesTriggerContext alloc], "initWithContextPropertyNames:bundleIdentifier:", v5, self->_groupIdentifier);

  objc_msgSend(WeakRetained, "reportChangedContextPropertiesContext:", v6);
}

- (id)contextPropertyWithName:(id)a3
{
  return 0;
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 0;
}

- (void)reportModalMessagePresentationFailedWithIdentifier:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "messageGroup:didReportModalMessagePresentationFailedWithIdentifier:", self, v6);

  }
}

- (void)reportModalMessageWasPresentedWithIdentifier:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "messageGroup:didReportModalMessageWasPresentedWithIdentifier:", self, v6);

  }
}

- (void)reportModalMessageWasDismissedWithIdentifier:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "messageGroup:didReportModalMessageWasDismissedWithIdentifier:", self, v6);

  }
}

- (IAMMessageCoordinator)messageCoordinator
{
  return (IAMMessageCoordinator *)objc_loadWeakRetained((id *)&self->_messageCoordinator);
}

- (IAMMessageGroupInternalDelegate)internalDelegate
{
  return (IAMMessageGroupInternalDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_destroyWeak((id *)&self->_messageCoordinator);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
