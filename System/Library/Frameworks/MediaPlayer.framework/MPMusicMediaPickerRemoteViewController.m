@implementation MPMusicMediaPickerRemoteViewController

+ (id)exportedInterface
{
  return +[MPMusicMediaPickerXPCInterfaces clientInterface](MPMusicMediaPickerXPCInterfaces, "clientInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[MPMusicMediaPickerXPCInterfaces serviceInterface](MPMusicMediaPickerXPCInterfaces, "serviceInterface");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)remoteMediaPickerDidCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  objc_msgSend(WeakRetained, "remoteMediaPickerDidCancel");

}

- (void)remoteMediaPickerDidPickMediaItems:(id)a3
{
  MPMediaPickerController **p_mediaPickerController;
  id v4;
  id WeakRetained;

  p_mediaPickerController = &self->_mediaPickerController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaPickerController);
  objc_msgSend(WeakRetained, "remoteMediaPickerDidPickMediaItems:", v4);

}

- (void)remoteMediaPickerDidPickPlaybackArchive:(id)a3
{
  MPMediaPickerController **p_mediaPickerController;
  id v4;
  id WeakRetained;

  p_mediaPickerController = &self->_mediaPickerController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaPickerController);
  objc_msgSend(WeakRetained, "remoteMediaPickerDidPickPlaybackArchive:", v4);

}

- (MPMediaPickerController)mediaPickerController
{
  return (MPMediaPickerController *)objc_loadWeakRetained((id *)&self->_mediaPickerController);
}

- (void)setMediaPickerController:(id)a3
{
  objc_storeWeak((id *)&self->_mediaPickerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaPickerController);
}

@end
