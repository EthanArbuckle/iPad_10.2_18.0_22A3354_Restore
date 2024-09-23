@implementation DOCThumbnailFolderIcon

+ (id)_folderIconsForImageNamePattern:(id)a3 documentsBadgeNamePattern:(id)a4 desktopBadgeNamePattern:(id)a5 sharedBadgeNamePattern:(id)a6 downloadsBadgeNamePattern:(id)a7 genericSharepointBadgeNamePattern:(id)a8
{
  uint64_t i;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  DOCThumbnailFolderIcon *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v24 = a7;
  v23 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 14);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 14; ++i)
  {
    v14 = *(double *)&qword_2172D3930[i];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%u"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%u"), 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%u"), 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, CFSTR("%u"), 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%u"), 0, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%u"), 0, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[DOCThumbnailFolderIcon initWithImageName:documentsBadgeName:dekstopBadgeName:sharedBadgeName:downloadsBadgeName:genericSharepointBadgeName:imageDimension:badgeDimension:badgeBottomInset:sharedBadgeDimension:sharedBadgeBottomInset:]([DOCThumbnailFolderIcon alloc], "initWithImageName:documentsBadgeName:dekstopBadgeName:sharedBadgeName:downloadsBadgeName:genericSharepointBadgeName:imageDimension:badgeDimension:badgeBottomInset:sharedBadgeDimension:sharedBadgeBottomInset:", v15, v16, v17, v18, v19, v20, v14, *(double *)&qword_2172D39A0[i], *(double *)&qword_2172D3A80[i], *(double *)&qword_2172D3A10[i], *(double *)&qword_2172D3AF0[i]);
    objc_msgSend(v25, "addObject:", v21);

  }
  return v25;
}

- (DOCThumbnailFolderIcon)initWithImageName:(id)a3 documentsBadgeName:(id)a4 dekstopBadgeName:(id)a5 sharedBadgeName:(id)a6 downloadsBadgeName:(id)a7 genericSharepointBadgeName:(id)a8 imageDimension:(double)a9 badgeDimension:(double)a10 badgeBottomInset:(double)a11 sharedBadgeDimension:(double)a12 sharedBadgeBottomInset:(double)a13
{
  id v25;
  id v26;
  id v27;
  DOCThumbnailFolderIcon *v28;
  DOCThumbnailFolderIcon *v29;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v31 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v34.receiver = self;
  v34.super_class = (Class)DOCThumbnailFolderIcon;
  v28 = -[DOCThumbnailFolderIcon init](&v34, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_imageName, a3);
    v29->_imageDimension = a9;
    objc_storeStrong((id *)&v29->_documentsBadgeName, a4);
    objc_storeStrong((id *)&v29->_desktopBadgeName, a5);
    objc_storeStrong((id *)&v29->_sharedBadgeName, a6);
    objc_storeStrong((id *)&v29->_downloadsBadgeName, a7);
    objc_storeStrong((id *)&v29->_genericSharepointBadgeName, a8);
    v29->_bottomInset = a11;
    v29->_sharedBadgeBottomInset = a13;
    v29->_badgeSize.width = a10;
    v29->_badgeSize.height = a10;
    v29->_sharedBadgeSize.width = a12;
    v29->_sharedBadgeSize.height = a12;
  }

  return v29;
}

uint64_t __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_folderIconForSize_scale__folderIconCache;
  _folderIconForSize_scale__folderIconCache = (uint64_t)v0;

  return objc_msgSend((id)_folderIconForSize_scale__folderIconCache, "setCountLimit:", 10);
}

void __37__DOCThumbnailFolderIcon_folderIcons__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_folderIconsForImageNamePattern:documentsBadgeNamePattern:desktopBadgeNamePattern:sharedBadgeNamePattern:downloadsBadgeNamePattern:genericSharepointBadgeNamePattern:", CFSTR("Folder%upt"), CFSTR("DocumentsFolder%upt"), CFSTR("DesktopFolder%upt"), CFSTR("SharedFolder%upt"), CFSTR("DownloadsFolder%upt"), CFSTR("GenericSharepointFolder%upt"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)folderIcons_folderIcons;
  folderIcons_folderIcons = v1;

}

- (void)resolveImage
{
  __assert_rtn("-[DOCThumbnailFolderIcon resolveImage]", "DOCThumbnailFolderIcon.m", 252, "_imageName != NULL");
}

- (UIImage)plainFolderImage
{
  return self->_plainFolderImage;
}

- (id)plainFolderImageWithStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[DOCThumbnailFolderIcon plainFolderImage](self, "plainFolderImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithStyle:assetImage:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)imageDimension
{
  return self->_imageDimension;
}

+ (id)imageWithStyle:(unint64_t)a3 assetImage:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[5];

  v7 = a4;
  objc_msgSend(v7, "imageAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCThumbnailFolderIcon.m"), 264, CFSTR("Image has to load from xcasset."));

  }
  if (a3)
    v9 = 1;
  else
    v9 = 2;
  objc_msgSend(v7, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceStyle") == v9)
  {
    v11 = v7;
  }
  else
  {
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v13 = v12;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __52__DOCThumbnailFolderIcon_imageWithStyle_assetImage___block_invoke;
    v18[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v18[4] = v9;
    objc_msgSend(v12, "traitCollectionByModifyingTraits:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "imageAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithTraitCollection:", v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)folderIcons
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__DOCThumbnailFolderIcon_folderIcons__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (folderIcons_onceToken != -1)
    dispatch_once(&folderIcons_onceToken, block);
  return (id)folderIcons_folderIcons;
}

+ (id)folderIconForDescriptor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "scale");
  v10 = v9;

  return (id)objc_msgSend(a1, "_folderIconForSize:scale:", v6, v8, v10);
}

+ (id)_folderIconForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v18;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x24BDAC8D0];
  if (_folderIconForSize_scale__onceToken != -1)
    dispatch_once(&_folderIconForSize_scale__onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height + width * 100000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_folderIconForSize_scale__folderIconCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(a1, "folderIcons");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
LABEL_7:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
        objc_msgSend(v15, "imageDimension");
        if (vabdd_f64(width, v16) < 1.0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v12)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v17 = v15;

      if (v17)
        goto LABEL_19;
    }
    else
    {
LABEL_13:

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke_2;
    v20[3] = &__block_descriptor_48_e39_B32__0__DOCThumbnailFolderIcon_8Q16_B24l;
    *(double *)&v20[4] = width;
    *(double *)&v20[5] = height;
    v18 = objc_msgSend(v10, "indexOfObjectPassingTest:", v20);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "lastObject");
    else
      objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    objc_msgSend(v17, "resolveImage");
    objc_msgSend((id)_folderIconForSize_scale__folderIconCache, "setObject:forKey:", v17, v7);
    v9 = v17;

  }
  return v9;
}

BOOL __51__DOCThumbnailFolderIcon__folderIconForSize_scale___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  _BOOL8 result;

  objc_msgSend(a2, "imageDimension");
  result = v6 >= *(double *)(a1 + 32);
  *a4 = result;
  return result;
}

- (UIImage)documentsBadge
{
  UIImage *documentsBadge;
  void *v4;
  NSString *documentsBadgeName;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  documentsBadge = self->_documentsBadge;
  if (!documentsBadge)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    documentsBadgeName = self->_documentsBadgeName;
    DOCFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", documentsBadgeName, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_documentsBadge;
    self->_documentsBadge = v7;

    documentsBadge = self->_documentsBadge;
  }
  return documentsBadge;
}

- (UIImage)desktopBadge
{
  UIImage *desktopBadge;
  void *v4;
  NSString *desktopBadgeName;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  desktopBadge = self->_desktopBadge;
  if (!desktopBadge)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    desktopBadgeName = self->_desktopBadgeName;
    DOCFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", desktopBadgeName, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_desktopBadge;
    self->_desktopBadge = v7;

    desktopBadge = self->_desktopBadge;
  }
  return desktopBadge;
}

- (UIImage)sharedBadge
{
  UIImage *sharedBadge;
  void *v4;
  NSString *sharedBadgeName;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  sharedBadge = self->_sharedBadge;
  if (!sharedBadge)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    sharedBadgeName = self->_sharedBadgeName;
    DOCFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", sharedBadgeName, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sharedBadge;
    self->_sharedBadge = v7;

    sharedBadge = self->_sharedBadge;
  }
  return sharedBadge;
}

- (UIImage)downloadsBadge
{
  UIImage *downloadsBadge;
  void *v4;
  NSString *downloadsBadgeName;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  downloadsBadge = self->_downloadsBadge;
  if (!downloadsBadge)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    downloadsBadgeName = self->_downloadsBadgeName;
    DOCFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", downloadsBadgeName, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_downloadsBadge;
    self->_downloadsBadge = v7;

    downloadsBadge = self->_downloadsBadge;
  }
  return downloadsBadge;
}

- (UIImage)genericSharepointBadge
{
  UIImage *genericSharepointBadge;
  void *v4;
  NSString *genericSharepointBadgeName;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  genericSharepointBadge = self->_genericSharepointBadge;
  if (!genericSharepointBadge)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    genericSharepointBadgeName = self->_genericSharepointBadgeName;
    DOCFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", genericSharepointBadgeName, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_genericSharepointBadge;
    self->_genericSharepointBadge = v7;

    genericSharepointBadge = self->_genericSharepointBadge;
  }
  return genericSharepointBadge;
}

- (id)image
{
  -[DOCThumbnailFolderIcon resolveImage](self, "resolveImage");
  return self->_plainFolderImage;
}

uint64_t __52__DOCThumbnailFolderIcon_imageWithStyle_assetImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (id)badgedFolderIconForFolderType:(unint64_t)a3 style:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[DOCThumbnailFolderIcon badgeForFolderType:](self, "badgeForFolderType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCThumbnailFolderIcon badgeSizeForFolderType:](self, "badgeSizeForFolderType:", a3);
  v9 = v8;
  v11 = v10;
  -[DOCThumbnailFolderIcon bottomInsetForFolderType:](self, "bottomInsetForFolderType:", a3);
  -[DOCThumbnailFolderIcon _badgedFolderIconForBadge:badgeSize:bottomInset:style:](self, "_badgedFolderIconForBadge:badgeSize:bottomInset:style:", v7, a4, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)badgedFolderIconForBadge:(id)a3 style:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v6 = a3;
  -[DOCThumbnailFolderIcon badgeSize](self, "badgeSize");
  v8 = v7;
  v10 = v9;
  -[DOCThumbnailFolderIcon bottomInset](self, "bottomInset");
  -[DOCThumbnailFolderIcon _badgedFolderIconForBadge:badgeSize:bottomInset:style:](self, "_badgedFolderIconForBadge:badgeSize:bottomInset:style:", v6, a4, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_badgedFolderIconForBadge:(id)a3 badgeSize:(CGSize)a4 bottomInset:(double)a5 style:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  double v28;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void *)objc_opt_class();
  -[DOCThumbnailFolderIcon plainFolderImage](self, "plainFolderImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithStyle:assetImage:", a6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "imageWithStyle:assetImage:", a6, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x24BDF6AA0]);
  objc_msgSend(v14, "scale");
  objc_msgSend(v16, "setScale:");
  v17 = objc_alloc(MEMORY[0x24BDF6A98]);
  objc_msgSend(v14, "size");
  v18 = (void *)objc_msgSend(v17, "initWithSize:format:", v16);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __80__DOCThumbnailFolderIcon__badgedFolderIconForBadge_badgeSize_bottomInset_style___block_invoke;
  v23[3] = &unk_24D72ACC0;
  v26 = width;
  v27 = height;
  v28 = a5;
  v24 = v14;
  v25 = v15;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v18, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __80__DOCThumbnailFolderIcon__badgedFolderIconForBadge_badgeSize_bottomInset_style___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  CGContext *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "size");
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v3, v4, v7, v8);
  v9 = (CGContext *)objc_msgSend(v6, "CGContext");

  CGContextSaveGState(v9);
  objc_msgSend(*(id *)(a1 + 32), "size");
  UIRectCenteredXInRect();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v11, v16 - *(double *)(a1 + 64) - *(double *)(a1 + 56), v13, v15);
  CGContextRestoreGState(v9);
}

- (id)badgeForFolderType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 2uLL:
      -[DOCThumbnailFolderIcon desktopBadge](self, "desktopBadge", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[DOCThumbnailFolderIcon documentsBadge](self, "documentsBadge", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[DOCThumbnailFolderIcon downloadsBadge](self, "downloadsBadge", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      -[DOCThumbnailFolderIcon sharedBadge](self, "sharedBadge", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      -[DOCThumbnailFolderIcon genericSharepointBadge](self, "genericSharepointBadge", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (CGSize)badgeSize
{
  double v2;
  double v3;
  CGSize result;

  -[DOCThumbnailFolderIcon badgeSizeForFolderType:](self, "badgeSizeForFolderType:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)badgeSizeForFolderType:(unint64_t)a3
{
  double *p_width;
  double *v4;
  CGSize *p_badgeSize;
  CGFloat *p_height;
  double v7;
  double v8;
  CGSize result;

  p_width = (double *)MEMORY[0x24BDBF148];
  v4 = (double *)(MEMORY[0x24BDBF148] + 8);
  p_badgeSize = &self->_badgeSize;
  p_height = &self->_badgeSize.height;
  if (a3 == 5)
  {
    p_badgeSize = &self->_sharedBadgeSize;
    p_height = &self->_sharedBadgeSize.height;
  }
  if (a3)
  {
    p_width = &p_badgeSize->width;
    v4 = p_height;
  }
  v7 = *v4;
  v8 = *p_width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)bottomInset
{
  double result;

  -[DOCThumbnailFolderIcon bottomInsetForFolderType:](self, "bottomInsetForFolderType:", 1);
  return result;
}

- (double)bottomInsetForFolderType:(unint64_t)a3
{
  uint64_t v3;

  if (!a3)
    return 0.0;
  v3 = 16;
  if (a3 != 5)
    v3 = 8;
  return *(double *)((char *)&self->super.isa + v3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainFolderImage, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_genericSharepointBadge, 0);
  objc_storeStrong((id *)&self->_downloadsBadge, 0);
  objc_storeStrong((id *)&self->_sharedBadge, 0);
  objc_storeStrong((id *)&self->_desktopBadge, 0);
  objc_storeStrong((id *)&self->_documentsBadge, 0);
  objc_storeStrong((id *)&self->_genericSharepointBadgeName, 0);
  objc_storeStrong((id *)&self->_downloadsBadgeName, 0);
  objc_storeStrong((id *)&self->_sharedBadgeName, 0);
  objc_storeStrong((id *)&self->_desktopBadgeName, 0);
  objc_storeStrong((id *)&self->_documentsBadgeName, 0);
}

@end
