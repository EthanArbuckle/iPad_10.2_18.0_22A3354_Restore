@implementation CAMFrameworkUtilities

+ (id)snapshotForCrossFadingView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7 embedSnapshot:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v8 = a8;
  v13 = a3;
  objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v14, "setBounds:");
  objc_msgSend(v13, "center");
  objc_msgSend(v14, "setCenter:");
  if (v13)
  {
    objc_msgSend(v13, "transform");
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
  }
  v30[0] = v31;
  v30[1] = v32;
  v30[2] = v33;
  objc_msgSend(v14, "setTransform:", v30);
  if (v8)
  {
    objc_msgSend(v13, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v14);

  }
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke;
  v28[3] = &unk_1EA328868;
  v29 = v14;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_2;
  v26[3] = &unk_1EA328A68;
  v18 = v29;
  v27 = v18;
  objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 0, v28, v26, a4, a5);
  objc_msgSend(v13, "setAlpha:", 0.0);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_3;
  v24[3] = &unk_1EA328868;
  v25 = v13;
  v20 = v13;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 2, v24, 0, a6, a7);
  v21 = v25;
  v22 = v18;

  return v22;
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

+ (BOOL)isPasscodeLocked
{
  void *v2;
  unsigned int v3;
  char v4;
  _BOOL4 v5;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("ExtendedDeviceLockState");
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MKBGetDeviceLockState();
  v4 = v3;
  v5 = v3 < 7;

  return v5 & (0x46u >> v4);
}

+ (BOOL)isPhotosAppLocked
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CF9680], "applicationWithBundleIdentifier:", CFSTR("com.apple.mobileslideshow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isLocked");
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[CAMFrameworkUtilities isPhotosAppLocked].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

+ (void)isPhotosAppLocked
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = CFSTR("com.apple.mobileslideshow");
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "App not found with bundle identifier: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
