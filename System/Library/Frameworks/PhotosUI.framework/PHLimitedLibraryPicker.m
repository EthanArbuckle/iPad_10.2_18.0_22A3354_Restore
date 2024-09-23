@implementation PHLimitedLibraryPicker

+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4 viewController:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PHLimitedLibraryPickerDelegate *v15;
  uint64_t v16;
  PHLimitedLibraryPickerDelegate *v17;
  dispatch_block_t v18;
  id v19;
  id v20;
  PHLimitedLibraryPickerDelegate *v21;
  id v22;
  void (**v23)(_QWORD);
  NSObject *v24;
  __int16 v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD aBlock[4];
  id v29;
  id v30;
  PHLimitedLibraryPickerDelegate *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD block[4];
  PHLimitedLibraryPickerDelegate *v39;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(PHLimitedLibraryPickerDelegate);
  v16 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke;
  block[3] = &unk_24C62C670;
  v17 = v15;
  v39 = v17;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  -[PHLimitedLibraryPickerDelegate setDismissalBlock:](v17, "setDismissalBlock:", v18);
  -[PHLimitedLibraryPickerDelegate setFinishedPickingBlock:](v17, "setFinishedPickingBlock:", v14);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_20;
  aBlock[3] = &unk_24C62C470;
  v19 = v13;
  v29 = v19;
  v20 = v11;
  v30 = v20;
  v21 = v17;
  v31 = v21;
  v22 = v12;
  v32 = v22;
  v33 = &v34;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v23[2](v23);
  }
  else
  {
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_25;
    v26[3] = &unk_24C62C498;
    v27 = v23;
    dispatch_sync(MEMORY[0x24BDAC9B8], v26);

  }
  if (*((_BYTE *)v35 + 24) && v10)
  {
    dispatch_block_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = 0;
      _os_log_impl(&dword_20D1E2000, v24, OS_LOG_TYPE_DEBUG, "Limited library picker done", (uint8_t *)&v25, 2u);
    }

  }
  _Block_object_dispose(&v34, 8);

}

+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  __int16 v15;
  uint8_t buf[2];

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstKeyWindow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "topmostPresentedViewController:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;

LABEL_7:
      objc_msgSend(MEMORY[0x24BDE35F0], "imagePickerPhotoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "presentLimitedLibraryPicker:waitForDismissal:viewController:photoLibrary:completionHandler:", v6, v4, v11, v14, 0);

      goto LABEL_11;
    }
    objc_msgSend(v8, "rootViewController");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_7;
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = "Failed to access application top most view controller, unable to present library picker";
    v13 = buf;
LABEL_10:
    _os_log_impl(&dword_20D1E2000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_11;
  }
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v15 = 0;
    v12 = "Failed to access application key window, unable to present library picker";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
LABEL_11:

}

+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4
{
  objc_msgSend(a1, "presentLimitedLibraryPickerFromViewController:options:completionHandler:", a3, a4, 0);
}

+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PHLimitedLibraryPickerClientApplicationIdentifier"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE35F0], "imagePickerPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentLimitedLibraryPicker:waitForDismissal:viewController:photoLibrary:completionHandler:", v11, 0, v9, v10, v8);

}

+ (id)firstKeyWindow:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "connectedScenes");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 0x24BEBD000uLL;
    v19 = v3;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "activationState") != -1)
      {
        v10 = v9;
        objc_msgSend(v10, "windows");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = v11;
        v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v7;
          v15 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v17, "isKeyWindow"))
              {
                v13 = v17;
                goto LABEL_18;
              }
            }
            v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v13)
              continue;
            break;
          }
LABEL_18:
          v7 = v14;
          v3 = v19;
        }

        if (v13)
          break;
      }
      if (++v8 == v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    v13 = 0;
  }

  return v13;
}

+ (id)topmostPresentedViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "setDismissalBlock:", 0);
  PLBackendGetLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20D1E2000, v1, OS_LOG_TYPE_DEBUG, "Presented limited library dismissed", v2, 2u);
  }

}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_20(_QWORD *a1)
{
  NSObject *v2;
  PHPickerConfiguration *v3;
  PHPickerViewController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D1E2000, v2, OS_LOG_TYPE_DEBUG, "Preparing to show limited library picker", buf, 2u);
  }

  v3 = -[PHPickerConfiguration initWithPhotoLibraryAndOnlyReturnsIdentifiers:]([PHPickerConfiguration alloc], "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", a1[4]);
  -[PHPickerConfiguration setSelectionLimit:](v3, "setSelectionLimit:", 0);
  -[PHPickerConfiguration _setPurposedLimitedLibraryApplicationIdentifier:](v3, "_setPurposedLimitedLibraryApplicationIdentifier:", a1[5]);
  -[PHPickerConfiguration _setDisabledPrivateCapabilities:](v3, "_setDisabledPrivateCapabilities:", 7);
  v4 = -[PHPickerViewController initWithConfiguration:]([PHPickerViewController alloc], "initWithConfiguration:", v3);
  v5 = a1[6];
  -[PHPickerViewController presentationController](v4, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  -[PHPickerViewController setDelegate:](v4, "setDelegate:", a1[6]);
  v7 = (void *)a1[7];
  if (v7)
  {
    objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, &__block_literal_global_979);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_ERROR, "Failed to determine root view controller", v9, 2u);
    }

  }
}

uint64_t __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_23()
{
  NSObject *v0;
  uint8_t v1[16];

  PLBackendGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20D1E2000, v0, OS_LOG_TYPE_DEBUG, "Presented limited library picker", v1, 2u);
  }

}

@end
