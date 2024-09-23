@implementation QLTFileThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  return -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:](self, "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", a3, a6, 0, a4.width, a4.height, 0.0, a5);
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8
{
  return -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:](self, "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:", a3, a7, a8, 1, a4.width, a4.height, a5, a6);
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8 shouldMakeSandboxWrapper:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  double height;
  double width;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  QLCacheBasicFileIdentifier *v22;
  QLThumbnailVersion *v23;
  QLCacheBasicVersionedFileIdentifier *v24;
  QLTFileThumbnailRequest *v25;
  id v26;
  id v27;
  int *v28;
  id FPSandboxingURLWrapperClass;
  uint64_t v30;
  uint64_t v31;
  id v32;
  FPSandboxingURLWrapper *quicklookSandboxWrapper;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  FPSandboxingURLWrapper *genericSandboxWrapper;
  QLTFileThumbnailRequest *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;

  v9 = a9;
  v11 = a7;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = _CFURLPromiseCopyPhysicalURL();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v17;
  v21 = v20;

  v22 = -[QLCacheBasicFileIdentifier initWithFileURL:error:]([QLCacheBasicFileIdentifier alloc], "initWithFileURL:error:", v21, a8);
  if (v22)
  {
    v23 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v17, 1);
    v24 = -[QLCacheBasicVersionedFileIdentifier initWithFileIdentifier:version:]([QLCacheBasicVersionedFileIdentifier alloc], "initWithFileIdentifier:version:", v22, v23);
    v25 = -[QLTThumbnailRequest initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:](self, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v24, v11, 0, 0, -1, width, height, a6, a5);
    if (!v25)
    {
LABEL_23:
      self = v25;

      v39 = self;
      goto LABEL_24;
    }
    v26 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    v55 = 0;
    v56[0] = &v55;
    v56[1] = 0x3032000000;
    v56[2] = __Block_byref_object_copy__4;
    v56[3] = __Block_byref_object_dispose__4;
    v57 = 0;
    v53[4] = &v55;
    v54 = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __113__QLTFileThumbnailRequest_initWithFileAtURL_size_minimumDimension_scale_iconMode_error_shouldMakeSandboxWrapper___block_invoke;
    v53[3] = &unk_1E5D7CFB0;
    v49 = v26;
    objc_msgSend(v26, "coordinateReadingItemAtURL:options:error:byAccessor:", v17, 4, &v54, v53);
    v27 = v54;
    v28 = &OBJC_IVAR___QLThumbnailItem__attachments;
    if (*(_QWORD *)(v56[0] + 40))
    {
      if (!v9)
        goto LABEL_17;
      FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
      v30 = *(_QWORD *)(v56[0] + 40);
      v52 = v27;
      objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v30, "com.apple.quicklook.readonly", &v52);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v52;

      quicklookSandboxWrapper = v25->_quicklookSandboxWrapper;
      v25->_quicklookSandboxWrapper = (FPSandboxingURLWrapper *)v31;

      v34 = getFPSandboxingURLWrapperClass();
      v35 = *(_QWORD *)(v56[0] + 40);
      v36 = *MEMORY[0x1E0C80008];
      v51 = v32;
      objc_msgSend(v34, "wrapperWithURL:extensionClass:error:", v35, v36, &v51);
      v37 = objc_claimAutoreleasedReturnValue();
      v27 = v51;

      genericSandboxWrapper = v25->_genericSandboxWrapper;
      v25->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v37;

      if (v25->_genericSandboxWrapper)
      {
        v28 = &OBJC_IVAR___QLThumbnailItem__attachments;
        goto LABEL_17;
      }
      _log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:].cold.3((uint64_t)v56, (uint64_t)v27, v41);

      v42 = getFPSandboxingURLWrapperClass();
      v43 = *(_QWORD *)(v56[0] + 40);
      v44 = *MEMORY[0x1E0C80000];
      v50 = v27;
      objc_msgSend(v42, "wrapperWithURL:extensionClass:error:", v43, v44, &v50);
      v48 = objc_claimAutoreleasedReturnValue();
      v45 = v50;

      v40 = v25->_genericSandboxWrapper;
      v25->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v48;
      v27 = v45;
      v28 = &OBJC_IVAR___QLThumbnailItem__attachments;
    }
    else
    {
      _log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:].cold.2();
    }

LABEL_17:
    if (!*(Class *)((char *)&v25->super.super.isa + v28[40]) || !v25->_quicklookSandboxWrapper)
    {

      _log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:].cold.1();

      v25 = 0;
    }

    _Block_object_dispose(&v55, 8);
    goto LABEL_23;
  }
  v39 = 0;
LABEL_24:

  return v39;
}

void __113__QLTFileThumbnailRequest_initWithFileAtURL_size_minimumDimension_scale_iconMode_error_shouldMakeSandboxWrapper___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTFileThumbnailRequest genericSandboxWrapper](self, "genericSandboxWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTThumbnailRequest size](self, "size");
  v10 = v9;
  -[QLTThumbnailRequest size](self, "size");
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p %@ {%g,%g}>"), v5, self, v8, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  FPSandboxingURLWrapper *quicklookSandboxWrapper;
  id v5;
  objc_super v6;

  quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quicklookSandboxWrapper, CFSTR("quicklookSandboxWrapper"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genericSandboxWrapper, CFSTR("genericSandboxWrapper"));
  v6.receiver = self;
  v6.super_class = (Class)QLTFileThumbnailRequest;
  -[QLTThumbnailRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (QLTFileThumbnailRequest)initWithCoder:(id)a3
{
  id v4;
  QLTFileThumbnailRequest *v5;
  uint64_t v6;
  FPSandboxingURLWrapper *quicklookSandboxWrapper;
  uint64_t v8;
  FPSandboxingURLWrapper *genericSandboxWrapper;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLTFileThumbnailRequest;
  v5 = -[QLTThumbnailRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    getFPSandboxingURLWrapperClass();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quicklookSandboxWrapper"));
    v6 = objc_claimAutoreleasedReturnValue();
    quicklookSandboxWrapper = v5->_quicklookSandboxWrapper;
    v5->_quicklookSandboxWrapper = (FPSandboxingURLWrapper *)v6;

    getFPSandboxingURLWrapperClass();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genericSandboxWrapper"));
    v8 = objc_claimAutoreleasedReturnValue();
    genericSandboxWrapper = v5->_genericSandboxWrapper;
    v5->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLTFileThumbnailRequest;
  v4 = -[QLTThumbnailRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 12, self->_quicklookSandboxWrapper);
  objc_storeStrong(v4 + 13, self->_genericSandboxWrapper);
  return v4;
}

- (id)computeContentType
{
  void *v2;
  void *v3;
  void *v4;

  -[QLTFileThumbnailRequest genericSandboxWrapper](self, "genericSandboxWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLUTIAnalyzer UTIForURL:](QLUTIAnalyzer, "UTIForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return 1;
}

- (FPSandboxingURLWrapper)quicklookSandboxWrapper
{
  return self->_quicklookSandboxWrapper;
}

- (FPSandboxingURLWrapper)genericSandboxWrapper
{
  return self->_genericSandboxWrapper;
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 112, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_genericSandboxWrapper, 0);
  objc_storeStrong((id *)&self->_quicklookSandboxWrapper, 0);
}

- (void)initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Will not create a FPSandboxingURLWrapper for thumbnail request because no URL was obtained using coordinateReadingItemAtURL for url: %@ (%@).");
  OUTLINED_FUNCTION_2();
}

- (void)initWithFileAtURL:(NSObject *)a3 size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, a2, a3, "Could not create FPSandboxingURLWrapper with write extension for %@ with error %@, thumbnail additions can not be added to this file, falling back to read only", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
