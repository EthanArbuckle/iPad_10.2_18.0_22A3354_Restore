@implementation NTKCompanionFaceViewController

- (NTKCompanionFaceViewController)initWithFace:(id)a3
{
  return -[NTKCompanionFaceViewController initWithFace:forEditing:](self, "initWithFace:forEditing:", a3, 0);
}

- (NTKCompanionFaceViewController)initWithFace:(id)a3 forEditing:(BOOL)a4
{
  id v6;
  id v7;
  NTKCompanionFaceViewController *v8;
  NTKCompanionFaceViewController *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__NTKCompanionFaceViewController_initWithFace_forEditing___block_invoke;
  v13[3] = &unk_1E6BDC3F8;
  v15 = a4;
  v7 = v6;
  v14 = v7;
  v12.receiver = self;
  v12.super_class = (Class)NTKCompanionFaceViewController;
  v8 = -[NTKFaceViewController initWithFace:configuration:](&v12, sel_initWithFace_configuration_, v7, v13);
  v9 = v8;
  if (v8)
  {
    -[NTKCompanionFaceViewController view](v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  }
  return v9;
}

void __58__NTKCompanionFaceViewController_initWithFace_forEditing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "setDataMode:", 3);
  objc_msgSend(v8, "setShouldShowSnapshot:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(v8, "setShowsCanonicalContent:", 1);
  objc_msgSend(v8, "freeze");
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceCategory") != 1)
  {
    objc_msgSend(v3, "screenCornerRadius");
    v5 = v4;
    objc_msgSend(v8, "faceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

    objc_msgSend(v8, "faceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

  }
}

@end
