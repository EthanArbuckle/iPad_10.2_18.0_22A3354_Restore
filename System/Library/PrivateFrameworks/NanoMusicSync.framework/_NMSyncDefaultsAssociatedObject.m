@implementation _NMSyncDefaultsAssociatedObject

- (_NMSyncDefaultsAssociatedObject)init
{
  _NMSyncDefaultsAssociatedObject *v2;
  void *v3;
  void *v4;
  _NMSyncDefaultsAssociatedObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NMSyncDefaultsAssociatedObject;
  v2 = -[_NMSyncDefaultsAssociatedObject init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__mediaLibraryDidChangeNotification_, *MEMORY[0x24BDDBCF0], 0);

    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginGeneratingLibraryChangeNotifications");

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)_NMSyncDefaultsAssociatedObject;
  -[_NMSyncDefaultsAssociatedObject dealloc](&v5, sel_dealloc);
}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  MPMediaPlaylist *assetSyncPlaylist;

  assetSyncPlaylist = self->_assetSyncPlaylist;
  self->_assetSyncPlaylist = 0;

}

- (MPMediaPlaylist)assetSyncPlaylist
{
  return self->_assetSyncPlaylist;
}

- (void)setAssetSyncPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_assetSyncPlaylist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSyncPlaylist, 0);
}

@end
