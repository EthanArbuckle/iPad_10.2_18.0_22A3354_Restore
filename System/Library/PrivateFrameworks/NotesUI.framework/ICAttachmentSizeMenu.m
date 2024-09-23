@implementation ICAttachmentSizeMenu

- (ICAttachmentSizeMenu)initWithTitle:(id)a3 image:(id)a4 preferredViewSize:(signed __int16)a5 supportedSizes:(id)a6 supportsPlainLink:(BOOL)a7 isOverrideVariant:(BOOL)a8 selectedSizeHandler:(id)a9 plainLinkHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ICAttachmentSizeMenu *v21;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  UIImage *image;
  uint64_t v26;
  NSArray *supportedSizes;
  void *v28;
  id selectedSizeHandler;
  void *v30;
  id plainLinkHandler;
  objc_super v33;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)ICAttachmentSizeMenu;
  v21 = -[ICAttachmentSizeMenu init](&v33, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    image = v21->_image;
    v21->_image = (UIImage *)v24;

    v21->_preferredViewSize = a5;
    v26 = objc_msgSend(v18, "copy");
    supportedSizes = v21->_supportedSizes;
    v21->_supportedSizes = (NSArray *)v26;

    v21->_supportsPlainLink = a7;
    v21->_isOverrideVariant = a8;
    v28 = _Block_copy(v19);
    selectedSizeHandler = v21->_selectedSizeHandler;
    v21->_selectedSizeHandler = v28;

    v30 = _Block_copy(v20);
    plainLinkHandler = v21->_plainLinkHandler;
    v21->_plainLinkHandler = v30;

  }
  return v21;
}

- (id)createMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentSizeMenu actionForPlainLink](self, "actionForPlainLink");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0DC39D0];
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuWithTitle:image:identifier:options:children:", &stru_1E5C2F8C0, 0, 0, 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v8);
  }
  -[ICAttachmentSizeMenu supportedSizes](self, "supportedSizes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__ICAttachmentSizeMenu_createMenu__block_invoke;
  v19[3] = &unk_1E5C225A8;
  v19[4] = self;
  objc_msgSend(v9, "ic_compactMap:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5C2F8C0, 0, 0, 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)MEMORY[0x1E0DC39D0];
  -[ICAttachmentSizeMenu title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentSizeMenu image](self, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", v13, v14, CFSTR("com.apple.mobilenotes.attachmentSizeMenu"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ICAttachmentSizeMenu isOverrideVariant](self, "isOverrideVariant"))
  {
    -[ICAttachmentSizeMenu localizedTitleForSize:](self, "localizedTitleForSize:", -[ICAttachmentSizeMenu preferredViewSize](self, "preferredViewSize"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSubtitle:", v17);

  }
  return v16;
}

uint64_t __34__ICAttachmentSizeMenu_createMenu__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionForSize:", (__int16)objc_msgSend(a2, "integerValue"));
}

- (id)actionForPlainLink
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (!-[ICAttachmentSizeMenu supportsPlainLink](self, "supportsPlainLink"))
    return 0;
  v3 = (void *)MEMORY[0x1E0DC3428];
  -[ICAttachmentSizeMenu localizedTitleForPlainLink](self, "localizedTitleForPlainLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ICAttachmentSizeMenu_actionForPlainLink__block_invoke;
  v7[3] = &unk_1E5C21048;
  v7[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __42__ICAttachmentSizeMenu_actionForPlainLink__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "plainLinkHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "plainLinkHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (id)actionForSize:(signed __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD v12[5];
  __int16 v13;

  v3 = a3;
  -[ICAttachmentSizeMenu localizedTitleForSize:](self, "localizedTitleForSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__ICAttachmentSizeMenu_actionForSize___block_invoke;
    v12[3] = &unk_1E5C225D0;
    v12[4] = self;
    v13 = v3;
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v5, 0, 0, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ICAttachmentSizeMenu isOverrideVariant](self, "isOverrideVariant"))
    {
      v7 = -[ICAttachmentSizeMenu preferredViewSize](self, "preferredViewSize");
      v8 = v7 == v3;
      if (v7 == v3)
        v9 = (_QWORD *)MEMORY[0x1E0DC46B0];
      else
        v9 = (_QWORD *)MEMORY[0x1E0DC4690];
      objc_msgSend(v6, "setState:", v8);
      objc_msgSend(v6, "setAccessibilityTraits:", *v9);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICAttachmentSizeMenu actionForSize:].cold.1(v3, v10);

    v6 = 0;
  }

  return v6;
}

void __38__ICAttachmentSizeMenu_actionForSize___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "selectedSizeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedSizeHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(__int16 *)(a1 + 40));

  }
}

- (id)localizedTitleForPlainLink
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Plain Link"), CFSTR("Plain Link"), 0, 1);
}

- (id)localizedTitleForSize:(signed __int16)a3
{
  int v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = -[ICAttachmentSizeMenu isOverrideVariant](self, "isOverrideVariant");
  if ((_DWORD)v4)
  {
    switch(v3)
    {
      case 0:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Set All to Large");
        goto LABEL_14;
      case 2:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Set All to Medium");
        goto LABEL_14;
      case 1:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Set All to Small");
LABEL_14:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v4 = objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    switch(v3)
    {
      case 0:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Large");
        goto LABEL_14;
      case 2:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Medium");
        goto LABEL_14;
      case 1:
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Small");
        goto LABEL_14;
    }
  }
  return (id)v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (signed)preferredViewSize
{
  return self->_preferredViewSize;
}

- (void)setPreferredViewSize:(signed __int16)a3
{
  self->_preferredViewSize = a3;
}

- (NSArray)supportedSizes
{
  return self->_supportedSizes;
}

- (void)setSupportedSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsPlainLink
{
  return self->_supportsPlainLink;
}

- (BOOL)isOverrideVariant
{
  return self->_isOverrideVariant;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)selectedSizeHandler
{
  return self->_selectedSizeHandler;
}

- (void)setSelectedSizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)plainLinkHandler
{
  return self->_plainLinkHandler;
}

- (void)setPlainLinkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plainLinkHandler, 0);
  objc_storeStrong(&self->_selectedSizeHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_supportedSizes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)actionForSize:(__int16)a1 .cold.1(__int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Unable to determine label for attachment size: %hd", (uint8_t *)v2, 8u);
}

@end
