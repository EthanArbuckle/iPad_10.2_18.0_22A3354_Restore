@implementation NTKCFaceDetailPhotoCropViewController

- (NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _NTKCFaceDetailPhotoCropViewController *v16;
  NTKCFaceDetailPhotoCropViewController *v17;
  NTKCFaceDetailPhotoCropViewController *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = -[_NTKCFaceDetailPhotoCropViewController initWithIndex:inPhotosEditor:forFace:timeStyle:completionHandler:]([_NTKCFaceDetailPhotoCropViewController alloc], "initWithIndex:inPhotosEditor:forFace:timeStyle:completionHandler:", a3, v15, v14, v13, v12);

  v25.receiver = self;
  v25.super_class = (Class)NTKCFaceDetailPhotoCropViewController;
  v17 = -[NTKCNavigationController initWithRootViewController:](&v25, sel_initWithRootViewController_, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_implementationVC, v16);
    v19 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v19, "configureWithOpaqueBackground");
    -[NTKCFaceDetailPhotoCropViewController navigationBar](v18, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStandardAppearance:", v19);

    -[NTKCFaceDetailPhotoCropViewController navigationBar](v18, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setScrollEdgeAppearance:", v19);

    -[NTKCFaceDetailPhotoCropViewController navigationItem](v18, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLargeTitleDisplayMode:", 2);

    -[NTKCFaceDetailPhotoCropViewController navigationBar](v18, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPrefersLargeTitles:", 0);

  }
  return v18;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotoCropViewController;
  -[NTKCFaceDetailPhotoCropViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[NTKCFaceDetailPhotoCropViewController setToolbarHidden:](self, "setToolbarHidden:", 0);
}

- (unint64_t)index
{
  return -[_NTKCFaceDetailPhotoCropViewController index](self->_implementationVC, "index");
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return -[_NTKCFaceDetailPhotoCropViewController editor](self->_implementationVC, "editor");
}

- (NTKFace)face
{
  return -[_NTKCFaceDetailPhotoCropViewController face](self->_implementationVC, "face");
}

- (NTKDigitalTimeLabelStyle)timeStyle
{
  return -[_NTKCFaceDetailPhotoCropViewController timeStyle](self->_implementationVC, "timeStyle");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementationVC, 0);
}

uint64_t __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11;
  double v12;
  double v13;
  void *v14;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v11 = a2;
  objc_msgSend(v11, "scale");
  v13 = v12;
  *(double *)(*(_QWORD *)(a1 + 32) + 984) = v12;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectIsEmpty(v17) && v13 != 0.0)
  {
    CGAffineTransformMakeScale(&v16, 1.0 / v13, 1.0 / v13);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectApplyAffineTransform(v18, &v16);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setCenteredView:", v14);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setCropRect:", x, y, width, height);
}

void __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "originalCropForPhotoAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 1056);
    v8 = *(_QWORD *)(v5 + 1048);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_3;
    v9[3] = &unk_1E6BCFF48;
    v10 = v6;
    objc_msgSend(v7, "imageAndCropForPhotoAtIndex:completion:", v8, v9);

  }
}

uint64_t __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56___NTKCFaceDetailPhotoCropViewController__cancelPressed__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPressed");
}

uint64_t __56___NTKCFaceDetailPhotoCropViewController__deletePressed__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_deletePressed");
}

@end
