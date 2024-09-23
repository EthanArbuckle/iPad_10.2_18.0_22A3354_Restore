@implementation NTKCFaceDetailDescriptionSectionController

+ (BOOL)hasDescriptionSectionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a1, "_descriptionForFace:inGallery:orExternal:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

- (NTKCFaceDetailDescriptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 external:(BOOL)a6
{
  _BOOL8 v6;
  NTKCFaceDetailDescriptionSectionController *v7;
  NTKCFaceDetailDescriptionSectionController *v8;
  objc_super v10;

  v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailDescriptionSectionController;
  v7 = -[NTKCFaceDetailSectionController initWithTableViewController:face:inGallery:](&v10, sel_initWithTableViewController_face_inGallery_, a3, a4, a5);
  v8 = v7;
  if (v7)
    -[NTKCFaceDetailDescriptionSectionController setExternal:](v7, "setExternal:", v6);
  return v8;
}

- (void)_commonInit
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new();
  -[NTKCFaceDetailSectionController setCell:](self, "setCell:", v3);

  -[NTKCFaceDetailSectionController cell](self, "cell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (id)titleForHeader
{
  uint64_t v2;

  return NTKCCustomizationLocalizedString(CFSTR("DESCRIPTION_TITLE"), (uint64_t)CFSTR("Description"), v2);
}

- (void)faceDidChange
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t v23;

  -[NTKCFaceDetailDescriptionSectionController _faceDescription](self, "_faceDescription");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v19, "length");
  -[NTKCFaceDetailSectionController cell](self, "cell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "setText:", 0);
LABEL_6:

    v8 = v19;
    goto LABEL_7;
  }
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v19, "isEqualToString:", v6);

  v8 = v19;
  if ((v7 & 1) == 0)
  {
    -[NTKCFaceDetailSectionController cell](self, "cell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rowHeight");
    v11 = v10;

    -[NTKCFaceDetailSectionController cell](self, "cell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v19);

    -[NTKCFaceDetailSectionController cell](self, "cell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rowHeight");
    v15 = v14;

    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController cell](self, "cell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForCell:", v17);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __59__NTKCFaceDetailDescriptionSectionController_faceDidChange__block_invoke;
      v20[3] = &unk_1E6BD5260;
      v22 = v15;
      v23 = v11;
      v20[4] = self;
      v5 = v5;
      v21 = v5;
      objc_msgSend(v18, "performWithoutAnimation:", v20);

    }
    goto LABEL_6;
  }
LABEL_7:

}

void __59__NTKCFaceDetailDescriptionSectionController_faceDidChange__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  v3 = -v2;
  if (v2 >= 0.0)
    v3 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  if (v3 > 0.00000011920929)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;

    v9 = v2 + v8;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInset");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v12 + v14;

    if (v9 >= -v15)
      v16 = v9;
    else
      v16 = -v15;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:", v6, v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 5);

}

- (BOOL)expanded
{
  void *v2;
  char v3;

  -[NTKCFaceDetailSectionController cell](self, "cell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expanded");

  return v3;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NTKCFaceDetailSectionController cell](self, "cell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpanded:", v3);

}

- (id)_faceDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NTKCFaceDetailSectionController face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_descriptionForFace:inGallery:orExternal:", v4, -[NTKCFaceDetailSectionController inGallery](self, "inGallery"), -[NTKCFaceDetailDescriptionSectionController external](self, "external"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_descriptionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "faceDescriptionForExternal");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      objc_msgSend(v7, "faceDescription");
    else
      objc_msgSend(v7, "faceDescriptionForLibrary");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)descriptionCellDidExpand:(id)a3
{
  id v4;

  -[NTKCFaceDetailDescriptionSectionController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionSection:didExpand:", self, 1);

}

- (NTKCFaceDetailDescriptionSectionDelegate)delegate
{
  return (NTKCFaceDetailDescriptionSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)external
{
  return self->_external;
}

- (void)setExternal:(BOOL)a3
{
  self->_external = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
