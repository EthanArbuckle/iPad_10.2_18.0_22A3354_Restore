@implementation HMDCameraSnapshotNotificationTimer

- (HMDCameraSnapshotNotificationTimer)initWithCameraSessionID:(id)a3 changedCharacteristics:(id)a4 timeInterval:(double)a5
{
  id v9;
  id v10;
  HMDCameraSnapshotNotificationTimer *v11;
  HMDCameraSnapshotNotificationTimer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraSnapshotNotificationTimer;
  v11 = -[HMFTimer initWithTimeInterval:options:](&v14, sel_initWithTimeInterval_options_, 0, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changedCharacteristics, a4);
    objc_storeStrong((id *)&v12->_sessionID, a3);
  }

  return v12;
}

- (NSSet)changedCharacteristics
{
  return self->_changedCharacteristics;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSArray)postedBulletins
{
  return self->_postedBulletins;
}

- (void)setPostedBulletins:(id)a3
{
  objc_storeStrong((id *)&self->_postedBulletins, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postedBulletins, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_changedCharacteristics, 0);
}

@end
