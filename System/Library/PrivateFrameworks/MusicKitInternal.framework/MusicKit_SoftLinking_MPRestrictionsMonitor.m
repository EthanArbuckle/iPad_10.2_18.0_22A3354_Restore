@implementation MusicKit_SoftLinking_MPRestrictionsMonitor

+ (MusicKit_SoftLinking_MPRestrictionsMonitor)sharedRestrictionsMonitor
{
  if (sharedRestrictionsMonitor_sOnceToken != -1)
    dispatch_once(&sharedRestrictionsMonitor_sOnceToken, &__block_literal_global);
  return (MusicKit_SoftLinking_MPRestrictionsMonitor *)(id)sharedRestrictionsMonitor_sSharedRestrictionsMonitor;
}

- (id)_initWithUnderlyingRestrictionsMonitor:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPRestrictionsMonitor *v6;
  MusicKit_SoftLinking_MPRestrictionsMonitor *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPRestrictionsMonitor;
  v6 = -[MusicKit_SoftLinking_MPRestrictionsMonitor init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingRestrictionsMonitor, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleAllowsExplicitContentDidChangeNotification_, v9, v7->_underlyingRestrictionsMonitor);

    getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleAllowsMusicVideosDidChangeNotification_, v10, v7->_underlyingRestrictionsMonitor);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingRestrictionsMonitor);

  getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, self->_underlyingRestrictionsMonitor);

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPRestrictionsMonitor;
  -[MusicKit_SoftLinking_MPRestrictionsMonitor dealloc](&v6, sel_dealloc);
}

- (BOOL)allowsDeletion
{
  return -[MPRestrictionsMonitor allowsDeletion](self->_underlyingRestrictionsMonitor, "allowsDeletion");
}

- (BOOL)allowsExplicitContent
{
  return -[MPRestrictionsMonitor allowsExplicitContent](self->_underlyingRestrictionsMonitor, "allowsExplicitContent");
}

- (BOOL)allowsMusicVideos
{
  return -[MPRestrictionsMonitor allowsMusicVideos](self->_underlyingRestrictionsMonitor, "allowsMusicVideos");
}

+ (NSString)allowsExplicitContentDidChangeNotification
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification");
}

+ (NSString)allowsMusicVideosDidChangeNotification
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification");
}

- (void)_handleAllowsExplicitContentDidChangeNotification:(id)a3
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

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification"), self, v6);
}

- (void)_handleAllowsMusicVideosDidChangeNotification:(id)a3
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

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRestrictionsMonitor, 0);
}

@end
