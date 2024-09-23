@implementation MFMediaExporter

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MFMediaExporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (id)log_log_6;
}

void __22__MFMediaExporter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

+ (int)exportAsset:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v25;
  id *v26;
  id *v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD v31[6];
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MFMediaExporter log](MFMediaExporter, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "mf_localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v12;
    _os_log_impl(&dword_1AB96A000, v11, OS_LOG_TYPE_DEFAULT, "Exporting asset: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v8, "canPlayAutoloop"))
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_DEFAULT, "\tAsset is an auto loop, converting to gif.", buf, 2u);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v14, "setNetworkAccessAllowed:", 1);
    v15 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke;
    v40[3] = &unk_1E5A69130;
    v16 = v40;
    v40[4] = v9;
    objc_msgSend(v14, "setProgressHandler:", v40);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v15;
    v39[1] = 3221225472;
    v39[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_24;
    v39[3] = &unk_1E5A69180;
    v18 = v39;
    v39[4] = v10;
    v19 = objc_msgSend(v17, "requestURLForVideo:options:resultHandler:", v8, 0, v39);
LABEL_14:
    v25 = v19;
    v26 = (id *)(v16 + 4);
    v27 = (id *)(v18 + 4);
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "isVideo"))
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v28, OS_LOG_TYPE_DEFAULT, "\tAsset is an image. Exporting as a web-friendly image.", buf, 2u);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    v29 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_41;
    v32[3] = &unk_1E5A69130;
    v16 = v32;
    v32[4] = v9;
    objc_msgSend(v14, "setProgressHandler:", v32);
    objc_msgSend(v14, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v14, "setDeliveryMode:", 1);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v29;
    v31[1] = 3221225472;
    v31[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42;
    v31[3] = &unk_1E5A69248;
    v18 = v31;
    v31[4] = v10;
    v31[5] = a1;
    v19 = objc_msgSend(v17, "requestImageDataAndOrientationForAsset:options:resultHandler:", v8, v14, v31);
    goto LABEL_14;
  }
  +[MFMediaExporter log](MFMediaExporter, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v20, OS_LOG_TYPE_DEFAULT, "\tAsset is a video. Exporting as a mov.", buf, 2u);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  v21 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_31;
  v37[3] = &unk_1E5A69130;
  v22 = v9;
  v38 = v22;
  objc_msgSend(v14, "setProgressHandler:", v37);
  objc_msgSend(v14, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v14, "setVersion:", 0);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0C89E78];
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_32;
  v33[3] = &unk_1E5A691F8;
  v35 = v22;
  v36 = v10;
  v34 = v8;
  v25 = objc_msgSend(v23, "requestExportSessionForVideo:options:exportPreset:resultHandler:", v34, v14, v24, v33);

  v26 = &v38;
  v27 = &v35;
  v17 = v36;
LABEL_15:

  return v25;
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CD1BE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }

  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
  }

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v3;
  v12 = *(id *)(a1 + 32);
  v10 = v9;
  PFCreateGIFFromVideoURL();

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2(_QWORD *a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[MFMediaExporter log](MFMediaExporter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v17 = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "\tAuto-loop exported to: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[4];
    if (v9)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC5878]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a1[5], *MEMORY[0x1E0DC4C98]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_cold_1(v5, v10, v11, v12, v13, v14, v15, v16);

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_31(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CD1BE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }

  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
  }

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_32(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("mov"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setOutputURL:", v10);
  objc_msgSend(v3, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
  +[MFMediaExporter log](MFMediaExporter, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    v33 = 2114;
    v34 = v3;
    _os_log_impl(&dword_1AB96A000, v11, OS_LOG_TYPE_DEFAULT, "\tExporting to %{public}@ with export session: %{public}@", buf, 0x16u);

  }
  +[MFMediaExporter conversionTimers](MFMediaExporter, "conversionTimers");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = (void *)MEMORY[0x1E0C99E88];
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_35;
  v27[3] = &unk_1E5A691A8;
  v16 = v3;
  v28 = v16;
  v30 = a1[5];
  v17 = v13;
  v29 = v17;
  objc_msgSend(v14, "timerWithTimeInterval:repeats:block:", 1, v27, 0.1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);
  +[MFMediaExporter setConversionTimers:](MFMediaExporter, "setConversionTimers:", v17);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTimer:forMode:", v18, *MEMORY[0x1E0C99748]);

  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_38;
  v22[3] = &unk_1E5A691D0;
  v20 = v16;
  v23 = v20;
  v21 = v10;
  v24 = v21;
  v26 = a1[6];
  v25 = a1[4];
  objc_msgSend(v20, "exportAsynchronouslyWithCompletionHandler:", v22);

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_35(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = v3;
  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v3 * 0.5 + 0.5);
  if (v4 >= 1.0)
  {
    objc_msgSend(v5, "invalidate");
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
  }

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_38(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[MFMediaExporter log](MFMediaExporter, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "status");
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "\tFinished exporting with status %ld", (uint8_t *)&v10, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v14 = *MEMORY[0x1E0DC4C98];
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "mf_localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = (uint64_t)v7;
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_ERROR, "\tError exporting asset %{public}@ with error %{public}@", (uint8_t *)&v10, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_41(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CD1BE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    +[MFMediaExporter log](MFMediaExporter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(v11, (uint64_t)v12, v10);
    }

  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
  }

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = *MEMORY[0x1E0CD1BF0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BF0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC520]))
      {
        if ((objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
          || (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0
          || objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4F8]))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC58E8]);

          +[MFMediaExporter log](MFMediaExporter, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_DEFAULT, "\tSuccessfully exported the image.", buf, 2u);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        else
        {
          v26 = *(void **)(a1 + 40);
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_44;
          v28[3] = &unk_1E5A69220;
          v29 = v11;
          v30 = *(id *)(a1 + 32);
          objc_msgSend(v26, "jpegRepresentationForImageData:inputContentType:completion:", v27, v7, v28);

        }
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v13 = 0;
    }
    +[MFMediaExporter log](MFMediaExporter, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42_cold_2((uint64_t)v7, v24, v25);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_18;
  }
  +[MFMediaExporter log](MFMediaExporter, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_19:

}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC58E8]);
  +[MFMediaExporter log](MFMediaExporter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "\tSuccessfully converted and exported the image as JPEG.", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)jpegRepresentationForImageData:(id)a3 inputContentType:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (_imageConversionScheduler_onceToken != -1)
    dispatch_once(&_imageConversionScheduler_onceToken, &__block_literal_global_26);
  v10 = (id)_imageConversionScheduler_sInstance;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__MFMediaExporter_jpegRepresentationForImageData_inputContentType_completion___block_invoke;
  v14[3] = &unk_1E5A65940;
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "performBlock:", v14);

}

void __78__MFMediaExporter_jpegRepresentationForImageData_inputContentType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  CGImageSource *v4;
  __CFData *v5;
  __CFString *v6;
  CGImageDestination *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  size_t PrimaryImageIndex;
  __CFData *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v15 = *MEMORY[0x1E0CBD2A8];
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 40), v3);
  if (!v4)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (__CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageDestinationCreateWithData(v5, v6, 1uLL, 0);

  if (v7)
  {
    v8 = *MEMORY[0x1E0CBC7A0];
    v13[0] = *MEMORY[0x1E0CBC7B0];
    v13[1] = v8;
    v14[0] = MEMORY[0x1E0C9AAB0];
    v14[1] = MEMORY[0x1E0C9AAB0];
    v13[2] = *MEMORY[0x1E0CBC780];
    v14[2] = &unk_1E5AA0018;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v4);
    CGImageDestinationAddImageFromSource(v7, v4, PrimaryImageIndex, v9);
    v11 = CGImageDestinationFinalize(v7) ? v5 : 0;
    CFRelease(v7);

  }
  else
  {
    v11 = 0;
  }
  CFRelease(v4);

  if (!v11)
  {
LABEL_9:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", *(_QWORD *)(a1 + 40));
    _UIImageJPEGRepresentation();
    v11 = (__CFData *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)conversionTimers
{
  return objc_getAssociatedObject(a1, "MFConversionTimersKey");
}

+ (void)setConversionTimers:(id)a3
{
  objc_setAssociatedObject(a1, "MFConversionTimersKey", a3, (void *)0x301);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "\tAsset export cancelled with error: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "\tFailed to export auto-loop to gif.", a5, a6, a7, a8, 0);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "\tUnable to export the image. There is no data.", a5, a6, a7, a8, 0);
}

void __58__MFMediaExporter_exportAsset_progressHandler_completion___block_invoke_42_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a2, a3, "\tUnable to export the image. The contentType is not an image - %{public}@.", (uint8_t *)&v3);
}

@end
