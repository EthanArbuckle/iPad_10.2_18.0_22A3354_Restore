@implementation PHPhotoLibrary(LimitedLibraryPicker)

- (uint64_t)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker
{
  return objc_msgSend(a1, "presentLimitedLibraryPickerFromViewController:completionHandler:", a3, &__block_literal_global_285);
}

- (void)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker completionHandler:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BDE35F0], "authorizationStatusForAccessLevel:", 2) == 4)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    +[PHLimitedLibraryPicker presentLimitedLibraryPicker:waitForDismissal:viewController:photoLibrary:completionHandler:](PHLimitedLibraryPicker, "presentLimitedLibraryPicker:waitForDismissal:viewController:photoLibrary:completionHandler:", &stru_24C62D0F8, 0, v6, a1, v8);

  }
  else
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D1E2000, v9, OS_LOG_TYPE_DEFAULT, "Limited library picker requires PHAuthorizationStatusLimited", v10, 2u);
    }

  }
}

@end
