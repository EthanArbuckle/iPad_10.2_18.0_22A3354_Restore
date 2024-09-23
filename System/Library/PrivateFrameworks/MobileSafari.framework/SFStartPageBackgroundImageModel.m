@implementation SFStartPageBackgroundImageModel

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3
{
  id v5;
  SFStartPageBackgroundImageModel *v6;
  SFStartPageBackgroundImageModel *v7;
  SFStartPageBackgroundImageModel *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageBackgroundImageModel;
  v6 = -[SFStartPageBackgroundImageModel init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemProvider, a3);
    v7->_selected = v5 != 0;
    v8 = v7;
  }

  return v7;
}

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 symbolName:(id)a4 profileIdentifier:(id)a5 selected:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  SFStartPageBackgroundImageModel *v14;
  SFStartPageBackgroundImageModel *v15;
  SFStartPageBackgroundImageModel *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFStartPageBackgroundImageModel;
  v14 = -[SFStartPageBackgroundImageModel init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemProvider, a3);
    v15->_selected = a6;
    objc_storeStrong((id *)&v15->_symbolName, a4);
    objc_storeStrong((id *)&v15->_profileIdentifier, a5);
    v16 = v15;
  }

  return v15;
}

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 fileName:(id)a4 selected:(BOOL)a5
{
  id v9;
  id v10;
  SFStartPageBackgroundImageModel *v11;
  SFStartPageBackgroundImageModel *v12;
  uint64_t v13;
  NSString *mobileAssetFileName;
  SFStartPageBackgroundImageModel *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFStartPageBackgroundImageModel;
  v11 = -[SFStartPageBackgroundImageModel init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemProvider, a3);
    v12->_selected = a5;
    v13 = objc_msgSend(v10, "copy");
    mobileAssetFileName = v12->_mobileAssetFileName;
    v12->_mobileAssetFileName = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (SFStartPageBackgroundImageModel)initWithIndex:(int64_t)a3 inDataSource:(id)a4 selected:(BOOL)a5
{
  id v9;
  SFStartPageBackgroundImageModel *v10;
  SFStartPageBackgroundImageModel *v11;
  SFStartPageBackgroundImageModel *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFStartPageBackgroundImageModel;
  v10 = -[SFStartPageBackgroundImageModel init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11->_index = a3;
    v11->_selected = a5;
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_itemProvider)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("itemProvider = %@"), self->_itemProvider);
  }
  else if (self->_dataSource)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("dataSource = %@; index = %zd"), self->_dataSource, self->_index);
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("no-content"));
  }
  if (-[SFStartPageBackgroundImageModel isCustomImage](self, "isCustomImage"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_selected)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v5;
  objc_msgSend(v4, "appendFormat:", CFSTR("; isCustom = %@; isSelected = %@>"), v7, v6);

  return v4;
}

- (void)getThumbnailImageWithCompletionHandler:(id)a3
{
  id v4;
  NSItemProvider *v5;
  NSItemProvider *v6;
  NSItemProvider *v7;
  WBSStartPageBackgroundImagesDataSource *dataSource;
  int64_t index;
  void *v10;
  _QWORD v11[4];
  NSItemProvider *v12;
  _QWORD v13[4];
  NSItemProvider *v14;
  id v15;

  v4 = a3;
  v5 = self->_itemProvider;
  v6 = v5;
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E21E4270;
    v14 = v5;
    v15 = v4;
    -[NSItemProvider loadPreviewImageWithOptions:completionHandler:](v14, "loadPreviewImageWithOptions:completionHandler:", 0, v13);

    v7 = v14;
  }
  else
  {
    dataSource = self->_dataSource;
    if (!dataSource)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, uint64_t))v4 + 2))(v4, v10, 1);

      goto LABEL_6;
    }
    index = self->_index;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E21E4298;
    v12 = (NSItemProvider *)v4;
    -[WBSStartPageBackgroundImagesDataSource imageThumbnailWithItemIndex:completion:](dataSource, "imageThumbnailWithItemIndex:completion:", index, v11);
    v7 = v12;
  }

LABEL_6:
}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_opt_self(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E21E4220;
    v9 = &v15;
    v15 = *(id *)(a1 + 40);
    v14 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = objc_opt_class();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E21E4248;
    v17 = *(id *)(a1 + 40);
    v12 = (id)objc_msgSend(v10, "loadObjectOfClass:completionHandler:", v11, v16);
    v9 = &v17;
  }

}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E21E4220;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v3, "CGImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (WBSStartPageBackgroundImageDescription)imageDescription
{
  return (WBSStartPageBackgroundImageDescription *)-[WBSStartPageBackgroundImagesDataSource imageURLAndLuminanceWithItemIndex:](self->_dataSource, "imageURLAndLuminanceWithItemIndex:", self->_index);
}

- (BOOL)isCustomImage
{
  return self->_itemProvider && !self->_profileIdentifier && self->_mobileAssetFileName == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_dataSource == (WBSStartPageBackgroundImagesDataSource *)*((_QWORD *)v5 + 1)
      && self->_index == *((_QWORD *)v5 + 2)
      && self->_itemProvider == (NSItemProvider *)*((_QWORD *)v5 + 3)
      && self->_selected == v5[32]
      && WBSIsEqual()
      && WBSIsEqual())
    {
      v7 = WBSIsEqual();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[WBSStartPageBackgroundImagesDataSource hash](self->_dataSource, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_index);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[NSItemProvider hash](self->_itemProvider, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_selected);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v3 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (NSString)mobileAssetFileName
{
  return self->_mobileAssetFileName;
}

- (void)setMobileAssetFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetFileName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
