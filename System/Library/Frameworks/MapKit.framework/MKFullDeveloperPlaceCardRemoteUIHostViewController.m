@implementation MKFullDeveloperPlaceCardRemoteUIHostViewController

- (id)initAsAccessoryWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4
{
  id v7;
  void *v8;
  MKFullDeveloperPlaceCardLoadingView *v9;
  MKFullDeveloperPlaceCardRemoteUIHostViewController *v10;
  objc_super v12;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079640);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);
  v12.receiver = self;
  v12.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
  v10 = -[MKPlaceCardRemoteUIHostViewController initWithSceneIdentifier:remoteObjectInterface:placeholderView:](&v12, sel_initWithSceneIdentifier_remoteObjectInterface_placeholderView_, CFSTR("MKFullAccessoryPlaceCardScene"), v8, v9);

  if (v10)
  {
    v10->_isStandAlonePlaceCard = 0;
    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_dismissButtonDisplayed = a4;
    v10->_hideInlineMap = 1;
  }

  return v10;
}

- (id)initAsStandAloneWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4 hideInlineMap:(BOOL)a5
{
  id v9;
  void *v10;
  MKFullDeveloperPlaceCardLoadingView *v11;
  MKFullDeveloperPlaceCardRemoteUIHostViewController *v12;
  objc_super v14;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079C18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);
  v14.receiver = self;
  v14.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
  v12 = -[MKPlaceCardRemoteUIHostViewController initWithSceneIdentifier:remoteObjectInterface:placeholderView:](&v14, sel_initWithSceneIdentifier_remoteObjectInterface_placeholderView_, CFSTR("MKStandAlonePlaceCardScene"), v10, v11);

  if (v12)
  {
    v12->_isStandAlonePlaceCard = 1;
    objc_storeStrong((id *)&v12->_mapItem, a3);
    v12->_dismissButtonDisplayed = a4;
    v12->_hideInlineMap = a5;
  }

  return v12;
}

- (void)_configureConnection:(id)a3
{
  _BOOL4 isStandAlonePlaceCard;
  void *v5;
  id v6;

  isStandAlonePlaceCard = self->_isStandAlonePlaceCard;
  objc_msgSend(a3, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _geoMapItemStorageForPersistence](self->_mapItem, "_geoMapItemStorageForPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (isStandAlonePlaceCard)
    objc_msgSend(v6, "configureWithMapItemStorage:hideInlineMap:", v5, self->_hideInlineMap);
  else
    objc_msgSend(v6, "configureWithMapItemStorage:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
