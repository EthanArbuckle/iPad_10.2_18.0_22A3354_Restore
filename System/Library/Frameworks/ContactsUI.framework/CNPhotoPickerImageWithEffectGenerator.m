@implementation CNPhotoPickerImageWithEffectGenerator

+ (id)coreImageFilterNames
{
  return &unk_1E20D39A0;
}

+ (id)coreImageFilterDisplayNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("CIPhotoEffect3DVivid");
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_VIVID_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = CFSTR("CIPhotoEffect3DVividWarm");
  CNContactsUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_VIVIDWARM_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  v22[2] = CFSTR("CIPhotoEffect3DVividCool");
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_VIVIDCOOL_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  v22[3] = CFSTR("CIPhotoEffect3DDramatic");
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_DRAMATIC_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  v22[4] = CFSTR("CIPhotoEffect3DDramaticWarm");
  CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_DRAMATICWARM_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v2;
  v22[5] = CFSTR("CIPhotoEffect3DDramaticCool");
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_DRAMATICCOOL_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v4;
  v22[6] = CFSTR("CIPhotoEffectMono");
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_MONO_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v6;
  v22[7] = CFSTR("CIPhotoEffect3DSilverplate");
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_SILVERTONE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v8;
  v22[8] = CFSTR("CIPhotoEffect3DNoir");
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_NOIR_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)displayNameForFilterNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "coreImageFilterDisplayNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)imagesByApplyingEffectsToImageData:(id)a3 withScaleFactor:(double)a4 originalImageScale:(double)a5 cropRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  void (**v14)(id, void *, _QWORD, double, double, double, double);
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = (void (**)(id, void *, _QWORD, double, double, double, double))a7;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:", a3);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v15;
  objc_msgSend(v16, "setValue:forKey:", v15, CFSTR("inputImage"));
  v17 = a4 / a5;
  *(float *)&v17 = a4 / a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("inputScale"));

  objc_msgSend(v16, "setValue:forKey:", &unk_1E20D2D38, CFSTR("inputAspectRatio"));
  v28 = v16;
  objc_msgSend(v16, "valueForKey:", CFSTR("outputImage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)objc_opt_class(), "coreImageFilterNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25);
        objc_msgSend((id)objc_opt_class(), "imageByApplyingEffect:withContext:toImage:withSize:", v26, v20, v19, width, height);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v27, v26, x, y, width, height);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v23);
  }

}

+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImageData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "size");
  objc_msgSend(v10, "imageByApplyingEffect:withContext:toImage:withSize:", v9, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)imageByApplyingEffect:(id)a3 withContext:(id)a4 toImage:(id)a5 withSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];

  height = a6.height;
  width = a6.width;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  objc_msgSend(v12, "imageByApplyingFilter:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "createCGImage:fromRect:", v14, 0.0, 0.0, width, height);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke;
  v22[3] = &__block_descriptor_40_e5_v8__0l;
  v22[4] = v15;
  v16 = (void *)objc_msgSend(v22, "copy");
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _Block_copy(v17);
  objc_msgSend(v13, "push:", v18);

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "popAllWithHandler:", &__block_literal_global_60955);
  v20 = (id)objc_opt_self();

  return v19;
}

void __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke(uint64_t a1)
{
  CGImageRelease(*(CGImageRef *)(a1 + 32));
}

uint64_t __92__CNPhotoPickerImageWithEffectGenerator_imageByApplyingEffect_withContext_toImage_withSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end
