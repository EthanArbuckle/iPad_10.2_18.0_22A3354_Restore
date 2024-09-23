@implementation UIImagePickerController(AppleAccountUI)

+ (id)aaui_fixedCropRect:()AppleAccountUI forOriginalImage:
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  void *v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  NSObject *v37;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v7 < 0.0)
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v16;
      v41 = 2112;
      v42 = &unk_1EA31E860;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect left %@ outside originalImage left %@", (uint8_t *)&v39, 0x16u);

    }
    v12 = v12 + v8;
    v8 = 0.0;
  }
  objc_msgSend(v6, "size");
  if (v12 + v8 > v17)
  {
    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 + v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "size");
      objc_msgSend(v20, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v19;
      v41 = 2112;
      v42 = v21;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect right %@ outside originalImage right %@", (uint8_t *)&v39, 0x16u);

    }
    objc_msgSend(v6, "size");
    v12 = v22 - v8;
  }
  if (v10 < 0.0)
  {
    _AAUILogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v24;
      v41 = 2112;
      v42 = &unk_1EA31E860;
      _os_log_impl(&dword_1DB4ED000, v23, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect top %@ outside originalImage top %@", (uint8_t *)&v39, 0x16u);

    }
    v14 = v14 + v10;
    v10 = 0.0;
  }
  objc_msgSend(v6, "size");
  if (v14 + v10 > v25)
  {
    _AAUILogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 + v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "size");
      objc_msgSend(v28, "numberWithDouble:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v27;
      v41 = 2112;
      v42 = v30;
      _os_log_impl(&dword_1DB4ED000, v26, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect bottom %@ outside originalImage bottom %@", (uint8_t *)&v39, 0x16u);

    }
    objc_msgSend(v6, "size");
    v14 = v31 - v10;
  }
  objc_msgSend(v5, "CGRectValue");
  v45.origin.x = v32;
  v45.origin.y = v33;
  v45.size.width = v34;
  v45.size.height = v35;
  v44.origin.x = v8;
  v44.origin.y = v10;
  v44.size.width = v12;
  v44.size.height = v14;
  if (CGRectEqualToRect(v44, v45))
  {
    v36 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v8, v10, v12, v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138412290;
      v40 = v36;
      _os_log_impl(&dword_1DB4ED000, v37, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: returning fixed cropRect %@", (uint8_t *)&v39, 0xCu);
    }

  }
  return v36;
}

@end
