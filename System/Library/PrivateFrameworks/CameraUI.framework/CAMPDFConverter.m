@implementation CAMPDFConverter

+ (void)convertToPDFAndWrite:(id)a3 documentName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(void *, void *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD aBlock[5];
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v40 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CAMPDFConverter_convertToPDFAndWrite_documentName_completionHandler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e26___PDFPage_16__0__UIImage_8l;
  aBlock[4] = a1;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  v11 = objc_alloc_init(MEMORY[0x1E0CD0DB8]);
  v12 = (void *)MEMORY[0x1DF0B55E8]();
  if (objc_msgSend(v8, "pageCount"))
  {
    v36 = v12;
    v38 = v9;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = v14;
      v17 = v13;
      objc_msgSend(v8, "imageOfPageAtIndex:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v11, "insertPage:atIndex:", v13, objc_msgSend(v11, "pageCount"));
      }
      else
      {
        v18 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v35 = objc_msgSend(v8, "pageCount");
          objc_msgSend(v14, "debugDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v47 = v15;
          v48 = 2048;
          v49 = v35;
          v50 = 2114;
          v51 = v19;
          _os_log_error_impl(&dword_1DB760000, v18, OS_LOG_TYPE_ERROR, "Failed to create PDF page from image (image %lu/%lu of scanned document) with description: %{public}@", buf, 0x20u);

        }
      }
      ++v15;
    }
    while (v15 < objc_msgSend(v8, "pageCount"));

    v12 = v36;
    v9 = v38;
  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "temporaryDirectory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLByAppendingPathComponent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(v20, "fileExistsAtPath:", v25);

  if ((v23 & 1) != 0)
  {
    objc_msgSend(v24, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v20, "removeItemAtPath:error:", v26, &v42);
    v27 = v42;

    if (v27)
    {
      v28 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[CAMPDFConverter convertToPDFAndWrite:documentName:completionHandler:].cold.2(v24, (uint64_t)v27, v28);
LABEL_17:

      v30 = v40;
      (*((void (**)(id, _QWORD))v40 + 2))(v40, 0);
      goto LABEL_22;
    }
  }
  objc_msgSend(v24, "path");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v41);
  v27 = v41;

  if (v27)
  {
    v28 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[CAMPDFConverter convertToPDFAndWrite:documentName:completionHandler:].cold.1((uint64_t)v27, v28);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.pdf"), v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0C9DB78];
  v45 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v39 = v21;
  v32 = v9;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v40;
  if (objc_msgSend(v11, "writeToURL:withOptions:", v31, v33))
    v34 = v31;
  else
    v34 = 0;
  (*((void (**)(id, void *))v40 + 2))(v40, v34);

  v9 = v32;
  v21 = v39;

LABEL_22:
}

id __71__CAMPDFConverter_convertToPDFAndWrite_documentName_completionHandler___block_invoke(uint64_t a1, id a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v2, "_pdfPageOptionsForImageRef:", objc_msgSend(v3, "CGImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DC8]), "initWithImage:options:", v3, v4);

  return v5;
}

+ (id)_pdfPageOptionsForImageRef:(CGImage *)a3
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  CGImageGetSizeAfterOrientation();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD0EA8];
  v9[0] = *MEMORY[0x1E0CD0EA0];
  v9[1] = v6;
  v10[0] = v5;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)convertToPDFAndWrite:(uint64_t)a1 documentName:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory for scanned PDF with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)convertToPDFAndWrite:(void *)a1 documentName:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Failed to remove item (at path %{public}@) prior to storing scanned PDF with error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
