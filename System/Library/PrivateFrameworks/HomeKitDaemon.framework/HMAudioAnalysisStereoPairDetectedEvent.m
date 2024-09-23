@implementation HMAudioAnalysisStereoPairDetectedEvent

- (HMAudioAnalysisStereoPairDetectedEvent)initWithEventBulletin:(id)a3 accessory:(id)a4 notificationUUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMAudioAnalysisStereoPairDetectedEvent *v12;
  HMAudioAnalysisStereoPairDetectedEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMAudioAnalysisStereoPairDetectedEvent;
  v12 = -[HMAudioAnalysisStereoPairDetectedEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_event, a3);
    objc_storeStrong((id *)&v13->_accessory, a4);
    objc_storeStrong((id *)&v13->_notificationUUID, a5);
  }

  return v13;
}

- (HMAudioAnalysisEventBulletin)event
{
  return (HMAudioAnalysisEventBulletin *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)notificationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
