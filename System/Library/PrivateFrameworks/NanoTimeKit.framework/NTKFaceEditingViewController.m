@implementation NTKFaceEditingViewController

- (NTKFaceEditingViewController)initWithFace:(id)a3
{
  id v5;
  NTKFaceEditingViewController *v6;
  NTKFaceEditingViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceEditingViewController;
  v6 = -[NTKFaceEditingViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_face, a3);
    -[NTKFaceEditingViewController setModalPresentationCapturesStatusBarAppearance:](v7, "setModalPresentationCapturesStatusBarAppearance:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_faceColorEditOptionsChanged, CFSTR("NTKColorEditOptionsChangedNotificationName"), v7->_face);

  }
  return v7;
}

- (int64_t)currentEditMode
{
  return -[NTKFaceEditView editMode](self->_editView, "editMode");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKColorEditOptionsChangedNotificationName"), self->_face);

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceEditingViewController;
  -[NTKFaceEditingViewController dealloc](&v4, sel_dealloc);
}

- (void)faceColorEditOptionsChanged
{
  -[NTKFaceEditView reloadColorPicker](self->_editView, "reloadColorPicker");
}

- (void)loadView
{
  NTKFaceEditView *v3;
  void *v4;
  NTKFaceEditView *v5;
  NTKFaceEditView *editView;

  v3 = [NTKFaceEditView alloc];
  -[NTKFaceEditingViewController face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKFaceEditView initWithFace:](v3, "initWithFace:", v4);

  -[NTKFaceEditingViewController setView:](self, "setView:", v5);
  editView = self->_editView;
  self->_editView = v5;

}

- (void)willActivate
{
  -[NTKFaceEditView willActivate](self->_editView, "willActivate");
}

- (void)activate
{
  -[NTKFaceEditView activate](self->_editView, "activate");
}

- (void)willDeactivate
{
  -[NTKFaceEditView willDeactivate](self->_editView, "willDeactivate");
}

- (void)deactivateWithCompletion:(id)a3
{
  -[NTKFaceEditView deactivateWithCompletion:](self->_editView, "deactivateWithCompletion:", a3);
}

- (NTKFace)face
{
  return self->_face;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editView, 0);
}

@end
