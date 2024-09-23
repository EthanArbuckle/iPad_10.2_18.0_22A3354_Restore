@implementation MKCompactDeveloperPlaceCardRemoteUIHostViewController

- (MKCompactDeveloperPlaceCardRemoteUIHostViewController)initWithMapItem:(id)a3
{
  id v5;
  void *v6;
  MKCompactDeveloperPlaceCardLoadingView *v7;
  MKCompactDeveloperPlaceCardRemoteUIHostViewController *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079640);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MKCompactDeveloperPlaceCardLoadingView);
  v10.receiver = self;
  v10.super_class = (Class)MKCompactDeveloperPlaceCardRemoteUIHostViewController;
  v8 = -[MKPlaceCardRemoteUIHostViewController initWithSceneIdentifier:remoteObjectInterface:placeholderView:](&v10, sel_initWithSceneIdentifier_remoteObjectInterface_placeholderView_, CFSTR("MKCompactAccessoryPlaceCardScene"), v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_mapItem, a3);

  return v8;
}

- (void)_configureConnection:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _geoMapItemStorageForPersistence](self->_mapItem, "_geoMapItemStorageForPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithMapItemStorage:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
