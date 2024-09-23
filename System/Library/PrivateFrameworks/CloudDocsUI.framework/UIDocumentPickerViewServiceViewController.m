@implementation UIDocumentPickerViewServiceViewController

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  if (a3)
  {
    v4 = a3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2;
    block[3] = &unk_24E43AD30;
    v11 = v4;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v12 = v5;
    v13 = v6;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "hostingViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_didSelectURLBookmark:", a2);

  }
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2(uint64_t a1)
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
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("The file could not be made available to the application. (%@)"), CFSTR("The file could not be made available to the application. (%@)"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Failed to make file available"), CFSTR("Failed to make file available"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  cdui_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 32), v11);

  v12 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Dismiss"), CFSTR("Dismiss"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_88;
  v16[3] = &unk_24E43B378;
  v16[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v10, 1, &__block_literal_global_11);
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_88(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hostingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_dismissViewController");

}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v9)
  {
    cdui_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_2(a1, (uint64_t)v9, v13);

    objc_msgSend(*(id *)(a1 + 40), "hostingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_dismissViewController");
  }
  else
  {
    v15 = (id *)(a1 + 40);
    if (objc_msgSend(*(id *)(a1 + 40), "pickerMode") == 3)
    {
      cdui_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "uploadURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v31 = v17;
        v32 = 2112;
        v33 = v18;
        v34 = 2112;
        v35 = v19;
        _os_log_impl(&dword_21F506000, v16, OS_LOG_TYPE_INFO, "[INFO] File %@ has been written to %@ by provider %@. Removing original file since we are in Move mode.", buf, 0x20u);

      }
      v20 = objc_alloc_init(MEMORY[0x24BDD1570]);
      objc_msgSend(*v15, "uploadURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_95;
      v28[3] = &unk_24E43B580;
      v28[4] = *v15;
      objc_msgSend(v20, "coordinateWritingItemAtURL:options:error:byAccessor:", v21, 1, &v29, v28);
      v22 = v29;

      if (v22)
      {
        cdui_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_1((id *)(a1 + 40), (uint64_t)v22, v23);

      }
    }
    objc_msgSend(MEMORY[0x24BDF70A8], "assembleURL:sandbox:physicalURL:physicalSandbox:", *(_QWORD *)(a1 + 32), v10, v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "ui_setIsFileProviderURL:", 1);
    cdui_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *(void **)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v31 = v25;
      v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_21F506000, v24, OS_LOG_TYPE_INFO, "[INFO] Returning selected URL %@ to host app %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "hostingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF70A8], "wrapperWithURL:", *(_QWORD *)(a1 + 32));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_didSelectURLWrapper:", v27);

  }
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_95(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[8];
  id v11;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v11);

  v7 = v11;
  cdui_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21F506000, v9, OS_LOG_TYPE_INFO, "[INFO] Removed successfully", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_95_cold_1(a1, (uint64_t)v7, v9);
  }

}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishObserving");
  return objc_msgSend(MEMORY[0x24BDD1768], "_removeSubscriber:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_3;
  v4[3] = &unk_24E43B648;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "coordinateReadingItemAtURL:options:error:byAccessor:", v3, 0, 0, v4);

}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_3(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_4;
  block[3] = &unk_24E43B620;
  v4 = a1[5];
  v3 = a1[4];
  v5 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_5;
  v3[3] = &unk_24E43B5F8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BDD1700], "keyPathWithRootObject:path:", a2, "fractionCompleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_7;
  v12[3] = &unk_24E43B698;
  v15 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addObserverBlock:", v12);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_9;
  v10[3] = &unk_24E43B5F8;
  v11 = *(id *)(a1 + 56);
  v8 = (void *)MEMORY[0x2207C9E60](v10);

  return v8;
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_7(uint64_t a1, void *a2)
{
  float v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  objc_msgSend(a2, "floatValue");
  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (unint64_t)(float)(v3 * (float)*(unint64_t *)(a1 + 48)), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ of %@ downloaded"), CFSTR("%@ of %@ downloaded"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v4, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_8;
  block[3] = &unk_24E43A858;
  v11 = *(id *)(a1 + 40);
  v12 = v8;
  v9 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMessage:", *(_QWORD *)(a1 + 40));
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_10(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __58___UIDocumentPickerViewServiceViewController__showPicker___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;

  v6 = (void *)a1[4];
  v7 = a1[5];
  if (a4)
    return objc_msgSend(v6, "_presentError:forThirdPartyPickerWithDescription:", a4, v7);
  else
    return objc_msgSend(v6, "_didInstantiateThirdPartyPickerWithDescription:placeholder:", v7, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = a2;
  cdui_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_cold_1();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_135;
  block[3] = &unk_24E43A808;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithURL:forBundleIdentifier:", 0, 0);
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentError:forThirdPartyPickerWithDescription:", a2, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(a3, "objectForKey:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "pickerMode") == 3 || objc_msgSend(*(id *)(a1 + 32), "pickerMode") == 1)
      && (objc_msgSend(v4, "objectForKey:", CFSTR("documentStorageURL")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("File provider component not found"), CFSTR("File provider component not found"), CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDC81F0];
      v19 = *MEMORY[0x24BDD0FC8];
      v20[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_presentError:forThirdPartyPickerWithDescription:", v15, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v4, "dictionaryWithValuesForKeys:", &unk_24E449B70);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 40), "fileProviderDocumentGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("documentGroup"));

      objc_msgSend(*(id *)(a1 + 40), "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("localizedName"));

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_3;
      v16[3] = &unk_24E43B780;
      v16[4] = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 56);
      v17 = *(id *)(a1 + 64);
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v10, "_prepareWithExtensionInfo:completionHandler:", v7, v16);

    }
  }
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_3(id *a1, unsigned int a2)
{
  void *v3;
  id v4;

  if (a2 >> 8 >= 0x803)
  {
    objc_msgSend(a1[4], "containedNavController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNavigationBarHidden:", 1);

  }
  objc_msgSend(a1[5], "endDelayingDisplayOfRemoteController");
  objc_msgSend(a1[6], "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setCurrentPickerIdentifier:", v4);

}

void __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke(id *a1)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Failed to launch “%@”"), CFSTR("Failed to launch “%@”"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("The document picker “%@” failed to launch (%i)."), CFSTR("The document picker “%@” failed to launch (%i)."), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10, objc_msgSend(a1[5], "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Dismiss"), CFSTR("Dismiss"), CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke_2;
  v17[3] = &unk_24E43B378;
  v17[4] = a1[6];
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v16);

  objc_msgSend(a1[6], "presentViewController:animated:completion:", v12, 0, &__block_literal_global_155);
}

void __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hostingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_dismissViewController");

}

void __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke(uint64_t a1)
{
  _UIDocumentPickerModalManagementViewController *v2;
  void *v3;
  _UIDocumentPickerModalManagementViewController *v4;

  v2 = [_UIDocumentPickerModalManagementViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "pickableTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIDocumentPickerModalManagementViewController initWithFileTypes:mode:](v2, "initWithFileTypes:mode:", v3, objc_msgSend(*(id *)(a1 + 32), "pickerMode"));

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);
}

void __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "currentPickerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_showPicker:", *(_QWORD *)(a1 + 40));
}

void __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke_2;
  v3[3] = &unk_24E43B7F0;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v2, "_waitForDownloadOfURL:completion:", v4, v3);

}

uint64_t __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "dismissWithURL:forBundleIdentifier:", *(_QWORD *)(result + 40), 0);
  return result;
}

void __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "presentedURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke_2;
  v7[3] = &unk_24E43B818;
  v7[4] = *(_QWORD *)(a1 + 40);
  +[_UIDocumentListController _listControllerHierarchyForURL:withConstructorBlock:](_UIDocumentListController, "_listControllerHierarchyForURL:withConstructorBlock:", v2, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 40), "containedNavController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setViewControllers:", v3);

}

_UIDocumentListController *__106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _UIDocumentPickerURLContainerModel *v4;
  void *v5;
  _UIDocumentPickerURLContainerModel *v6;
  _UIDocumentListController *v7;

  v3 = a2;
  v4 = [_UIDocumentPickerURLContainerModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "pickableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](v4, "initWithURL:pickableTypes:mode:", v3, v5, objc_msgSend(*(id *)(a1 + 32), "pickerMode"));

  v7 = -[_UIDocumentListController initWithModel:]([_UIDocumentListController alloc], "initWithModel:", v6);
  return v7;
}

uint64_t __99___UIDocumentPickerViewServiceViewController_documentTargetSelectionController_didSelectItemAtURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pickLocationForUpload:", *(_QWORD *)(a1 + 40));
}

void __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a2;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("New filename"), CFSTR("New filename"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_mangledFilenameForURL:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v7);

}

void __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_tryExportingFile:toLocation:", *(_QWORD *)(a1 + 56), v7);
}

uint64_t __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_187);
}

void __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "moveItemAtURL:toURL:error:", a2, a3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id obj;
  id v12;

  v5 = a3;
  v12 = 0;
  v6 = *MEMORY[0x24BDBCCE0];
  v7 = a2;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v12, v6, 0);
  v8 = v12;
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "copyItemAtURL:toURL:error:", v7, v5, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v8)
    objc_msgSend(v5, "setResourceValue:forKey:error:", v8, v6, 0);

}

uint64_t __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_192);
}

uint64_t __65___UIDocumentPickerViewServiceViewController__warnSharingPreMove__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithURL:forBundleIdentifier:", 0, 0);
}

uint64_t __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  cdui_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F506000, v2, OS_LOG_TYPE_INFO, "[INFO] owner decided to break share by moving it between containers", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke_204(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  cdui_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F506000, v2, OS_LOG_TYPE_INFO, "[INFO] owner decided to cancel move", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "dismissWithURL:forBundleIdentifier:", 0, 0);
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_hostApplicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_fault_impl(&dword_21F506000, a3, OS_LOG_TYPE_FAULT, "[ERROR] error adding document %@ to bundle %@: %@", (uint8_t *)&v8, 0x20u);

}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "uploadURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F506000, a3, v5, "[ERROR] File coordination failed for removing %@ after moving (%@)", v6);

  OUTLINED_FUNCTION_1();
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_21F506000, a2, a3, "[ERROR] Could not extend URL %@. Error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_4();
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_95_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uploadURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F506000, a3, v5, "[ERROR] Deletion failed for removing %@ after moving (%@)", v6);

  OUTLINED_FUNCTION_1();
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_21F506000, v0, v1, "[ERROR] Document controller remote proxy failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
