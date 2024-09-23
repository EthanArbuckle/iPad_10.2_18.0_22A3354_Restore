@implementation CNPhotoAssetCreationHelper

+ (id)log
{
  if (log_cn_once_token_20_36398 != -1)
    dispatch_once(&log_cn_once_token_20_36398, &__block_literal_global_36399);
  return (id)log_cn_once_object_20_36400;
}

+ (void)createAssetFromImage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__36386;
  v18[4] = __Block_byref_object_dispose__36387;
  v19 = 0;
  v17 = 0;
  +[CNPhotoLibraryProvider photoLibraryWithError:](CNPhotoLibraryProvider, "photoLibraryWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke;
    v14[3] = &unk_1E204DD50;
    v15 = v5;
    v16 = v18;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke_2;
    v11[3] = &unk_1E204C610;
    v12 = v6;
    v13 = v18;
    objc_msgSend(v7, "performChanges:completionHandler:", v14, v11);

    v10 = v15;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Unable to create asset for photo library %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(v18, 8);
}

void __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend((Class)getPHAssetChangeRequestClass[0](), "creationRequestForAssetFromImage:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderForCreatedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __69__CNPhotoAssetCreationHelper_createAssetFromImage_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __33__CNPhotoAssetCreationHelper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoAssetCreationHelper");
  v1 = (void *)log_cn_once_object_20_36400;
  log_cn_once_object_20_36400 = (uint64_t)v0;

}

@end
