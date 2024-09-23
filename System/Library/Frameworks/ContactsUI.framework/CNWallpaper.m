@implementation CNWallpaper

uint64_t __85__CNWallpaper_UIAdditions__reducedSizePosterArchiveDataFromData_posterConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a2, 0);
}

void __54__CNWallpaper_Snapshotting__snapshotImageDataForWatch__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:error:", v2, 0);

}

void __96__CNWallpaper_Snapshotting__snapshotDataFromSnapshotImage_forSize_topPadding_extensionBundleID___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGImage *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  CGContext *v12;
  void *v13;
  double v14;
  double v15;
  CGContext *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17 = a2;
  v3 = (CGContext *)objc_msgSend(v17, "CGContext");
  objc_msgSend(v17, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = 0.0;
  CGContextTranslateCTM(v3, 0.0, v6);

  CGContextScaleCTM((CGContextRef)objc_msgSend(v17, "CGContext"), 1.0, -1.0);
  v18.size.width = *(CGFloat *)(a1 + 40);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.height = 1.0;
  v7 = CGImageCreateWithImageInRect(*(CGImageRef *)(a1 + 32), v18);
  objc_msgSend(v17, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9 - *(double *)(a1 + 48);

  if (v10 > 0.0)
  {
    v11 = 1;
    do
    {
      v12 = (CGContext *)objc_msgSend(v17, "CGContext");
      v19.size.width = *(CGFloat *)(a1 + 40);
      v19.origin.y = v5 + *(double *)(a1 + 48);
      v19.origin.x = 0.0;
      v19.size.height = 1.0;
      CGContextDrawImage(v12, v19, v7);
      v5 = (double)v11;
      objc_msgSend(v17, "format");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14 - *(double *)(a1 + 48);

      ++v11;
    }
    while (v15 > v5);
  }
  v16 = (CGContext *)objc_msgSend(v17, "CGContext");
  v20.size.width = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 32));
  v20.size.height = *(CGFloat *)(a1 + 48);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextDrawImage(v16, v20, *(CGImageRef *)(a1 + 32));
  CGImageRelease(v7);

}

void __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!a3 || v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v20;
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Failed to snapshot poster with error: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_8;
    v26[3] = &unk_1E204FB40;
    v27 = *(id *)(a1 + 56);
    objc_msgSend(v17, "performBlock:", v26);

    v11 = v27;
  }
  else
  {
    objc_msgSend(a3, "snapshotBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "levelSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshotForLevelSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "snapshotDataFromSnapshotImage:forSize:topPadding:extensionBundleID:", v11, *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_2;
      v21[3] = &unk_1E204F9B0;
      v14 = *(id *)(a1 + 56);
      v22 = v12;
      v23 = v14;
      v15 = v12;
      objc_msgSend(v13, "performBlock:", v21);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Snapshot of poster returned nil", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_9;
      v24[3] = &unk_1E204FB40;
      v25 = *(id *)(a1 + 56);
      objc_msgSend(v19, "performBlock:", v24);

      v15 = v25;
    }

  }
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __32__CNWallpaper_Snapshotting__log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNWallpaper+CNSnapshotting");
  v1 = (void *)log_cn_once_object_4_46402;
  log_cn_once_object_4_46402 = (uint64_t)v0;

}

@end
