@implementation MusicKit_SoftLinking_MPCloudServiceStatusController

- (void)beginObservingCloudLibraryEnabled
{
  -[MPCloudServiceStatusController beginObservingCloudLibraryEnabled](self->_underlyingServiceStatusController, "beginObservingCloudLibraryEnabled");
}

+ (NSString)cloudLibraryEnabledDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPCloudServiceStatusControllerEnabledDidChangeNotification");
}

+ (MusicKit_SoftLinking_MPCloudServiceStatusController)sharedController
{
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_10);
  return (MusicKit_SoftLinking_MPCloudServiceStatusController *)(id)sharedController_sSharedController;
}

- (id)_initWithUnderlyingServiceStatusController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPCloudServiceStatusController *v6;
  MusicKit_SoftLinking_MPCloudServiceStatusController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPCloudServiceStatusController;
  v6 = -[MusicKit_SoftLinking_MPCloudServiceStatusController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingServiceStatusController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleCloudLibraryEnabledDidChangeNotification_, v9, v7->_underlyingServiceStatusController);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingServiceStatusController);

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPCloudServiceStatusController;
  -[MusicKit_SoftLinking_MPCloudServiceStatusController dealloc](&v5, sel_dealloc);
}

- (void)endObservingCloudLibraryEnabled
{
  -[MPCloudServiceStatusController endObservingCloudLibraryEnabled](self->_underlyingServiceStatusController, "endObservingCloudLibraryEnabled");
}

- (void)_handleCloudLibraryEnabledDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPCloudServiceStatusControllerEnabledDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingServiceStatusController, 0);
}

@end
