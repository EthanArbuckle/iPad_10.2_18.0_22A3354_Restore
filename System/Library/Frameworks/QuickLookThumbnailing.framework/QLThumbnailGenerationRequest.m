@implementation QLThumbnailGenerationRequest

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)fileIdentifier
{
  void *basicFileIdentifier;

  basicFileIdentifier = self->_basicFileIdentifier;
  if (!basicFileIdentifier)
    basicFileIdentifier = self->_fileProviderFileIdentifier;
  return basicFileIdentifier;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (BOOL)forceGeneration
{
  return -[QLThumbnailGenerationRequest generationBehavior](self, "generationBehavior") == 1;
}

- (BOOL)provideCachedResultsOnly
{
  return -[QLThumbnailGenerationRequest generationBehavior](self, "generationBehavior") == 0;
}

- (int64_t)generationBehavior
{
  return self->_generationBehavior;
}

- (float)maximumPixelSize
{
  double width;

  width = self->_size.width;
  if (width < self->_size.height)
    width = self->_size.height;
  return self->_scale * width;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (BOOL)provideLowQualityThumbnail
{
  if ((self->_representationTypes & 2) != 0
    && !-[QLThumbnailGenerationRequest resultShouldBeSavedToDisk](self, "resultShouldBeSavedToDisk"))
  {
    return !-[QLThumbnailGenerationRequest isDataBased](self, "isDataBased");
  }
  else
  {
    return 0;
  }
}

- (CGFloat)minimumDimension
{
  return self->_minimumDimension;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (QLThumbnailRepresentation)mostRepresentativeThumbnail
{
  return self->_mostRepresentativeThumbnail;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setStatusBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (BOOL)prepareForSending
{
  BOOL v3;
  NSURL *fileURL;
  NSURL **p_fileURL;
  _BOOL4 v7;
  NSError *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSError *requestIsInvalidError;
  int v13;
  NSURL *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSURL *v19;
  NSError *v20;
  NSError *v21;
  NSObject *v22;
  id v23;
  char v24;
  NSError *v25;
  void *v26;
  id v27;
  QLCacheBasicVersionedFileIdentifier *v28;
  NSError *v29;
  QLCacheBasicVersionedFileIdentifier *basicFileIdentifier;
  id FPSandboxingURLWrapperClass;
  uint64_t v32;
  FPSandboxingURLWrapper *v33;
  NSError *v34;
  FPSandboxingURLWrapper *quicklookSandboxWrapper;
  id v36;
  uint64_t v37;
  uint64_t v38;
  FPSandboxingURLWrapper *v39;
  NSError *v40;
  FPSandboxingURLWrapper *genericSandboxWrapper;
  FPSandboxingURLWrapper *v42;
  FPSandboxingURLWrapper *parentDirectorySandboxWrapper;
  void *v44;
  NSURL *v45;
  NSObject *p_super;
  NSError *v47;
  NSError *v48;
  NSError *v49;
  NSError *v50;
  NSError *v51;
  NSError *v52;
  NSError *v53;
  _QWORD v54[6];
  NSError *v55;
  NSError *v56;
  id v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  if (!self->_item && !-[QLThumbnailGenerationRequest isDataBased](self, "isDataBased"))
  {
    v61 = 0;
    v62 = (id *)&v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    v66 = 0;
    v58 = 0;
    v59[0] = &v58;
    v59[1] = 0x3032000000;
    v59[2] = __Block_byref_object_copy_;
    v59[3] = __Block_byref_object_dispose_;
    v60 = 0;
    p_fileURL = &self->_fileURL;
    fileURL = self->_fileURL;
    if (fileURL)
    {
      v57 = 0;
      v7 = -[NSURL checkResourceIsReachableAndReturnError:](fileURL, "checkResourceIsReachableAndReturnError:", &v57);
      v8 = (NSError *)v57;
      if (v7)
      {
        -[NSURL ql_realpathURL](*p_fileURL, "ql_realpathURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLThumbnailGenerationRequest setFileURL:](self, "setFileURL:", v9);

        if (_CFURLIsItemPromiseAtURL())
        {
          v56 = 0;
          v10 = _CFURLCopyLogicalURLOfPromiseAtURL();
          v11 = *(void **)(v59[0] + 40);
          *(_QWORD *)(v59[0] + 40) = v10;

          if (!*(_QWORD *)(v59[0] + 40))
          {
            requestIsInvalidError = self->_requestIsInvalidError;
            self->_requestIsInvalidError = v56;

          }
          objc_storeStrong(v62 + 5, *p_fileURL);
        }
        else
        {
          objc_storeStrong((id *)(v59[0] + 40), *p_fileURL);
          objc_storeStrong(v62 + 5, *p_fileURL);
        }
      }
      else
      {
        v13 = _CFURLIsItemPromiseAtURL();
        v14 = *p_fileURL;
        if (v13)
        {
          objc_storeStrong(v62 + 5, v14);
        }
        else
        {
          objc_storeStrong((id *)(v59[0] + 40), v14);
          v15 = _CFURLPromiseCopyPhysicalURL();
          v16 = v62[5];
          v62[5] = (id)v15;

          v17 = v62[5];
          if (!v17 || v17 == *(id *)(v59[0] + 40))
          {
            v18 = objc_alloc_init(MEMORY[0x1E0CB3600]);
            v19 = *p_fileURL;
            v55 = v8;
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __49__QLThumbnailGenerationRequest_prepareForSending__block_invoke;
            v54[3] = &unk_1E5D7C1E0;
            v54[4] = &v58;
            v54[5] = &v61;
            objc_msgSend(v18, "coordinateReadingItemAtURL:options:error:byAccessor:", v19, 5, &v55, v54);
            v20 = v55;
            v21 = v55;

            if (!*(_QWORD *)(v59[0] + 40))
            {
              _log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                -[QLThumbnailGenerationRequest prepareForSending].cold.2(&self->_fileURL);

              objc_storeStrong((id *)&self->_requestIsInvalidError, v20);
            }

            v8 = v21;
          }
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v23 = v62[5];
    if (!v23 || !*(_QWORD *)(v59[0] + 40))
    {
      if (self->_requestIsInvalidError)
        goto LABEL_41;
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *p_fileURL;
      if (*p_fileURL)
      {
        v67 = *MEMORY[0x1E0CB3308];
        v68[0] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
        p_super = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        p_super = 0;
      }
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, p_super);
      v48 = (NSError *)objc_claimAutoreleasedReturnValue();
      v49 = self->_requestIsInvalidError;
      self->_requestIsInvalidError = v48;

      if (!v45)
        goto LABEL_41;
      goto LABEL_40;
    }
    v53 = v8;
    v24 = objc_msgSend(v23, "checkResourceIsReachableAndReturnError:", &v53);
    v25 = v53;

    if ((v24 & 1) != 0)
    {
      v26 = (void *)objc_opt_class();
      v27 = v62[5];
      v52 = v25;
      objc_msgSend(v26, "_basicFileIdentifierForURL:error:", v27, &v52);
      v28 = (QLCacheBasicVersionedFileIdentifier *)objc_claimAutoreleasedReturnValue();
      v29 = v52;

      basicFileIdentifier = self->_basicFileIdentifier;
      self->_basicFileIdentifier = v28;

      if (self->_basicFileIdentifier)
      {
        FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
        v32 = *(_QWORD *)(v59[0] + 40);
        v51 = v29;
        objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v32, "com.apple.quicklook.readonly", &v51);
        v33 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
        v34 = v51;

        quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
        self->_quicklookSandboxWrapper = v33;

        v36 = getFPSandboxingURLWrapperClass();
        v37 = *(_QWORD *)(v59[0] + 40);
        v38 = *MEMORY[0x1E0C80000];
        v50 = v34;
        objc_msgSend(v36, "wrapperWithURL:extensionClass:error:", v37, v38, &v50);
        v39 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
        v40 = v50;
        v8 = v50;

        genericSandboxWrapper = self->_genericSandboxWrapper;
        self->_genericSandboxWrapper = v39;

        QLTSandboxWrapperForParentURLOf();
        v42 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
        parentDirectorySandboxWrapper = self->_parentDirectorySandboxWrapper;
        self->_parentDirectorySandboxWrapper = v42;

        if (self->_genericSandboxWrapper && self->_quicklookSandboxWrapper)
        {
          v3 = 1;
LABEL_42:

          _Block_object_dispose(&v58, 8);
          _Block_object_dispose(&v61, 8);

          return v3;
        }
        objc_storeStrong((id *)&self->_requestIsInvalidError, v40);
        _log();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[QLThumbnailGenerationRequest prepareForSending].cold.1((uint64_t)v59);
        goto LABEL_40;
      }
      v47 = v29;
    }
    else
    {
      v47 = v25;
    }
    v8 = v47;
    p_super = &self->_requestIsInvalidError->super;
    self->_requestIsInvalidError = v47;
LABEL_40:

LABEL_41:
    v3 = 0;
    goto LABEL_42;
  }
  return 1;
}

- (BOOL)isDataBased
{
  return self->_data != 0;
}

- (BOOL)provideGenericIcon
{
  if ((self->_representationTypes & 1) != 0)
    return !-[QLThumbnailGenerationRequest resultShouldBeSavedToDisk](self, "resultShouldBeSavedToDisk");
  else
    return 0;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSError)requestIsInvalidError
{
  return self->_requestIsInvalidError;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)thumbnailRepresentationTypeMatchesRequestedMostRepresentativeType:(int64_t)a3
{
  return !-[QLThumbnailGenerationRequest representationTypes](self, "representationTypes")
      || -[QLThumbnailGenerationRequest requestedMostRepresentativeType](self, "requestedMostRepresentativeType") <= a3;
}

- (QLThumbnailGenerationRequestRepresentationTypes)representationTypes
{
  return self->_representationTypes;
}

- (void)markDidBegin
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setBeginDate:](self, "setBeginDate:", v3);

}

- (void)finish
{
  -[QLThumbnailGenerationRequest setFinished:](self, "setFinished:", 1);
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)setBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_beginDate, a3);
}

- (int64_t)requestedMostRepresentativeType
{
  if (self->_representationTypes)
    return flsl(self->_representationTypes & 7) - 1;
  else
    return 0;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

+ (id)_basicFileIdentifierForURL:(id)a3 error:(id *)a4
{
  id v5;
  QLCacheBasicFileIdentifier *v6;
  QLThumbnailVersion *v7;
  QLCacheBasicVersionedFileIdentifier *v8;

  v5 = a3;
  v6 = -[QLCacheBasicFileIdentifier initWithFileURL:error:]([QLCacheBasicFileIdentifier alloc], "initWithFileURL:error:", v5, a4);
  if (v6)
  {
    v7 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v5, 1);
    v8 = -[QLCacheBasicVersionedFileIdentifier initWithFileIdentifier:version:]([QLCacheBasicVersionedFileIdentifier alloc], "initWithFileIdentifier:version:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_fileProviderFileIdentifierForFPItem:(id)a3
{
  id v3;
  QLCacheFileProviderFileIdentifier *v4;
  void *v5;
  QLCacheFileProviderFileIdentifier *v6;
  QLThumbnailVersion *v7;
  QLCacheFileProviderVersionedFileIdentifier *v8;

  v3 = a3;
  v4 = [QLCacheFileProviderFileIdentifier alloc];
  objc_msgSend(v3, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLCacheFileProviderFileIdentifier initWithItemID:](v4, "initWithItemID:", v5);

  v7 = -[QLThumbnailVersion initWithFPItem:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFPItem:automaticallyGenerated:", v3, 1);
  v8 = -[QLCacheFileProviderVersionedFileIdentifier initWithFileIdentifier:version:]([QLCacheFileProviderVersionedFileIdentifier alloc], "initWithFileIdentifier:version:", v6, v7);

  return v8;
}

- (QLThumbnailGenerationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  QLThumbnailGenerationRequest *v6;
  double v7;
  double v8;
  uint64_t v9;
  QLThumbnailGenerationRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v29;
  double v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0.0;
  v30 = 0.0;
  objc_msgSend(v5, "getValue:size:", &v29, 16);
  v6 = [QLThumbnailGenerationRequest alloc];
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sc"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rt"));
  v10 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](v6, "initWithSize:scale:representationTypes:", v9, v29, v30, v8);
  getFPSandboxingURLWrapperClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quicklookSandboxWrapper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setQuicklookSandboxWrapper:](v10, "setQuicklookSandboxWrapper:", v11);

  getFPSandboxingURLWrapperClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genericSandboxWrapper"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setGenericSandboxWrapper:](v10, "setGenericSandboxWrapper:", v12);

  getFPSandboxingURLWrapperClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentDirSandboxWrapper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setParentDirectorySandboxWrapper:](v10, "setParentDirectorySandboxWrapper:", v13);

  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v14 = (void *)getFPItemClass_softClass;
  v35 = getFPItemClass_softClass;
  if (!getFPItemClass_softClass)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __getFPItemClass_block_invoke;
    v31[3] = &unk_1E5D7C1B8;
    v31[4] = &v32;
    __getFPItemClass_block_invoke((uint64_t)v31);
    v14 = (void *)v33[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v32, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("it"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setItem:](v10, "setItem:", v16);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpfi"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setFileProviderFileIdentifier:](v10, "setFileProviderFileIdentifier:", v17);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bfi"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setBasicFileIdentifier:](v10, "setBasicFileIdentifier:", v18);

  -[QLThumbnailGenerationRequest setIconMode:](v10, "setIconMode:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("i")));
  -[QLThumbnailGenerationRequest setIconVariant:](v10, "setIconVariant:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("iv")));
  -[QLThumbnailGenerationRequest setWantsBaseline:](v10, "setWantsBaseline:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("baseline")));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ms"));
  -[QLThumbnailGenerationRequest setMinimumDimension:](v10, "setMinimumDimension:");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setUuid:](v10, "setUuid:", v19);

  -[QLThumbnailGenerationRequest setBadgeType:](v10, "setBadgeType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bt")));
  -[QLThumbnailGenerationRequest setGenerationBehavior:](v10, "setGenerationBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("generationBehavior")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oCT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setOverriddenContentType:](v10, "setOverriddenContentType:", v20);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oCTI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setOverriddenContentTypeIdentifier:](v10, "setOverriddenContentTypeIdentifier:", v21);

  -[QLThumbnailGenerationRequest setInterpolationQuality:](v10, "setInterpolationQuality:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interpolationQuality")));
  -[QLThumbnailGenerationRequest setDownloadingAllowed:](v10, "setDownloadingAllowed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadingAllowed")));
  getFPSandboxingURLWrapperClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveURLSandboxWrapper"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveURLSandboxWrapper:](v10, "setSaveURLSandboxWrapper:", v22);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveFileHandle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveFileHandle:](v10, "setSaveFileHandle:", v23);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveURLContentType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveURLContentType:](v10, "setSaveURLContentType:", v24);

  +[QLThumbnailGenerationRequest customExtensionCommunicationEncodedClasses](QLThumbnailGenerationRequest, "customExtensionCommunicationEncodedClasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("etgd"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setExternalThumbnailGeneratorData:](v10, "setExternalThumbnailGeneratorData:", v26);

  -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v10, "setShouldUseRestrictedExtension:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUseRestrictedExtension")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setData:](v10, "setData:", v27);

  -[QLThumbnailGenerationRequest setThirdPartyVideoDecodersAllowed:](v10, "setThirdPartyVideoDecodersAllowed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("thirdPartyVideo")));
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveURLContentType, 0);
  objc_storeStrong((id *)&self->_saveFileHandle, 0);
  objc_storeStrong((id *)&self->_saveURLSandboxWrapper, 0);
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_externalThumbnailGeneratorData, 0);
  objc_storeStrong((id *)&self->_requestIsInvalidError, 0);
  objc_storeStrong((id *)&self->_fileProviderFileIdentifier, 0);
  objc_storeStrong((id *)&self->_basicFileIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_parentDirectorySandboxWrapper, 0);
  objc_storeStrong((id *)&self->_genericSandboxWrapper, 0);
  objc_storeStrong((id *)&self->_quicklookSandboxWrapper, 0);
  objc_storeStrong((id *)&self->_overriddenContentType, 0);
  objc_storeStrong((id *)&self->_overriddenContentTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_contentTypeUTI, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (void)setShouldUseRestrictedExtension:(BOOL)a3
{
  self->_shouldUseRestrictedExtension = a3;
}

- (void)setMinimumDimension:(CGFloat)minimumDimension
{
  self->_minimumDimension = minimumDimension;
}

- (void)setIconVariant:(int64_t)a3
{
  self->_iconVariant = a3;
}

- (void)setIconMode:(BOOL)iconMode
{
  self->_iconMode = iconMode;
}

- (void)setWantsBaseline:(BOOL)a3
{
  self->_wantsBaseline = a3;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setThirdPartyVideoDecodersAllowed:(BOOL)a3
{
  self->_thirdPartyVideoDecodersAllowed = a3;
}

- (void)setSaveURLSandboxWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_saveURLSandboxWrapper, a3);
}

- (void)setSaveURLContentType:(id)a3
{
  CFArrayRef v4;
  void *v5;
  char v6;
  UTType *v7;
  void *saveURLContentType;
  void *v9;
  id v10;

  v10 = a3;
  v4 = CGImageDestinationCopyTypeIdentifiers();
  if (v10
    && (objc_msgSend(v10, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[__CFArray containsObject:](v4, "containsObject:", v5),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a supported image type"), v10);
    saveURLContentType = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("QLThumbnailGeneratorInvalidContentType"), saveURLContentType, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  else
  {
    v7 = (UTType *)v10;
    saveURLContentType = self->_saveURLContentType;
    self->_saveURLContentType = v7;
  }

}

- (void)setSaveFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_saveFileHandle, a3);
}

- (void)setQuicklookSandboxWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_quicklookSandboxWrapper, a3);
}

- (void)setParentDirectorySandboxWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_parentDirectorySandboxWrapper, a3);
}

- (void)setOverriddenContentTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenContentTypeIdentifier, a3);
}

- (void)setOverriddenContentType:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenContentType, a3);
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)setInterpolationQuality:(int)a3
{
  self->_interpolationQuality = a3;
}

- (void)setGenericSandboxWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_genericSandboxWrapper, a3);
}

- (void)setGenerationBehavior:(int64_t)a3
{
  self->_generationBehavior = a3;
}

- (void)setFileProviderFileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderFileIdentifier, a3);
}

- (void)setExternalThumbnailGeneratorData:(id)a3
{
  objc_storeStrong((id *)&self->_externalThumbnailGeneratorData, a3);
}

- (void)setDownloadingAllowed:(BOOL)a3
{
  self->_downloadingAllowed = a3;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setBasicFileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_basicFileIdentifier, a3);
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

+ (id)customExtensionCommunicationEncodedClasses
{
  if (customExtensionCommunicationEncodedClasses_onceToken != -1)
    dispatch_once(&customExtensionCommunicationEncodedClasses_onceToken, &__block_literal_global_1);
  return (id)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;
}

- (QLThumbnailGenerationRequest)initWithFPItem:(id)a3 size:(CGSize)a4 scale:(double)a5 representationTypes:(unint64_t)a6
{
  double height;
  double width;
  id v12;
  void *v13;
  QLThumbnailGenerationRequest *v14;
  QLThumbnailGenerationRequest *v15;
  uint64_t v16;
  QLCacheFileProviderVersionedFileIdentifier *fileProviderFileIdentifier;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  if (!v12)
    -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:].cold.1();
  v13 = v12;
  v14 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", a6, width, height, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_item, a3);
    objc_msgSend((id)objc_opt_class(), "_fileProviderFileIdentifierForFPItem:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    fileProviderFileIdentifier = v15->_fileProviderFileIdentifier;
    v15->_fileProviderFileIdentifier = (QLCacheFileProviderVersionedFileIdentifier *)v16;

  }
  return v15;
}

- (QLThumbnailGenerationRequest)initWithFileAtURL:(NSURL *)url size:(CGSize)size scale:(CGFloat)scale representationTypes:(QLThumbnailGenerationRequestRepresentationTypes)representationTypes
{
  double height;
  double width;
  NSURL *v11;
  void *v12;
  QLThumbnailGenerationRequest *v13;
  NSURL *v14;
  NSURL *v16;

  height = size.height;
  width = size.width;
  v11 = url;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Tried to create QLThumbnailGenerationRequest with a nil url"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", representationTypes, width, height, scale);
  if (v13)
  {
    v16 = 0;
    -[NSURL getResourceValue:forKey:error:](v11, "getResourceValue:forKey:error:", &v16, CFSTR("FPUnflattenedPackageURL"), 0);
    if (v16)
      v14 = v16;
    else
      v14 = v11;
    objc_storeStrong((id *)&v13->_fileURL, v14);
  }

  return v13;
}

- (QLThumbnailGenerationRequest)initWithSize:(CGSize)a3 scale:(double)a4 representationTypes:(unint64_t)a5
{
  double v6;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  NSObject *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v6 = a4;
  height = a3.height;
  width = a3.width;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = round(a3.width * a4 * 1000.0) / 1000.0;
  v11 = round(a3.height * a4 * 1000.0) / 1000.0;
  v12 = ceil(v11);
  if (ceil(v10) != v10 || v12 != v11)
  {
    _log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219776;
      v19 = round(width);
      v20 = round(height);
      v24 = width;
      v21 = round(v6);
      v25 = 2048;
      v26 = height;
      v27 = 2048;
      v28 = v6;
      v29 = 2048;
      v30 = v10;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = v19;
      v35 = 2048;
      v36 = v20;
      v37 = 2048;
      v38 = v21;
      _os_log_error_impl(&dword_1AE3F5000, v14, OS_LOG_TYPE_ERROR, "Initialized QLThumbnailGenerationRequest with requested size of non-integer width or height. Passed (%f, %f, %f), making a scaled size of (%f, %f). Will round values to (%f, %f, %f)", buf, 0x52u);
      v6 = v21;
      height = v20;
      width = v19;
    }
    else
    {
      width = round(width);
      height = round(height);
      v6 = round(v6);
    }

  }
  v22.receiver = self;
  v22.super_class = (Class)QLThumbnailGenerationRequest;
  v15 = -[QLThumbnailGenerationRequest init](&v22, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v15 + 16);
    *((_QWORD *)v15 + 16) = v16;

    *((double *)v15 + 34) = width;
    *((double *)v15 + 35) = height;
    *((double *)v15 + 8) = v6;
    *((_QWORD *)v15 + 9) = a5;
    *((_QWORD *)v15 + 21) = 2;
    *(_OWORD *)(v15 + 152) = xmmword_1AE428870;
    v15[30] = 1;
    v15[27] = 0;
  }
  return (QLThumbnailGenerationRequest *)v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  FPSandboxingURLWrapper *quicklookSandboxWrapper;
  FPSandboxingURLWrapper *genericSandboxWrapper;
  FPSandboxingURLWrapper *parentDirectorySandboxWrapper;
  FPItem *item;
  QLCacheFileProviderVersionedFileIdentifier *fileProviderFileIdentifier;
  QLCacheBasicVersionedFileIdentifier *basicFileIdentifier;
  UTType *overriddenContentType;
  NSString *overriddenContentTypeIdentifier;
  void *v13;
  FPSandboxingURLWrapper *saveURLSandboxWrapper;
  NSFileHandle *saveFileHandle;
  NSDictionary *externalThumbnailGeneratorData;
  id v17;

  v4 = a3;
  quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
  v17 = v4;
  if (quicklookSandboxWrapper)
    objc_msgSend(v4, "encodeObject:forKey:", quicklookSandboxWrapper, CFSTR("quicklookSandboxWrapper"));
  genericSandboxWrapper = self->_genericSandboxWrapper;
  if (genericSandboxWrapper)
    objc_msgSend(v17, "encodeObject:forKey:", genericSandboxWrapper, CFSTR("genericSandboxWrapper"));
  parentDirectorySandboxWrapper = self->_parentDirectorySandboxWrapper;
  if (parentDirectorySandboxWrapper)
    objc_msgSend(v17, "encodeObject:forKey:", parentDirectorySandboxWrapper, CFSTR("parentDirSandboxWrapper"));
  item = self->_item;
  if (item)
    objc_msgSend(v17, "encodeObject:forKey:", item, CFSTR("it"));
  fileProviderFileIdentifier = self->_fileProviderFileIdentifier;
  if (fileProviderFileIdentifier)
    objc_msgSend(v17, "encodeObject:forKey:", fileProviderFileIdentifier, CFSTR("fpfi"));
  basicFileIdentifier = self->_basicFileIdentifier;
  if (basicFileIdentifier)
    objc_msgSend(v17, "encodeObject:forKey:", basicFileIdentifier, CFSTR("bfi"));
  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType)
    objc_msgSend(v17, "encodeObject:forKey:", overriddenContentType, CFSTR("oCT"));
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  if (overriddenContentTypeIdentifier)
    objc_msgSend(v17, "encodeObject:forKey:", overriddenContentTypeIdentifier, CFSTR("oCTI"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_size, "{CGSize=dd}");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("si"));

  objc_msgSend(v17, "encodeDouble:forKey:", CFSTR("sc"), self->_scale);
  objc_msgSend(v17, "encodeBool:forKey:", self->_iconMode, CFSTR("i"));
  objc_msgSend(v17, "encodeInteger:forKey:", self->_badgeType, CFSTR("bt"));
  objc_msgSend(v17, "encodeDouble:forKey:", CFSTR("ms"), self->_minimumDimension);
  objc_msgSend(v17, "encodeInteger:forKey:", self->_representationTypes, CFSTR("rt"));
  objc_msgSend(v17, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v17, "encodeInteger:forKey:", self->_iconVariant, CFSTR("iv"));
  objc_msgSend(v17, "encodeBool:forKey:", self->_wantsBaseline, CFSTR("baseline"));
  objc_msgSend(v17, "encodeInteger:forKey:", self->_generationBehavior, CFSTR("generationBehavior"));
  objc_msgSend(v17, "encodeInteger:forKey:", self->_interpolationQuality, CFSTR("interpolationQuality"));
  saveURLSandboxWrapper = self->_saveURLSandboxWrapper;
  if (saveURLSandboxWrapper)
    objc_msgSend(v17, "encodeObject:forKey:", saveURLSandboxWrapper, CFSTR("saveURLSandboxWrapper"));
  saveFileHandle = self->_saveFileHandle;
  if (saveFileHandle)
    objc_msgSend(v17, "encodeObject:forKey:", saveFileHandle, CFSTR("saveFileHandle"));
  objc_msgSend(v17, "encodeBool:forKey:", self->_downloadingAllowed, CFSTR("downloadingAllowed"));
  objc_msgSend(v17, "encodeObject:forKey:", self->_saveURLContentType, CFSTR("saveURLContentType"));
  externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
  if (externalThumbnailGeneratorData)
    objc_msgSend(v17, "encodeObject:forKey:", externalThumbnailGeneratorData, CFSTR("etgd"));
  objc_msgSend(v17, "encodeBool:forKey:", self->_shouldUseRestrictedExtension, CFSTR("shouldUseRestrictedExtension"));
  objc_msgSend(v17, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v17, "encodeBool:forKey:", self->_thirdPartyVideoDecodersAllowed, CFSTR("thirdPartyVideo"));

}

- (BOOL)isValid
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[QLThumbnailGenerationRequest isUbiquitous](self, "isUbiquitous"))
    return 1;
  -[QLThumbnailGenerationRequest quicklookSandboxWrapper](self, "quicklookSandboxWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[QLThumbnailGenerationRequest genericSandboxWrapper](self, "genericSandboxWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v3 = 1;
    else
      v3 = -[QLThumbnailGenerationRequest isDataBased](self, "isDataBased");

  }
  return v3;
}

- (FPSandboxingURLWrapper)quicklookSandboxWrapper
{
  return self->_quicklookSandboxWrapper;
}

- (NSString)contentTypeUTI
{
  UTType *overriddenContentType;
  NSString *v4;
  NSString *overriddenContentTypeIdentifier;
  FPItem *item;
  void *v8;
  UTType *v9;
  UTType *contentType;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSString *v17;
  NSString *contentTypeUTI;

  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType)
    goto LABEL_3;
  overriddenContentType = self->_contentType;
  if (overriddenContentType)
    goto LABEL_3;
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  if (overriddenContentTypeIdentifier || (overriddenContentTypeIdentifier = self->_contentTypeUTI) != 0)
  {
LABEL_20:
    v4 = overriddenContentTypeIdentifier;
    return v4;
  }
  item = self->_item;
  if (!item)
  {
    -[QLThumbnailGenerationRequest fileURL](self, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[QLThumbnailGenerationRequest genericSandboxWrapper](self, "genericSandboxWrapper"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "url"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11))
    {
      if (_CFURLIsItemPromiseAtURL())
      {
        v13 = _CFURLCopyLogicalURLOfPromiseAtURL();
        v14 = (void *)v13;
        if (v13)
          v15 = (void *)v13;
        else
          v15 = v11;
        v16 = v15;

      }
      else
      {
        v16 = v11;
      }
      +[QLUTIAnalyzer UTIForURL:](QLUTIAnalyzer, "UTIForURL:", v16);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      contentTypeUTI = self->_contentTypeUTI;
      self->_contentTypeUTI = v17;

    }
    goto LABEL_19;
  }
  -[FPItem contentType](item, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_19:
    overriddenContentTypeIdentifier = self->_contentTypeUTI;
    goto LABEL_20;
  }
  -[FPItem contentType](self->_item, "contentType");
  v9 = (UTType *)objc_claimAutoreleasedReturnValue();
  contentType = self->_contentType;
  self->_contentType = v9;

  overriddenContentType = self->_contentType;
LABEL_3:
  -[UTType identifier](overriddenContentType, "identifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (FPSandboxingURLWrapper)genericSandboxWrapper
{
  return self->_genericSandboxWrapper;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isUbiquitous
{
  void *v2;
  BOOL v3;

  -[QLThumbnailGenerationRequest item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (FPItem)item
{
  return self->_item;
}

- (BOOL)resultShouldBeSavedToDisk
{
  void *v3;
  BOOL v4;
  void *v5;

  -[QLThumbnailGenerationRequest saveURL](self, "saveURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[QLThumbnailGenerationRequest saveFileHandle](self, "saveFileHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)saveURL
{
  return (id)-[FPSandboxingURLWrapper url](self->_saveURLSandboxWrapper, "url");
}

- (NSFileHandle)saveFileHandle
{
  return self->_saveFileHandle;
}

- (BOOL)isFileBased
{
  void *v3;
  BOOL v4;
  void *v5;

  -[FPSandboxingURLWrapper url](self->_quicklookSandboxWrapper, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[FPSandboxingURLWrapper url](self->_genericSandboxWrapper, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 1;
    else
      v4 = self->_fileURL != 0;

  }
  return v4;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setMostRepresentativeThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, a3);
}

- (unint64_t)externalThumbnailGeneratorDataHash
{
  NSDictionary *externalThumbnailGeneratorData;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
  if (externalThumbnailGeneratorData && !self->_externalThumbnailGeneratorDataHash)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSDictionary allValues](externalThumbnailGeneratorData, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            self->_externalThumbnailGeneratorDataHash ^= objc_msgSend(v9, "hash");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  return self->_externalThumbnailGeneratorDataHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mostRepresentativeTypeForWhichUpdateBlockHasBeenCalled
{
  return flsl(-[QLThumbnailGenerationRequest typesForWhichUpdateBlockHasBeenCalled](self, "typesForWhichUpdateBlockHasBeenCalled"))- 1;
}

- (unint64_t)typesForWhichUpdateBlockHasBeenCalled
{
  return self->_typesForWhichUpdateBlockHasBeenCalled;
}

- (FPSandboxingURLWrapper)parentDirectorySandboxWrapper
{
  return self->_parentDirectorySandboxWrapper;
}

- (UTType)overriddenContentType
{
  return self->_overriddenContentType;
}

- (NSString)overriddenContentTypeIdentifier
{
  return self->_overriddenContentTypeIdentifier;
}

- (BOOL)isDownloadingAllowed
{
  return self->_downloadingAllowed;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:scale:representationTypes:", self->_representationTypes, self->_size.width, self->_size.height, self->_scale);
  objc_msgSend(v4, "setQuicklookSandboxWrapper:", self->_quicklookSandboxWrapper);
  objc_msgSend(v4, "setGenericSandboxWrapper:", self->_genericSandboxWrapper);
  objc_msgSend(v4, "setParentDirectorySandboxWrapper:", self->_parentDirectorySandboxWrapper);
  objc_msgSend(v4, "setItem:", self->_item);
  objc_msgSend(v4, "setOverriddenContentType:", self->_overriddenContentType);
  objc_msgSend(v4, "setOverriddenContentTypeIdentifier:", self->_overriddenContentTypeIdentifier);
  objc_msgSend(v4, "setBasicFileIdentifier:", self->_basicFileIdentifier);
  objc_msgSend(v4, "setFileProviderFileIdentifier:", self->_fileProviderFileIdentifier);
  objc_msgSend(v4, "setIconMode:", self->_iconMode);
  objc_msgSend(v4, "setIconVariant:", self->_iconVariant);
  objc_msgSend(v4, "setWantsBaseline:", self->_wantsBaseline);
  objc_msgSend(v4, "setMinimumDimension:", self->_minimumDimension);
  objc_msgSend(v4, "setUuid:", self->_uuid);
  objc_msgSend(v4, "setBadgeType:", self->_badgeType);
  objc_msgSend(v4, "setGenerationBehavior:", self->_generationBehavior);
  objc_msgSend(v4, "setInterpolationQuality:", self->_interpolationQuality);
  objc_msgSend(v4, "setDownloadingAllowed:", self->_downloadingAllowed);
  objc_msgSend(v4, "setSaveURLSandboxWrapper:", self->_saveURLSandboxWrapper);
  objc_msgSend(v4, "setSaveFileHandle:", self->_saveFileHandle);
  objc_msgSend(v4, "setSaveURLContentType:", self->_saveURLContentType);
  objc_msgSend(v4, "setExternalThumbnailGeneratorData:", self->_externalThumbnailGeneratorData);
  objc_msgSend(v4, "setShouldUseRestrictedExtension:", self->_shouldUseRestrictedExtension);
  objc_msgSend(v4, "setThirdPartyVideoDecodersAllowed:", self->_thirdPartyVideoDecodersAllowed);
  objc_msgSend(v4, "setData:", self->_data);
  return v4;
}

- (UTType)contentType
{
  UTType *overriddenContentType;
  UTType *v4;
  void *v6;
  UTType *v7;
  UTType *contentType;
  UTType *v9;
  NSObject *v10;

  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType || (overriddenContentType = self->_contentType) != 0)
  {
    v4 = overriddenContentType;
  }
  else
  {
    -[QLThumbnailGenerationRequest contentTypeUTI](self, "contentTypeUTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v6);
      v7 = (UTType *)objc_claimAutoreleasedReturnValue();
      contentType = self->_contentType;
      self->_contentType = v7;

      v9 = self->_contentType;
      if (!v9)
      {
        _log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[QLThumbnailGenerationRequest contentType].cold.1((uint64_t)v6);

        v9 = self->_contentType;
      }
      v4 = v9;
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)cancel
{
  -[QLThumbnailGenerationRequest setCancelled:](self, "setCancelled:", 1);
}

- (QLThumbnailGenerationRequest)initWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 scale:(double)a6 representationTypes:(unint64_t)a7
{
  double height;
  double width;
  id v14;
  id v15;
  void *v16;
  QLThumbnailGenerationRequest *v17;
  QLThumbnailGenerationRequest *v18;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  if (!v14 || (v16 = v15) == 0)
    -[QLThumbnailGenerationRequest initWithData:contentType:size:scale:representationTypes:].cold.1();
  v17 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", a7, width, height, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    -[QLThumbnailGenerationRequest setContentTypeUTI:](v18, "setContentTypeUTI:", v16);
  }

  return v18;
}

+ (QLThumbnailGenerationRequest)requestWithThumbnailRequest:(id)a3
{
  id v3;
  char isKindOfClass;
  id v5;
  QLThumbnailGenerationRequest *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  QLThumbnailGenerationRequest *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v3;
    v6 = [QLThumbnailGenerationRequest alloc];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v5, "scale");
      v13 = v12;

      v14 = -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:](v6, "initWithFPItem:size:scale:representationTypes:", v7, -1, v9, v11, v13);
    }
    else
    {
      objc_msgSend(v5, "genericSandboxWrapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v5, "scale");
      v21 = v20;

      v14 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:](v6, "initWithFileAtURL:size:scale:representationTypes:", v15, -1, v17, v19, v21);
    }

    objc_msgSend(v5, "minimumDimension");
    -[QLThumbnailGenerationRequest setMinimumDimension:](v14, "setMinimumDimension:");
    -[QLThumbnailGenerationRequest setBadgeType:](v14, "setBadgeType:", objc_msgSend(v5, "badgeType"));
    -[QLThumbnailGenerationRequest setIconMode:](v14, "setIconMode:", objc_msgSend(v5, "iconMode"));
    -[QLThumbnailGenerationRequest setWantsBaseline:](v14, "setWantsBaseline:", objc_msgSend(v5, "wantsBaseline"));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setSaveURL:(id)a3
{
  id v4;
  id FPSandboxingURLWrapperClass;
  uint64_t v6;
  FPSandboxingURLWrapper *v7;
  id v8;
  id v9;
  FPSandboxingURLWrapper *saveURLSandboxWrapper;
  NSObject *v11;
  id v12;

  v4 = a3;
  FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  v6 = *MEMORY[0x1E0C80008];
  v12 = 0;
  objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v4, v6, &v12);
  v7 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v12;
  saveURLSandboxWrapper = self->_saveURLSandboxWrapper;
  self->_saveURLSandboxWrapper = v7;

  if (!self->_saveURLSandboxWrapper || v9)
  {
    _log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLThumbnailGenerationRequest setSaveURL:].cold.1((uint64_t)v4);

    objc_storeStrong((id *)&self->_requestIsInvalidError, v8);
  }

}

- (void)setContentType:(UTType *)contentType
{
  NSString *overriddenContentTypeIdentifier;
  UTType *v6;
  NSString *contentTypeUTI;
  UTType *v8;

  objc_storeStrong((id *)&self->_overriddenContentType, contentType);
  v8 = contentType;
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  self->_overriddenContentTypeIdentifier = 0;

  v6 = self->_contentType;
  self->_contentType = 0;

  contentTypeUTI = self->_contentTypeUTI;
  self->_contentTypeUTI = 0;

}

- (void)setContentTypeUTI:(id)a3
{
  NSString *v4;
  UTType *overriddenContentType;
  NSString *overriddenContentTypeIdentifier;
  UTType *contentType;
  NSString *contentTypeUTI;
  NSString *v9;

  v4 = (NSString *)a3;
  overriddenContentType = self->_overriddenContentType;
  self->_overriddenContentType = 0;

  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  self->_overriddenContentTypeIdentifier = v4;
  v9 = v4;

  contentType = self->_contentType;
  self->_contentType = 0;

  contentTypeUTI = self->_contentTypeUTI;
  self->_contentTypeUTI = 0;

}

- (BOOL)provideFullResolutionThumbnail
{
  return (LOBYTE(self->_representationTypes) >> 2) & 1;
}

- (id)equivalentFPItemRequestWithItem:(id)a3 representationTypes:(unint64_t)a4
{
  id v6;
  QLThumbnailGenerationRequest *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  QLThumbnailGenerationRequest *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = [QLThumbnailGenerationRequest alloc];
  -[QLThumbnailGenerationRequest size](self, "size");
  v9 = v8;
  v11 = v10;
  -[QLThumbnailGenerationRequest scale](self, "scale");
  v13 = -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:](v7, "initWithFPItem:size:scale:representationTypes:", v6, a4, v9, v11, v12);

  -[QLThumbnailGenerationRequest setIconMode:](v13, "setIconMode:", -[QLThumbnailGenerationRequest iconMode](self, "iconMode"));
  -[QLThumbnailGenerationRequest setIconVariant:](v13, "setIconVariant:", -[QLThumbnailGenerationRequest iconVariant](self, "iconVariant"));
  -[QLThumbnailGenerationRequest setInterpolationQuality:](v13, "setInterpolationQuality:", -[QLThumbnailGenerationRequest interpolationQuality](self, "interpolationQuality"));
  -[QLThumbnailGenerationRequest minimumDimension](self, "minimumDimension");
  -[QLThumbnailGenerationRequest setMinimumDimension:](v13, "setMinimumDimension:");
  -[QLThumbnailGenerationRequest setBadgeType:](v13, "setBadgeType:", -[QLThumbnailGenerationRequest badgeType](self, "badgeType"));
  -[QLThumbnailGenerationRequest saveURLSandboxWrapper](self, "saveURLSandboxWrapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveURLSandboxWrapper:](v13, "setSaveURLSandboxWrapper:", v14);

  -[QLThumbnailGenerationRequest saveFileHandle](self, "saveFileHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveFileHandle:](v13, "setSaveFileHandle:", v15);

  -[QLThumbnailGenerationRequest saveURLContentType](self, "saveURLContentType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setSaveURLContentType:](v13, "setSaveURLContentType:", v16);

  -[QLThumbnailGenerationRequest setDownloadingAllowed:](v13, "setDownloadingAllowed:", -[QLThumbnailGenerationRequest isDownloadingAllowed](self, "isDownloadingAllowed"));
  -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v13, "setShouldUseRestrictedExtension:", -[QLThumbnailGenerationRequest shouldUseRestrictedExtension](self, "shouldUseRestrictedExtension"));
  return v13;
}

void __74__QLThumbnailGenerationRequest_customExtensionCommunicationEncodedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;
  customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses = v7;

}

- (int64_t)compare:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  float v23;
  float v24;
  float v25;
  int v26;
  int v27;

  v4 = a3;
  v5 = -[QLThumbnailGenerationRequest iconMode](self, "iconMode");
  v6 = objc_msgSend(v4, "iconMode");
  if (!v5 && (v6 & 1) != 0)
    goto LABEL_3;
  if ((!v5 | v6) != 1)
    goto LABEL_9;
  v8 = -[QLThumbnailGenerationRequest badgeType](self, "badgeType");
  v9 = objc_msgSend(v4, "badgeType");
  if (!v8 && v9)
  {
LABEL_3:
    v7 = -1;
    goto LABEL_10;
  }
  if (v8 && !v9)
  {
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  v11 = -[QLThumbnailGenerationRequest iconVariant](self, "iconVariant");
  if (v11 == objc_msgSend(v4, "iconVariant"))
  {
    -[QLThumbnailGenerationRequest maximumPixelSize](self, "maximumPixelSize");
    v13 = v12;
    objc_msgSend(v4, "maximumPixelSize");
    if (v13 >= v14)
    {
      -[QLThumbnailGenerationRequest maximumPixelSize](self, "maximumPixelSize");
      v24 = v23;
      objc_msgSend(v4, "maximumPixelSize");
      if (v24 > v25)
        goto LABEL_9;
    }
    else
    {
      -[QLThumbnailGenerationRequest minimumDimension](self, "minimumDimension");
      v16 = v15;
      objc_msgSend(v4, "minimumDimension");
      if (v16 != v17)
      {
        -[QLThumbnailGenerationRequest minimumDimension](self, "minimumDimension");
        v19 = v18;
        objc_msgSend(v4, "minimumDimension");
        if (v19 > v20)
          v7 = 1;
        else
          v7 = -1;
        goto LABEL_10;
      }
    }
    v26 = -[QLThumbnailGenerationRequest interpolationQuality](self, "interpolationQuality");
    if (v26 == objc_msgSend(v4, "interpolationQuality"))
    {
      v7 = 0;
      goto LABEL_10;
    }
    v27 = -[QLThumbnailGenerationRequest interpolationQuality](self, "interpolationQuality");
    v22 = v27 < (int)objc_msgSend(v4, "interpolationQuality");
  }
  else
  {
    v21 = -[QLThumbnailGenerationRequest iconVariant](self, "iconVariant");
    v22 = v21 < objc_msgSend(v4, "iconVariant");
  }
  if (v22)
    v7 = -1;
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (id)copyWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;

  height = a3.height;
  width = a3.width;
  v5 = (void *)-[QLThumbnailGenerationRequest copy](self, "copy");
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  QLThumbnailGenerationRequest *v4;
  QLThumbnailGenerationRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  NSUUID *uuid;
  void *v14;
  double v15;
  double v16;
  double scale;
  double v18;
  _BOOL4 iconMode;
  unint64_t badgeType;
  double minimumDimension;
  double v22;
  unint64_t representationTypes;
  int64_t iconVariant;
  _BOOL4 wantsBaseline;
  int interpolationQuality;
  NSDictionary *externalThumbnailGeneratorData;
  NSDictionary *v28;
  NSDictionary *v29;
  void *v30;
  UTType *overriddenContentType;
  UTType *v33;
  UTType *v34;
  NSString *overriddenContentTypeIdentifier;
  uint64_t v36;
  void *v37;
  NSString *v38;
  void *v39;
  NSDictionary *v40;
  void *v41;
  void *v42;

  v4 = (QLThumbnailGenerationRequest *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[QLThumbnailGenerationRequest fileIdentifier](self, "fileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailGenerationRequest fileIdentifier](v5, "fileIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[QLThumbnailGenerationRequest fileIdentifier](self, "fileIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLThumbnailGenerationRequest fileIdentifier](v5, "fileIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
        {
          v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      uuid = self->_uuid;
      -[QLThumbnailGenerationRequest uuid](v5, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](uuid, "isEqual:", v14))
        goto LABEL_23;
      -[QLThumbnailGenerationRequest size](v5, "size");
      v12 = 0;
      if (self->_size.width != v16 || self->_size.height != v15)
        goto LABEL_24;
      scale = self->_scale;
      -[QLThumbnailGenerationRequest scale](v5, "scale");
      if (scale != v18)
        goto LABEL_23;
      iconMode = self->_iconMode;
      if (iconMode != -[QLThumbnailGenerationRequest iconMode](v5, "iconMode")
        || (badgeType = self->_badgeType, badgeType != -[QLThumbnailGenerationRequest badgeType](v5, "badgeType"))
        || (minimumDimension = self->_minimumDimension,
            -[QLThumbnailGenerationRequest minimumDimension](v5, "minimumDimension"),
            minimumDimension != v22)
        || (representationTypes = self->_representationTypes,
            representationTypes != -[QLThumbnailGenerationRequest representationTypes](v5, "representationTypes"))
        || (iconVariant = self->_iconVariant,
            iconVariant != -[QLThumbnailGenerationRequest iconVariant](v5, "iconVariant"))
        || (wantsBaseline = self->_wantsBaseline,
            wantsBaseline != -[QLThumbnailGenerationRequest wantsBaseline](v5, "wantsBaseline"))
        || (interpolationQuality = self->_interpolationQuality,
            interpolationQuality != -[QLThumbnailGenerationRequest interpolationQuality](v5, "interpolationQuality")))
      {
LABEL_23:
        v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
      -[QLThumbnailGenerationRequest externalThumbnailGeneratorData](v5, "externalThumbnailGeneratorData");
      v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (externalThumbnailGeneratorData != v28)
      {
        v29 = self->_externalThumbnailGeneratorData;
        -[QLThumbnailGenerationRequest externalThumbnailGeneratorData](v5, "externalThumbnailGeneratorData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDictionary isEqual:](v29, "isEqual:", v30))
        {
          v12 = 0;
          goto LABEL_39;
        }
        v42 = v30;
      }
      overriddenContentType = self->_overriddenContentType;
      -[QLThumbnailGenerationRequest overriddenContentType](v5, "overriddenContentType");
      v33 = (UTType *)objc_claimAutoreleasedReturnValue();
      if (overriddenContentType == v33)
      {
        v40 = externalThumbnailGeneratorData;
      }
      else
      {
        v34 = self->_overriddenContentType;
        -[QLThumbnailGenerationRequest overriddenContentType](v5, "overriddenContentType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[UTType isEqual:](v34, "isEqual:"))
        {
          v12 = 0;
          v30 = v42;
          goto LABEL_37;
        }
        v40 = externalThumbnailGeneratorData;
      }
      overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
      -[QLThumbnailGenerationRequest overriddenContentTypeIdentifier](v5, "overriddenContentTypeIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();
      if (overriddenContentTypeIdentifier == (NSString *)v36)
      {

        v12 = 1;
      }
      else
      {
        v37 = (void *)v36;
        v38 = self->_overriddenContentTypeIdentifier;
        -[QLThumbnailGenerationRequest overriddenContentTypeIdentifier](v5, "overriddenContentTypeIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](v38, "isEqual:", v39);

      }
      v30 = v42;
      externalThumbnailGeneratorData = v40;
      if (overriddenContentType == v33)
      {
LABEL_38:

        if (externalThumbnailGeneratorData == v28)
        {
LABEL_40:

          goto LABEL_24;
        }
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:

      goto LABEL_38;
    }
    v12 = 0;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t width;
  unint64_t v6;

  -[QLThumbnailGenerationRequest fileIdentifier](self, "fileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  width = (unint64_t)self->_size.width;
  v6 = v4 ^ -[NSUUID hash](self->_uuid, "hash") ^ width;

  return v6;
}

- (id)description
{
  __CFString *v3;
  const __CFString *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  QLThumbnailGenerationRequestRepresentationTypes v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  QLThumbnailGenerationRequestRepresentationTypes v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  QLThumbnailGenerationRequestRepresentationTypes v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  QLThumbnailGenerationRequestRepresentationTypes v42;
  QLThumbnailGenerationRequestRepresentationTypes v43;
  uint64_t v44;
  id v45;
  id v46;
  const __CFString *v47;

  if (-[QLThumbnailGenerationRequest iconMode](self, "iconMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(icon mode, variant %lu)"), -[QLThumbnailGenerationRequest iconVariant](self, "iconVariant"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E5D7DA98;
  }
  if (-[QLThumbnailGenerationRequest badgeType](self, "badgeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(badge %lu)"), -[QLThumbnailGenerationRequest badgeType](self, "badgeType"));
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E5D7DA98;
  }
  v47 = v4;
  if (-[QLThumbnailGenerationRequest isFileBased](self, "isFileBased"))
  {
    v45 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v44 = objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest uuid](self, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest genericSandboxWrapper](self, "genericSandboxWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest fileIdentifier](self, "fileIdentifier");
    v10 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[QLThumbnailGenerationRequest representationTypes](self, "representationTypes");
    -[QLThumbnailGenerationRequest size](self, "size");
    v14 = v13;
    -[QLThumbnailGenerationRequest size](self, "size");
    v16 = v15;
    -[QLThumbnailGenerationRequest _stateDescription](self, "_stateDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (__CFString *)v47;
    v42 = v12;
    v19 = (void *)v6;
    v20 = (void *)v44;
    v21 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("<%@:%p uuid:%@ %@ (fi:%@) (rt:%lu) {%g,%g} %@ %@ - %@>"), v44, self, v19, v9, v11, v42, v14, v16, v10, v47, v17);

    v3 = v10;
  }
  else
  {
    v22 = -[QLThumbnailGenerationRequest isUbiquitous](self, "isUbiquitous");
    v46 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest uuid](self, "uuid");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[FPItem providerDomainID](self->_item, "providerDomainID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPItem itemIdentifier](self->_item, "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPItem displayName](self->_item, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[QLThumbnailGenerationRequest representationTypes](self, "representationTypes");
      -[QLThumbnailGenerationRequest size](self, "size");
      v28 = v27;
      -[QLThumbnailGenerationRequest size](self, "size");
      v30 = v29;
      -[QLThumbnailGenerationRequest _stateDescription](self, "_stateDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (__CFString *)v47;
      v43 = v26;
      v19 = (void *)v25;
      v39 = v25;
      v20 = (void *)v24;
      v21 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("<%@:%p uuid:%@ %@/%@ (%@) (rt:%lu) {%g, %g} %@ %@ - %@>"), v24, self, v39, v7, v8, v9, v43, v28, v30, v3, v47, v31);

    }
    else
    {
      -[QLThumbnailGenerationRequest data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v7, "length");
      -[QLThumbnailGenerationRequest contentTypeUTI](self, "contentTypeUTI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[QLThumbnailGenerationRequest representationTypes](self, "representationTypes");
      -[QLThumbnailGenerationRequest size](self, "size");
      v35 = v34;
      -[QLThumbnailGenerationRequest size](self, "size");
      v37 = v36;
      -[QLThumbnailGenerationRequest _stateDescription](self, "_stateDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (__CFString *)v47;
      v40 = v25;
      v41 = v32;
      v19 = (void *)v25;
      v20 = (void *)v24;
      v21 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("<%@:%p uuid:%@ (data request, l: %lu, %@) (rt:%lu) {%g, %g} %@ %@ - %@>"), v24, self, v40, v41, v8, v33, v35, v37, v3, v47, v9);
    }
  }

  return v21;
}

- (id)_stateDescription
{
  void *v4;

  if (-[QLThumbnailGenerationRequest isCancelled](self, "isCancelled"))
    return CFSTR("Cancelled");
  if (-[QLThumbnailGenerationRequest isFinished](self, "isFinished"))
    return CFSTR("Finished");
  -[QLThumbnailGenerationRequest beginDate](self, "beginDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return CFSTR("Running");
  else
    return CFSTR("Not started");
}

void __49__QLThumbnailGenerationRequest_prepareForSending__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "ql_realpathURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = _CFURLPromiseCopyPhysicalURL();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)noteUpdateBlockHasBeenCalledForType:(int64_t)a3
{
  self->_typesForWhichUpdateBlockHasBeenCalled |= 1 << a3;
}

- (BOOL)thirdPartyVideoDecodersAllowed
{
  return self->_thirdPartyVideoDecodersAllowed;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setRepresentationTypes:(unint64_t)a3
{
  self->_representationTypes = a3;
}

- (NSData)data
{
  return self->_data;
}

- (QLCacheBasicVersionedFileIdentifier)basicFileIdentifier
{
  return self->_basicFileIdentifier;
}

- (QLCacheFileProviderVersionedFileIdentifier)fileProviderFileIdentifier
{
  return self->_fileProviderFileIdentifier;
}

- (BOOL)wantsBaseline
{
  return self->_wantsBaseline;
}

- (void)setRequestIsInvalidError:(id)a3
{
  objc_storeStrong((id *)&self->_requestIsInvalidError, a3);
}

- (NSDictionary)externalThumbnailGeneratorData
{
  return self->_externalThumbnailGeneratorData;
}

- (void)setExternalThumbnailGeneratorDataHash:(unint64_t)a3
{
  self->_externalThumbnailGeneratorDataHash = a3;
}

- (BOOL)shouldUseRestrictedExtension
{
  return self->_shouldUseRestrictedExtension;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (FPSandboxingURLWrapper)saveURLSandboxWrapper
{
  return self->_saveURLSandboxWrapper;
}

- (UTType)saveURLContentType
{
  return self->_saveURLContentType;
}

- (void)setTypesForWhichUpdateBlockHasBeenCalled:(unint64_t)a3
{
  self->_typesForWhichUpdateBlockHasBeenCalled = a3;
}

- (void)initWithFPItem:size:scale:representationTypes:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:]", "QLThumbnailGenerationRequest.m", 126, "item != nil");
}

- (void)initWithData:contentType:size:scale:representationTypes:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerationRequest initWithData:contentType:size:scale:representationTypes:]", "QLThumbnailGenerationRequest.m", 143, "data != nil && contentType != nil");
}

- (void)setSaveURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Could not create a FPSandboxingURLWrapper for save URL %@ for thumbnail request. Error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)contentType
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Invalid type identifier %@ set on %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)prepareForSending
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Could not coordinate to tag potentially logical URL %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
