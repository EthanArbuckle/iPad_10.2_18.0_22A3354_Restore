@implementation APUIAppIconDataSource

+ (id)_appClipIconForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "iconImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(a1, "_appClipIconTreatmentForCGImage:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_appClipIconTreatmentForCGImage:(CGImage *)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A80]), "initWithCGImage:scale:", a3, v6);
  v8 = objc_alloc(MEMORY[0x24BE51A90]);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithImages:", v9);

  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShape:", 5);
  objc_msgSend(v10, "prepareImageForDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDF6AC8];
    v15 = objc_msgSend(v12, "CGImage");
    objc_msgSend(v13, "scale");
    objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)iconForBundleIdentifier:(id)a3 shouldApplyMask:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  objc_msgSend(v5, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  v11 = objc_alloc(MEMORY[0x24BE51A90]);
  v12 = v11;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithDate:calendar:format:", v13, v14, 0);

  }
  else
  {
    v15 = (void *)objc_msgSend(v11, "initWithBundleIdentifier:", v5);
  }
  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShouldApplyMask:", v4);
  objc_msgSend(v15, "prepareImageForDescriptor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", objc_msgSend(v17, "CGImage"), 0, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", v4))
    {
      objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE04100], "localizedNameForBundle:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "_appClipIconForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "iconForBundleIdentifier:shouldApplyMask:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v6;
  id WeakRetained;
  char v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "appIconDataSource:launchAppFromIcon:", self, v6);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "applicationBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v9 = v11 != 0;
    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "openApplication:completion:", v10, 0);
    }
    else
    {
      __atxlog_handle_ui();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[APUIAppIconDataSource icon:launchFromLocation:context:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
  }

  return v9;
}

+ (void)openApplication:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", v5))
    {
      __atxlog_handle_ui();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "AppIconDataSource: +openApplication asked to open clip: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BEB0B50], "launchWebClipWithIdentifier:", v5);
      if (v6)
        v6[2](v6, 1, 0);
    }
    else
    {
      v16 = (void *)objc_msgSend(v5, "copy");

      __atxlog_handle_ui();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_219979000, v17, OS_LOG_TYPE_DEFAULT, "AppIconDataSource: +openApplication launching app: %@", buf, 0xCu);
      }

      dispatch_get_global_queue(25, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __52__APUIAppIconDataSource_openApplication_completion___block_invoke;
      v19[3] = &unk_24DB7DB38;
      v5 = v16;
      v20 = v5;
      v21 = v6;
      dispatch_async(v18, v19);

    }
  }
  else
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[APUIAppIconDataSource icon:launchFromLocation:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    if (v6)
      v6[2](v6, 0, 0);
  }

}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE38320];
  v9[0] = *MEMORY[0x24BE382E0];
  v9[1] = v3;
  v10[0] = CFSTR("AppPredictions");
  v10[1] = MEMORY[0x24BDBD1C8];
  v9[2] = *MEMORY[0x24BE38310];
  v10[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2;
  v7[3] = &unk_24DB7DB10;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "openApplication:withOptions:completion:", v5, v6, v7);

}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2_cold_1((uint64_t)v6, v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v6 == 0, v6);

}

- (APUIAppIconDataSourceDelegate)delegate
{
  return (APUIAppIconDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)icon:(uint64_t)a3 launchFromLocation:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_219979000, a1, a3, "AppIconDataSource: asked to +openApplication with empty identifier", a5, a6, a7, a8, 0);
}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219979000, a2, OS_LOG_TYPE_ERROR, "AppIconDataSource: could not open app: %@", (uint8_t *)&v2, 0xCu);
}

@end
