@implementation NTKPigmentAddController

- (NTKPigmentAddController)initWithFace:(id)a3 faceView:(id)a4 slot:(id)a5 willExitHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _NTKPigmentAddController *v14;
  NTKPigmentAddController *v15;
  NTKPigmentAddController *v16;
  void *v17;
  objc_super v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_NTKPigmentAddController initWithFace:faceView:slot:willExitHandler:]([_NTKPigmentAddController alloc], "initWithFace:faceView:slot:willExitHandler:", v13, v12, v11, v10);

  v19.receiver = self;
  v19.super_class = (Class)NTKPigmentAddController;
  v15 = -[NTKCNavigationController initWithRootViewController:](&v19, sel_initWithRootViewController_, v14);
  v16 = v15;
  if (v15)
  {
    -[NTKPigmentAddController presentationController](v15, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v14);

  }
  return v16;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPigmentAddController;
  -[NTKPigmentAddController viewDidLoad](&v3, sel_viewDidLoad);
  -[NTKPigmentAddController setToolbarHidden:](self, "setToolbarHidden:", 1);
}

@end
