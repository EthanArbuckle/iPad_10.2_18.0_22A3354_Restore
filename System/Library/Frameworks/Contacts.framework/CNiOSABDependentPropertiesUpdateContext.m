@implementation CNiOSABDependentPropertiesUpdateContext

+ (id)os_log
{
  if (os_log_cn_once_token_0_15 != -1)
    dispatch_once(&os_log_cn_once_token_0_15, &__block_literal_global_95);
  return (id)os_log_cn_once_object_0_15;
}

void __49__CNiOSABDependentPropertiesUpdateContext_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNiOSABDependentPropertiesUpdateContext");
  v1 = (void *)os_log_cn_once_object_0_15;
  os_log_cn_once_object_0_15 = (uint64_t)v0;

}

- (void)setPendingImageData:(id)a3
{
  NSData *v4;
  NSData *pendingImageData;

  if (self->_pendingImageData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    pendingImageData = self->_pendingImageData;
    self->_pendingImageData = v4;

  }
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingImageData:](self, "setHasPendingImageData:", 1);
}

- (void)setPendingCropRect:(CGRect)a3
{
  self->_pendingCropRect = a3;
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingCropRect:](self, "setHasPendingCropRect:", !CGRectEqualToRect(a3, *MEMORY[0x1E0C9D648]));
}

- (void)setPendingThumbnailImageData:(id)a3
{
  NSData *v4;
  NSData *pendingThumbnailImageData;

  if (self->_pendingThumbnailImageData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    pendingThumbnailImageData = self->_pendingThumbnailImageData;
    self->_pendingThumbnailImageData = v4;

  }
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingThumbnailImageData:](self, "setHasPendingThumbnailImageData:", 1);
}

- (void)setPendingSyncImageData:(id)a3
{
  NSData *v4;
  NSData *pendingSyncImageData;

  if (self->_pendingSyncImageData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    pendingSyncImageData = self->_pendingSyncImageData;
    self->_pendingSyncImageData = v4;

  }
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingSyncImageData:](self, "setHasPendingSyncImageData:", 1);
}

- (void)resetAllData
{
  NSData *pendingImageData;
  NSData *pendingThumbnailImageData;
  NSData *pendingFullscreenImageData;
  NSData *pendingSyncImageData;
  CGSize v7;

  pendingImageData = self->_pendingImageData;
  self->_pendingImageData = 0;

  pendingThumbnailImageData = self->_pendingThumbnailImageData;
  self->_pendingThumbnailImageData = 0;

  pendingFullscreenImageData = self->_pendingFullscreenImageData;
  self->_pendingFullscreenImageData = 0;

  pendingSyncImageData = self->_pendingSyncImageData;
  self->_pendingSyncImageData = 0;

  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_pendingCropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_pendingCropRect.size = v7;
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingCropRect:](self, "setHasPendingCropRect:", 0);
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingImageData:](self, "setHasPendingImageData:", 0);
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingThumbnailImageData:](self, "setHasPendingThumbnailImageData:", 0);
  -[CNiOSABDependentPropertiesUpdateContext setHasPendingSyncImageData:](self, "setHasPendingSyncImageData:", 0);
}

- (BOOL)logIfConditionFailed:(BOOL)a3 message:(id)a4 error:(__CFError *)a5
{
  id v7;
  NSObject *v8;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNiOSABDependentPropertiesUpdateContext logIfConditionFailed:message:error:].cold.1((uint64_t)v7, (uint64_t)a5, v8);

  }
  return 1;
}

- (BOOL)flushPendingImageChangesToPerson:(void *)a3 logger:(id)a4 error:(id *)a5
{
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  CNiOSABDependentPropertiesUpdateContext *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  CNiOSABDependentPropertiesUpdateContext *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  CNiOSABDependentPropertiesUpdateContext *v33;
  void *v34;
  CGRect v35;

  v8 = a4;
  v9 = -[CNiOSABDependentPropertiesUpdateContext hasPendingImageData](self, "hasPendingImageData");
  v10 = -[CNiOSABDependentPropertiesUpdateContext hasPendingCropRect](self, "hasPendingCropRect");
  if (v9)
  {
    if (v10)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_2;
      v28[3] = &unk_1E29FC2C0;
      v28[4] = self;
      v29 = v8;
      v30 = a3;
      v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v28);
      v12 = v29;
    }
    else
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke;
      v31[3] = &unk_1E29FC2C0;
      v32 = v8;
      v33 = self;
      v34 = a3;
      v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v31);
      v12 = v32;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    -[CNiOSABDependentPropertiesUpdateContext pendingCropRect](self, "pendingCropRect");
    if (CGRectEqualToRect(v35, *MEMORY[0x1E0C9D648]))
    {
LABEL_6:
      v11 = 1;
      goto LABEL_14;
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_3;
    v24[3] = &unk_1E29FC2C0;
    v27 = a3;
    v25 = v8;
    v26 = self;
    v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v24);
    v12 = v25;
LABEL_13:

    goto LABEL_14;
  }
  -[CNiOSABDependentPropertiesUpdateContext pendingFullscreenImageData](self, "pendingFullscreenImageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (-[CNiOSABDependentPropertiesUpdateContext hasPendingThumbnailImageData](self, "hasPendingThumbnailImageData"))
    {
      -[CNiOSABDependentPropertiesUpdateContext pendingThumbnailImageData](self, "pendingThumbnailImageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContactImageDataZeroCropRect:format:", v16, "watch changes");

      v11 = -[CNiOSABDependentPropertiesUpdateContext setWatchChangesforThumbnailImageDataToPerson:error:](self, "setWatchChangesforThumbnailImageDataToPerson:error:", a3, a5);
      goto LABEL_14;
    }
    if (!-[CNiOSABDependentPropertiesUpdateContext hasPendingSyncImageData](self, "hasPendingSyncImageData"))
      goto LABEL_6;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_23;
    v20 = &unk_1E29FC2C0;
    v21 = v8;
    v22 = self;
    v23 = a3;
    v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)&v17);
    v12 = v21;
    goto LABEL_13;
  }
  v14 = os_log_create("com.apple.contacts", "data-access-error");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[CNiOSABDependentPropertiesUpdateContext flushPendingImageChangesToPerson:logger:error:].cold.1(v14);

  CNSetError(a5, 1015, 0);
  -[CNiOSABDependentPropertiesUpdateContext logIfConditionFailed:message:error:](self, "logIfConditionFailed:message:error:", 0, CFSTR("not permitted to set fullscreen image data"), 0);
  v11 = 0;
LABEL_14:
  -[CNiOSABDependentPropertiesUpdateContext resetAllData](self, "resetAllData", v17, v18, v19, v20);

  return v11;
}

BOOL __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke(uint64_t a1, CFErrorRef *a2)
{
  void *v4;
  void *v5;
  const void *v6;
  const __CFData *v7;
  _BOOL8 v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pendingImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactImageData:", v5);

  v6 = *(const void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "pendingImageData");
  v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v8 = ABPersonSetImageData(v6, v7, a2);

  objc_msgSend(*(id *)(a1 + 40), "logIfConditionFailed:message:error:", v8, CFSTR("failed to set image data"), a2);
  return v8;
}

BOOL __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(*(id *)(a1 + 32), "pendingImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingCropRect");
    objc_msgSend(v5, "setContactImageData:format:cropRect:", v6, "original");

    objc_msgSend(*(id *)(a1 + 32), "pendingImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingCropRect");
    CGRectGetMinX(v25);
    objc_msgSend(*(id *)(a1 + 32), "pendingCropRect");
    CGRectGetMinY(v26);
    objc_msgSend(*(id *)(a1 + 32), "pendingCropRect");
    CGRectGetWidth(v27);
    objc_msgSend(*(id *)(a1 + 32), "pendingCropRect");
    CGRectGetHeight(v28);
    v8 = ABPersonSetImageDataWithCropRect();

    objc_msgSend(*(id *)(a1 + 32), "logIfConditionFailed:message:error:", v8, CFSTR("failed to set image data with crop rect"), a2);
    if (!(_DWORD)v8)
      return 0;
    objc_msgSend(*(id *)(a1 + 32), "pendingThumbnailImageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pendingThumbnailImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContactImageDataZeroCropRect:format:", v11, "thumbnail");

    objc_msgSend(*(id *)(a1 + 32), "pendingThumbnailImageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ABPersonSetImageDataAndCropRect();

    objc_msgSend(*(id *)(a1 + 32), "logIfConditionFailed:message:error:", v13, CFSTR("failed to set thumbnail image data"), a2);
    v14 = 0;
    if ((_DWORD)v13)
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "pendingFullscreenImageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_7;
      v16 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "pendingFullscreenImageData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContactImageDataZeroCropRect:format:", v17, "fullscreen");

      objc_msgSend(*(id *)(a1 + 32), "pendingFullscreenImageData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = ABPersonSetImageDataAndCropRect();

      objc_msgSend(*(id *)(a1 + 32), "logIfConditionFailed:message:error:", v19, CFSTR("failed to set fullscreen image data"), a2);
      v14 = 0;
      if ((_DWORD)v19)
      {
LABEL_7:
        objc_msgSend(*(id *)(a1 + 32), "pendingSyncImageData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "pendingSyncImageData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setContactImageDataZeroCropRect:format:", v22, "sync");

          objc_msgSend(*(id *)(a1 + 32), "pendingSyncImageData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = ABPersonSetImageDataAndCropRect();

          objc_msgSend(*(id *)(a1 + 32), "logIfConditionFailed:message:error:", v14, CFSTR("failed to set sync image data"), a2);
        }
        else
        {
          return 1;
        }
      }
    }
    return v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeContactImageData");
    return ABPersonRemoveImageData(*(ABRecordRef *)(a1 + 48), a2);
  }
}

uint64_t __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFDataRef v4;
  void *v5;
  uint64_t v6;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v4 = ABPersonCopyImageDataWithFormat(*(ABRecordRef *)(a1 + 48), kABPersonImageFormatOriginalSize);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pendingCropRect");
  objc_msgSend(v5, "setContactImageData:format:cropRect:", v4, "original");
  objc_msgSend(*(id *)(a1 + 40), "pendingCropRect");
  CGRectGetMinX(v8);
  objc_msgSend(*(id *)(a1 + 40), "pendingCropRect");
  CGRectGetMinY(v9);
  objc_msgSend(*(id *)(a1 + 40), "pendingCropRect");
  CGRectGetWidth(v10);
  objc_msgSend(*(id *)(a1 + 40), "pendingCropRect");
  CGRectGetHeight(v11);
  v6 = ABPersonSetImageDataWithCropRect();
  objc_msgSend(*(id *)(a1 + 40), "logIfConditionFailed:message:error:", v6, CFSTR("failed to set original image data with crop rect"), a2);

  return v6;
}

uint64_t __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pendingSyncImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContactImageDataZeroCropRect:format:", v3, "sync");

  objc_msgSend(*(id *)(a1 + 40), "pendingSyncImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ABPersonSetImageDataAndCropRect();

  return v5;
}

+ (BOOL)shouldSetWatchChanges
{
  return 0;
}

- (BOOL)setWatchChangesforThumbnailImageDataToPerson:(void *)a3 error:(id *)a4
{
  _QWORD v8[6];

  if (!+[CNiOSABDependentPropertiesUpdateContext shouldSetWatchChanges](CNiOSABDependentPropertiesUpdateContext, "shouldSetWatchChanges"))return 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CNiOSABDependentPropertiesUpdateContext_setWatchChangesforThumbnailImageDataToPerson_error___block_invoke;
  v8[3] = &unk_1E29FC2E8;
  v8[4] = self;
  v8[5] = a3;
  return CNBridgeBoolResultAndErrorFromBlock(a4, (uint64_t)v8);
}

uint64_t __94__CNiOSABDependentPropertiesUpdateContext_setWatchChangesforThumbnailImageDataToPerson_error___block_invoke(uint64_t a1, CFErrorRef *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;

  objc_msgSend(*(id *)(a1 + 32), "pendingThumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingThumbnailImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ABPersonSetImageDataDerivedFromFormatAndReturnError();

    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("failed to set thumbnail image data for watch");
  }
  else
  {
    v6 = ABPersonSetImageData(*(ABRecordRef *)(a1 + 40), 0, a2);
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("failed to clear image data for watch");
  }
  objc_msgSend(v7, "logIfConditionFailed:message:error:", v6, v8, a2);
  return v6;
}

- (BOOL)isUnifiedContact
{
  return self->_isUnifiedContact;
}

- (void)setIsUnifiedContact:(BOOL)a3
{
  self->_isUnifiedContact = a3;
}

- (NSData)pendingImageData
{
  return self->_pendingImageData;
}

- (CGRect)pendingCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pendingCropRect.origin.x;
  y = self->_pendingCropRect.origin.y;
  width = self->_pendingCropRect.size.width;
  height = self->_pendingCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSData)pendingThumbnailImageData
{
  return self->_pendingThumbnailImageData;
}

- (NSData)pendingFullscreenImageData
{
  return self->_pendingFullscreenImageData;
}

- (void)setPendingFullscreenImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)pendingSyncImageData
{
  return self->_pendingSyncImageData;
}

- (BOOL)hasPendingImageData
{
  return self->_hasPendingImageData;
}

- (void)setHasPendingImageData:(BOOL)a3
{
  self->_hasPendingImageData = a3;
}

- (BOOL)hasPendingCropRect
{
  return self->_hasPendingCropRect;
}

- (void)setHasPendingCropRect:(BOOL)a3
{
  self->_hasPendingCropRect = a3;
}

- (BOOL)hasPendingThumbnailImageData
{
  return self->_hasPendingThumbnailImageData;
}

- (void)setHasPendingThumbnailImageData:(BOOL)a3
{
  self->_hasPendingThumbnailImageData = a3;
}

- (BOOL)hasPendingSyncImageData
{
  return self->_hasPendingSyncImageData;
}

- (void)setHasPendingSyncImageData:(BOOL)a3
{
  self->_hasPendingSyncImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSyncImageData, 0);
  objc_storeStrong((id *)&self->_pendingFullscreenImageData, 0);
  objc_storeStrong((id *)&self->_pendingThumbnailImageData, 0);
  objc_storeStrong((id *)&self->_pendingImageData, 0);
}

- (void)logIfConditionFailed:(uint64_t)a1 message:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = ABLogErrorPtr();
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "flushPendingImageChangesToPerson, %{public}@, error = %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)flushPendingImageChangesToPerson:(os_log_t)log logger:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Cannot set fullscreen image data only", v1, 2u);
}

@end
