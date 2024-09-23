@implementation CNAvatarImageGenerator

+ (id)imageDataFromMetadata:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_21364;
  v22 = getAVTAvatarRecordImageProviderClass_softClass_21364;
  if (!getAVTAvatarRecordImageProviderClass_softClass_21364)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getAVTAvatarRecordImageProviderClass_block_invoke_21365;
    v17 = &unk_1E204EBC0;
    v18 = &v19;
    __getAVTAvatarRecordImageProviderClass_block_invoke_21365((uint64_t)&v14);
    v4 = (void *)v20[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v19, 8);
  v6 = objc_alloc_init(v5);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v7 = (void *)getAVTRenderingScopeClass_softClass_21366;
  v22 = getAVTRenderingScopeClass_softClass_21366;
  if (!getAVTRenderingScopeClass_softClass_21366)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getAVTRenderingScopeClass_block_invoke_21367;
    v17 = &unk_1E204EBC0;
    v18 = &v19;
    __getAVTRenderingScopeClass_block_invoke_21367((uint64_t)&v14);
    v7 = (void *)v20[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v8, "largeThumbnailScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForRecord:scope:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "HEICRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)imageDataFromMetadata:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v10 = (void *)getAVTStickerGeneratorClass_softClass;
  v31 = getAVTStickerGeneratorClass_softClass;
  v11 = MEMORY[0x1E0C809B0];
  if (!getAVTStickerGeneratorClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getAVTStickerGeneratorClass_block_invoke;
    v26 = &unk_1E204EBC0;
    v27 = &v28;
    __getAVTStickerGeneratorClass_block_invoke((uint64_t)&v23);
    v10 = (void *)v29[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v28, 8);
  v13 = [v12 alloc];
  objc_msgSend(v8, "avatar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithAvatar:", v14);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v16 = (void *)getAVTStickerGeneratorPosterOptionsClass_softClass;
  v31 = getAVTStickerGeneratorPosterOptionsClass_softClass;
  if (!getAVTStickerGeneratorPosterOptionsClass_softClass)
  {
    v23 = v11;
    v24 = 3221225472;
    v25 = __getAVTStickerGeneratorPosterOptionsClass_block_invoke;
    v26 = &unk_1E204EBC0;
    v27 = &v28;
    __getAVTStickerGeneratorPosterOptionsClass_block_invoke((uint64_t)&v23);
    v16 = (void *)v29[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v28, 8);
  v18 = objc_alloc_init(v17);
  objc_msgSend(v18, "setSize:", width, height);
  objc_msgSend(v8, "poseConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __71__CNAvatarImageGenerator_imageDataFromMetadata_size_completionHandler___block_invoke;
  v21[3] = &unk_1E204A2F0;
  v22 = v9;
  v20 = v9;
  objc_msgSend(v15, "posterWithConfiguration:options:completionHandler:", v19, v18, v21);

}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 scaleMultiplier:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;

  v5 = a3;
  +[CNAvatarImageUtilities trimmedImageByTrimmingTransparentPixelsFromImage:](CNAvatarImageUtilities, "trimmedImageByTrimmingTransparentPixelsFromImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7 / a4;
  objc_msgSend(v6, "size");
  v10 = v9 / a4;
  v11 = objc_alloc_init(MEMORY[0x1E0DC3830]);
  objc_msgSend(v11, "setOpaque:", 0);
  objc_msgSend(v5, "scale");
  v13 = v12;

  objc_msgSend(v11, "setScale:", v13);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v11, v8, v10);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__CNAvatarImageGenerator_croppedAndCenteredAvatarImageForImage_scaleMultiplier___block_invoke;
  v18[3] = &unk_1E204A318;
  v20 = 0;
  v21 = 0;
  v19 = v6;
  v22 = v8;
  v23 = v10;
  v15 = v6;
  objc_msgSend(v14, "imageWithActions:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __80__CNAvatarImageGenerator_croppedAndCenteredAvatarImageForImage_scaleMultiplier___block_invoke(uint64_t a1)
{
  void *v2;
  double MidX;
  double v4;
  double v5;
  double MidY;
  double v7;

  v2 = *(void **)(a1 + 32);
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "size");
  v5 = MidX - v4 * 0.5;
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(v2, "drawAtPoint:", v5, MidY - v7 * 0.5);
}

void __71__CNAvatarImageGenerator_imageDataFromMetadata_size_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "HEICRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
