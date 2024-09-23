@implementation NTKCFaceDetailAlbumChooserViewController

- (NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _NTKCFaceDetailAlbumChooserViewController *v10;
  NTKCFaceDetailAlbumChooserViewController *v11;
  NTKCFaceDetailAlbumChooserViewController *v12;
  objc_super v14;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_NTKCFaceDetailAlbumChooserViewController initWithPhotosEditor:forFace:inGallery:]([_NTKCFaceDetailAlbumChooserViewController alloc], "initWithPhotosEditor:forFace:inGallery:", v9, v8, v5);

  v14.receiver = self;
  v14.super_class = (Class)NTKCFaceDetailAlbumChooserViewController;
  v11 = -[NTKCNavigationController initWithRootViewController:](&v14, sel_initWithRootViewController_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_implementationVC, v10);
    -[_NTKCFaceDetailAlbumChooserViewController setDelegate:](v12->_implementationVC, "setDelegate:", v12);
  }

  return v12;
}

- (NTKCAlbumHandlingEditor)editor
{
  return -[_NTKCFaceDetailAlbumChooserViewController editor](self->_implementationVC, "editor");
}

- (BOOL)inGallery
{
  return -[_NTKCFaceDetailAlbumChooserViewController inGallery](self->_implementationVC, "inGallery");
}

- (NTKFace)face
{
  return -[_NTKCFaceDetailAlbumChooserViewController face](self->_implementationVC, "face");
}

- (void)_albumChooserDidFinish:(id)a3
{
  id v4;

  -[NTKCFaceDetailAlbumChooserViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumChooserDidFinish:", self);

}

- (NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate
{
  return (NTKCFaceDetailAlbumChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_implementationVC, 0);
}

@end
