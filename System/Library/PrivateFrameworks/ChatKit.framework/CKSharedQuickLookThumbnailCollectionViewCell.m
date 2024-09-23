@implementation CKSharedQuickLookThumbnailCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedQuickLookThumbnailCollectionViewCell_reuseIdentifier");
}

+ (id)placeHolderImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (placeHolderImage_onceToken != -1)
    dispatch_once(&placeHolderImage_onceToken, block);
  return (id)placeHolderImage_placeHolder;
}

void __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[7];

  objc_msgSend((id)objc_opt_class(), "defaultSize");
  v3 = v2;
  v5 = v4;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v2, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke_2;
  v9[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v9[4] = v3;
  *(double *)&v9[5] = v5;
  v9[6] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "imageWithActions:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)placeHolderImage_placeHolder;
  placeHolderImage_placeHolder = v6;

}

void __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  CGContext *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;

  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a2;
  objc_msgSend(v3, "tableBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  v6 = (CGContext *)objc_msgSend(v4, "CGContext");
  v10.size.width = *(CGFloat *)(a1 + 32);
  v10.size.height = *(CGFloat *)(a1 + 40);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  CGContextFillRect(v6, v10);
  v7 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("ARKit"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "drawInRect:", *(double *)(a1 + 32) / 3.0, *(double *)(a1 + 40) / 3.0, *(double *)(a1 + 32) / 3.0, *(double *)(a1 + 32) / 3.0);
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSharedAssetCollectionViewCell formattedTitleFromPreviewTitle:](self, "formattedTitleFromPreviewTitle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v8);

  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  objc_msgSend(v10, "setMasksToBounds:", 1);
  objc_msgSend((id)objc_opt_class(), "placeHolderImage");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  +[CKPreviewDispatchCache detailsPreviewCache](CKPreviewDispatchCache, "detailsPreviewCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__CKSharedQuickLookThumbnailCollectionViewCell_configureWithAttachmentItem___block_invoke;
  v16[3] = &unk_1E2756868;
  v17 = v13;
  v18 = v10;
  v14 = v10;
  v15 = v13;
  objc_msgSend(v4, "generatePreviewWithCompletion:", v16);

}

void __76__CKSharedQuickLookThumbnailCollectionViewCell_configureWithAttachmentItem___block_invoke(uint64_t a1, id a2)
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(objc_retainAutorelease(a2), "CGImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    if (v3 < -0.1)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "contents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFromValue:", v5);

      objc_msgSend(v4, "setToValue:", v6);
      objc_msgSend(v4, "setDuration:", 0.12);
      objc_msgSend(*(id *)(a1 + 40), "addAnimation:forKey:", v4, CFSTR("contents"));

    }
    objc_msgSend(*(id *)(a1 + 40), "setContents:", v6);

  }
}

@end
