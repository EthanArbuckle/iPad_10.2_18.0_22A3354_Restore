@implementation NTKCFaceDetailCustomPhotosViewController

- (NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  _NTKCFaceDetailCustomPhotosViewController *v15;
  NTKCFaceDetailCustomPhotosViewController *v16;
  NTKCFaceDetailCustomPhotosViewController *v17;
  objc_super v19;

  v7 = a7;
  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_NTKCFaceDetailCustomPhotosViewController initWithPhotosEditor:forFace:inGallery:faceView:externalImagesSet:]([_NTKCFaceDetailCustomPhotosViewController alloc], "initWithPhotosEditor:forFace:inGallery:faceView:externalImagesSet:", v14, v13, v8, v12, v7);

  v19.receiver = self;
  v19.super_class = (Class)NTKCFaceDetailCustomPhotosViewController;
  v16 = -[NTKCNavigationController initWithRootViewController:](&v19, sel_initWithRootViewController_, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_implementationVC, v15);
    -[_NTKCFaceDetailCustomPhotosViewController setDelegate:](v17->_implementationVC, "setDelegate:", v17);
  }

  return v17;
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return -[_NTKCFaceDetailCustomPhotosViewController editor](self->_implementationVC, "editor");
}

- (BOOL)inGallery
{
  return -[_NTKCFaceDetailCustomPhotosViewController inGallery](self->_implementationVC, "inGallery");
}

- (void)customPhotosControllerDidFinish:(id)a3
{
  id v4;

  -[NTKCFaceDetailCustomPhotosViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customPhotosControllerDidFinish:", self);

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_implementationVC, 0);
}

uint64_t __65___NTKCFaceDetailCustomPhotosViewController_setEditing_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", 0);
}

void __83___NTKCFaceDetailCustomPhotosViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "item");
  v15 = *(_QWORD *)(a1 + 48);

  if (v14 == v15)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    if (!CGRectIsEmpty(v20))
    {
      objc_msgSend(v11, "scale");
      v17 = 1.0 / v16;
      objc_msgSend(v11, "scale");
      CGAffineTransformMakeScale(&v19, v17, 1.0 / v18);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22 = CGRectApplyAffineTransform(v21, &v19);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
    }
    objc_msgSend(*(id *)(a1 + 40), "setPhoto:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setCrop:", x, y, width, height);
  }

}

void __88___NTKCFaceDetailCustomPhotosViewController_collectionView_shouldSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateButtons");
    objc_msgSend(v3, "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

void __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "customPhotosControllerDidFinish:", v3);

}

void __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResourceDirectory:", v8);

    v6 = v4[126];
    objc_msgSend(v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __62___NTKCFaceDetailCustomPhotosViewController__selectAllPressed__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __56___NTKCFaceDetailCustomPhotosViewController__addPressed__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "addPhotosFromUIImagePicker:");
  objc_msgSend(*(id *)(a1 + 32), "_updateButtons");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return 0;
}

uint64_t __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1096) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_deletePressed");
}

uint64_t __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "deletePhotoAtIndex:", a2);
}

@end
