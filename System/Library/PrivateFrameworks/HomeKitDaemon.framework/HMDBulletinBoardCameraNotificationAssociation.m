@implementation HMDBulletinBoardCameraNotificationAssociation

- (HMDBulletinBoardCameraNotificationAssociation)initWithCameraProfile:(id)a3
{
  id v5;
  HMDBulletinBoardCameraNotificationAssociation *v6;
  HMDBulletinBoardCameraNotificationAssociation *v7;
  uint64_t v8;
  NSMutableSet *notificationGeneratingServicesWithCamera;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDBulletinBoardCameraNotificationAssociation;
  v6 = -[HMDBulletinBoardCameraNotificationAssociation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    notificationGeneratingServicesWithCamera = v7->_notificationGeneratingServicesWithCamera;
    v7->_notificationGeneratingServicesWithCamera = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBulletinBoardCameraNotificationAssociation cameraProfile](self, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoardCameraNotificationAssociation notificationGeneratingServicesWithCamera](self, "notificationGeneratingServicesWithCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Camera %@, Notification Services with Camera %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (NSMutableSet)notificationGeneratingServicesWithCamera
{
  return self->_notificationGeneratingServicesWithCamera;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationGeneratingServicesWithCamera, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
