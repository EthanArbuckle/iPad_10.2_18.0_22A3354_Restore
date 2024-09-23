@implementation SFQuickLookDocument

+ (id)properFilenameForOriginalFilename:(id)a3 typeIdentifier:(id)a4 mimeType:(id)a5 sourceURL:(id)a6
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  CFStringRef *v18;
  const __CFString *PreferredIdentifierForTag;
  __CFString *v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  id v25;
  const __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  v12 = a6;
  objc_msgSend(v9, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(CFSTR("zip"), "compare:options:", v13, 9);

  objc_msgSend(v9, "safari_lastPathComponentWithoutZipExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathExtension");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v17 = -[__CFString length](v16, "length");
  v18 = (CFStringRef *)MEMORY[0x1E0CA5A88];
  if (v17)
  {
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v16, 0);
    v20 = (__CFString *)PreferredIdentifierForTag;
    if (PreferredIdentifierForTag)
    {
      if (v11)
      {
        v21 = (const __CFString *)*MEMORY[0x1E0CA5A90];
        v22 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E0CA5A90]);
        if (v22 && !-[__CFString compare:options:](v11, "compare:options:", v22, 9))
        {
          v33 = v9;
          goto LABEL_34;
        }
        v23 = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v21, v11, 0);
        if (v23 && UTTypeConformsTo(v20, v23))
        {
          v24 = v9;

LABEL_34:
          goto LABEL_35;
        }

      }
      if (v10 && UTTypeConformsTo(v20, v10))
      {
        v25 = v9;
LABEL_35:
        v29 = v9;
        goto LABEL_41;
      }
    }

  }
  if (v11)
  {
    v26 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], v11, 0);
    v27 = (__CFString *)v26;
    if (v26)
      v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(v26, *v18);
    else
      v20 = 0;

    if (!v10)
      goto LABEL_23;
  }
  else
  {
    v20 = 0;
    if (!v10)
      goto LABEL_23;
  }
  if (!v20)
    v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, *v18);
LABEL_23:
  if (v20
    && !-[__CFString isEqualToString:](v16, "isEqualToString:", v20)
    && (v28 = objc_msgSend(CFSTR("zip"), "compare:options:", v20, 9), v14 | v28))
  {
    if (v14)
    {
      objc_msgSend(v9, "pathExtension");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "length");

      if (v31 && !v28)
      {
        objc_msgSend(MEMORY[0x1E0CA58C8], "sf_documentProxyForName:type:MIMEType:sourceURL:", v9, 0, 0, v12);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32
          && +[SFQuickLookDocument _hasSuitableApplicationForOpeningDocument:](SFQuickLookDocument, "_hasSuitableApplicationForOpeningDocument:", v32))
        {
          v29 = v9;

          goto LABEL_41;
        }

      }
      v36 = v9;
    }
    else
    {
      v34 = v9;
      objc_msgSend(v34, "stringByDeletingPathExtension");
      v35 = objc_claimAutoreleasedReturnValue();

      v36 = (id)v35;
    }
    objc_msgSend(v36, "stringByAppendingPathExtension:", v20);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v29, "stringByAppendingPathExtension:", CFSTR("zip"));
      v37 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v37;
    }
  }
  else
  {
    v29 = v9;
  }
LABEL_41:

  return v29;
}

+ (BOOL)_hasSuitableApplicationForOpeningDocument:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = *MEMORY[0x1E0CA59C8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CA59C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationsAvailableForOpeningWithHandlerRanks:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (SFQuickLookDocument)initWithFileName:(id)a3 mimeType:(id)a4 uti:(id)a5 needsQuickLookDocumentView:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  SFQuickLookDocument *v14;
  SFQuickLookDocument *v15;
  SFQuickLookDocument *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFQuickLookDocument;
  v14 = -[SFQuickLookDocument init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fileName, a3);
    objc_storeStrong((id *)&v15->_mimeType, a4);
    objc_storeStrong((id *)&v15->_uti, a5);
    v15->_needsQuickLookDocumentView = a6;
    v16 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[SFQuickLookDocument _deleteSavedPathIfNecessary](self, "_deleteSavedPathIfNecessary");
  -[SFQuickLookDocument _deleteSavedPathWithProperExtensionIfNecessary](self, "_deleteSavedPathWithProperExtensionIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)SFQuickLookDocument;
  -[SFQuickLookDocument dealloc](&v3, sel_dealloc);
}

- (NSString)fileName
{
  NSString *fileName;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  fileName = self->_fileName;
  if (!fileName)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SFQuickLookDocument fileName].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    fileName = self->_fileName;
  }
  return fileName;
}

- (void)setFileNameForPDFDocument:(id)a3
{
  id v5;
  NSString *v6;
  NSString **p_fileName;
  NSString *fileName;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  fileName = self->_fileName;
  p_fileName = &self->_fileName;
  v6 = fileName;
  if (fileName)
  {
    if (!-[NSString isEqualToString:](v6, "isEqualToString:", v5))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SFQuickLookDocument setFileNameForPDFDocument:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    objc_storeStrong((id *)p_fileName, a3);
  }

}

- (unint64_t)fileSize
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SFQuickLookDocument savedPath](self, "savedPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v2, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;

  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFQuickLookDocument fileSize].cold.1(v7, (uint64_t)v13, v6);
    }

  }
  if (v4)
  {
    objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E0CB2AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "unsignedLongLongValue");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_deleteSavedPathIfNecessary
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (self->_shouldDeleteSavedPath)
  {
    -[SFQuickLookDocument savedPath](self, "savedPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      dispatch_get_global_queue(-2, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__SFQuickLookDocument__deleteSavedPathIfNecessary__block_invoke;
      block[3] = &unk_1E21E4950;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

void __50__SFQuickLookDocument__deleteSavedPathIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_web_removeFileOnlyAtPath:", *(_QWORD *)(a1 + 32));

}

- (void)_deleteSavedPathWithProperExtensionIfNecessary
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (self->_shouldDeleteSavedPathWithProperExtension)
  {
    -[SFQuickLookDocument savedPathWithProperExtension](self, "savedPathWithProperExtension");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      dispatch_get_global_queue(-2, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__SFQuickLookDocument__deleteSavedPathWithProperExtensionIfNecessary__block_invoke;
      block[3] = &unk_1E21E4950;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

void __69__SFQuickLookDocument__deleteSavedPathWithProperExtensionIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_web_removeFileOnlyAtPath:", *(_QWORD *)(a1 + 32));

}

- (NSString)inferredUTI
{
  NSString *uti;
  __CFString *v3;
  __CFString *PreferredIdentifierForTag;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;

  uti = self->_uti;
  if (uti)
  {
    v3 = uti;
  }
  else
  {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], (CFStringRef)self->_mimeType, 0);
    v6 = PreferredIdentifierForTag;
    if (PreferredIdentifierForTag)
    {
      v3 = PreferredIdentifierForTag;
    }
    else
    {
      -[SFQuickLookDocument savedPathWithProperExtension](self, "savedPathWithProperExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[SFQuickLookDocument fileName](self, "fileName");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      objc_msgSend(v10, "pathExtension");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v3 = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v11, 0);

    }
  }
  return (NSString *)v3;
}

- (NSString)localizedType
{
  const __CFString *mimeType;
  __CFString *PreferredIdentifierForTag;
  void *v5;
  const __CFString *uti;

  mimeType = (const __CFString *)self->_mimeType;
  if (!mimeType
    || (PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], mimeType, 0), v5 = (void *)UTTypeCopyDescription(PreferredIdentifierForTag), PreferredIdentifierForTag, !v5))
  {
    uti = (const __CFString *)self->_uti;
    if (!uti || (v5 = (void *)UTTypeCopyDescription(uti)) == 0)
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)v5;
}

- (LSDocumentProxy)documentProxy
{
  LSDocumentProxy *documentProxy;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  LSDocumentProxy *v8;
  LSDocumentProxy *v9;

  documentProxy = self->_documentProxy;
  if (!documentProxy)
  {
    v4 = (void *)MEMORY[0x1E0CA58C8];
    -[SFQuickLookDocument fileName](self, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocument uti](self, "uti");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocument mimeType](self, "mimeType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sf_documentProxyForName:type:MIMEType:sourceURL:", v5, v6, v7, self->_sourceURL);
    v8 = (LSDocumentProxy *)objc_claimAutoreleasedReturnValue();
    v9 = self->_documentProxy;
    self->_documentProxy = v8;

    documentProxy = self->_documentProxy;
  }
  return documentProxy;
}

- (NSString)savedPathWithProperExtension
{
  NSString *savedPathWithProperExtension;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  savedPathWithProperExtension = self->_savedPathWithProperExtension;
  if (savedPathWithProperExtension)
  {
    v3 = savedPathWithProperExtension;
  }
  else
  {
    -[SFQuickLookDocument savedPath](self, "savedPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[SFQuickLookDocument properFilenameForOriginalFilename:typeIdentifier:mimeType:sourceURL:](SFQuickLookDocument, "properFilenameForOriginalFilename:typeIdentifier:mimeType:sourceURL:", v6, self->_uti, self->_mimeType, self->_sourceURL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_web_pathWithUniqueFilenameForPath:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v11, "linkItemAtPath:toPath:error:", v5, v12, 0) & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          v13 = v5;

          v10 = 0;
          v9 = v13;
        }

      }
      -[SFQuickLookDocument setSavedPathWithProperExtension:shouldDelete:](self, "setSavedPathWithProperExtension:shouldDelete:", v9, v10);
      v3 = self->_savedPathWithProperExtension;

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (NSURL)savedURLWithProperExtension
{
  void *v2;
  void *v3;

  -[SFQuickLookDocument savedPathWithProperExtension](self, "savedPathWithProperExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)saveToFileIfNeeded
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_3(&dword_18B7B2000, a2, a3, "Failed to write QuickLook file to disk: %{public}@", (uint8_t *)a2);

}

- (void)setSavedPath:(id)a3 shouldDelete:(BOOL)a4
{
  id v7;

  v7 = a3;
  -[SFQuickLookDocument _deleteSavedPathIfNecessary](self, "_deleteSavedPathIfNecessary");
  objc_storeStrong((id *)&self->_savedPath, a3);
  self->_shouldDeleteSavedPath = a4;
  -[SFQuickLookDocument setSavedPathWithProperExtension:shouldDelete:](self, "setSavedPathWithProperExtension:shouldDelete:", 0, 0);

}

- (void)setSavedPathWithProperExtension:(id)a3 shouldDelete:(BOOL)a4
{
  NSString *v6;
  NSString *savedPathWithProperExtension;

  v6 = (NSString *)a3;
  -[SFQuickLookDocument _deleteSavedPathWithProperExtensionIfNecessary](self, "_deleteSavedPathWithProperExtensionIfNecessary");
  savedPathWithProperExtension = self->_savedPathWithProperExtension;
  self->_savedPathWithProperExtension = v6;

  self->_shouldDeleteSavedPathWithProperExtension = a4;
}

- (void)addQuickLookPrintSettingsToPrintInfo:(id)a3
{
  int v4;
  int v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(getQLPreviewConverterClass(), "isIWorkDocumentType:", self->_uti);
  if (v4)
    objc_msgSend(v6, "setScaleUp:", 1);
  v5 = objc_msgSend(getQLPreviewConverterClass(), "isSpreadSheetDocumentType:", self->_uti);
  if (UTTypeConformsTo((CFStringRef)self->_uti, CFSTR("public.presentation")) || (v4 & v5) != 0)
    objc_msgSend(v6, "setOrientation:", 1);

}

- (BOOL)shouldUnzipByUIDocumentInteractionController
{
  void *v2;
  void *v3;
  char v4;

  -[SFQuickLookDocument fileName](self, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("playground")) & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("playgroundbook")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("band"));
  }

  return v4;
}

- (BOOL)needsQuickLookDocumentView
{
  return self->_needsQuickLookDocumentView;
}

- (NSString)savedPath
{
  return self->_savedPath;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (SFQuickLookDocumentSource)documentSource
{
  return (SFQuickLookDocumentSource *)objc_loadWeakRetained((id *)&self->_documentSource);
}

- (void)setDocumentSource:(id)a3
{
  objc_storeWeak((id *)&self->_documentSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_documentSource);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_savedPath, 0);
  objc_storeStrong((id *)&self->_savedPathWithProperExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_documentProxy, 0);
}

- (void)fileName
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Attempting to read fileName but there isn't one. It should have been set in -init or set before -fileName was read", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setFileNameForPDFDocument:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Attempting to change an SFQuickLookDocument's fileName after it's already been set; ignoring the new value",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1_0();
}

- (void)fileSize
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_3(&dword_18B7B2000, a2, a3, "Error reading file attributes to calculate file size: %{public}@", (uint8_t *)a2);

}

@end
